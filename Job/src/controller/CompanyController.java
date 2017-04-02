package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import model.DetailDao;
import model.GoogleMap;
import model.MemberDao;
import model.MyPageDao;
import model.ReviewsDao;
import model.SalaryDao;
import model.SearchDao;

@Controller
public class CompanyController {
	@Autowired
	DetailDao ddao;

	@Autowired
	SalaryDao sDao;

	@Autowired
	SearchDao search;

	@Autowired
	GoogleMap google;

	@Autowired
	MemberDao mDao;

	@Autowired
	MyPageDao mypage;
	
	@Autowired
	ReviewsDao rDao;

	@RequestMapping("/company")
	public ModelAndView detailHandler(@RequestParam(name = "cmpn_nm") String CName, HttpServletResponse response,
			HttpSession session, @CookieValue(name = "cmpn_nm", defaultValue = "") String origin) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("company");
		mav.addObject("main", "/company/info");
		HashMap totalvisit = ddao.inqurity(CName);// 회사 조회수 증가 and 총 조회수

		// get data by Company name
		HashMap scorelist = ddao.score(CName);
		HashMap salarylist = ddao.salary(CName);
		List reviewList = ddao.review(CName);
		String chartURL = makeChart(ddao.getScore02(CName));// graph

		// member check & 관심기업 여부 확인
		String email = (String) session.getAttribute("email");
		if (email == null) {
			email = "visitant";
		} else {
			int a = ddao.checkScrape(CName, email);
			mav.addObject("scrap", a); // 0 : 아님, 1: 관심기업
		}

		// increase visit count to DB
		ddao.insertVisit(CName, email);
		HashMap rate = ddao.manWomanrate(CName);
		// get same industry company list (finance score desc)
		String div = (String) scorelist.get("DIVISION");
		List samelist = ddao.same(div);
		// System.out.println("산업군 : " + div); //확인용

		// salary info
		HashMap industry = sDao.getSalary(div); // same industry
		HashMap allCompany = sDao.getSalary("all"); // all company
		// System.out.println(industry.get("AVG") + " vs " +
		// industry.get("ROOKIE")); // 확인용

		String CompID = search.getCompID(CName);
		// career catch site data
		HashMap<String, List> info01 = ddao.getInfo01(CompID);
		HashMap<String, Object> info02 = ddao.getInfo02(CompID);

		// 1주일간 조회수 그래프
		List<HashMap> visitgraph = mypage.visitgraph(CName);
		ArrayList vList = new ArrayList();
		for (HashMap map : visitgraph) {
			vList.add(map.get("NUM"));
		}

		// data set for view
		mav.addObject("score", scorelist);
		mav.addObject("same", samelist);
		mav.addObject("review", reviewList);
		mav.addObject("salary", salarylist);
		mav.addObject("industry", industry); // HashMap(avg, rookie)
		mav.addObject("allCompany", allCompany);// HashMap(avg, rookie)
		mav.addObject("info01", info01);// HashMap<List>(rank8, employee, scale)
		mav.addObject("info02", info02);// HashMap (summary, address, system,
										// culture)
		mav.addObject("json", google.map((String) info02.get("address")));
		mav.addObject("chartURL", chartURL); // 방사형 그래프 주소
		mav.addObject("rate", rate); // 상세페이지를 클릭한 남녀비율 hashmap(man, woman)
		mav.addObject("total", totalvisit); // 전체 조회수 hashmap(sum)
		mav.addObject("vList", vList); // 최근 1주일간 조회수 변화 그래프용

		// 쿠키생성
		String[] arr = origin.split("#"); // 봤던 쿠키 목록
		// 이 배열에 companyname 이 값이 있냐 없냐..
		// 배열에 없는 회사명일때만 origin+"#"+companyname 이걸로 쿠키를 전송을 시켜
		// System.out.println("origin="+origin);
		boolean rst = false;
		for (String cc : arr) {
			if (cc.equals(CName)) {
				rst = true;
				break;
			}
		}
		if (rst == false) {
			origin = CName + "#" + origin;
			Cookie c = new Cookie("cmpn_nm", origin);
			c.setPath("/");
			response.addCookie(c);
			// System.out.println("coo="+origin);
		}

		// 쿠키처리
		List<String> cookielist = new ArrayList<>();
		if (!origin.equals("")) {
			String[] ar = origin.split("#");
			for (String a : ar) {
				if (a.equals(""))
					continue;
				cookielist.add(a);
			}
		}
		int csize = cookielist.size();
		/*
		 * System.out.println("clist="+cookielist);
		 * System.out.println("csize="+csize);
		 */
		mav.addObject("clist", cookielist);
		mav.addObject("csize", csize);

		// 로그인했을때 추천리스트추가
		String auth = (String) session.getAttribute("auth");

		if (auth != null && auth.equals("yes")) {
			HashMap data = mDao.getInfo(email); // get data from member_Info
												// table
			List reco = mypage.getRecommand(data); // get data from
													// mongoDB(company)
			List list_r = mypage.getRecommand02(reco); // get data from score &
														// salary table

			mav.addObject("member", data); // 관심지역(AREA),산업군(STNDD_BIG_GB),
											// 연봉min/max
			mav.addObject("list_r", list_r);
			System.out.println("추천 = " + list_r);
		}

		return mav;
	}

	@ResponseBody
	@RequestMapping("/company/scrap")
	public int scrapHandler(@RequestParam(name = "cmpn_nm") String CName, HttpSession session) {
		int rst = ddao.insertInterest(CName, (String) session.getAttribute("email"));
//		System.out.println("스크랩 결과 " + rst);
		return rst;
	}

	public String makeChart(HashMap data1) {
		int size = 500;
		String img = "https://chart.googleapis.com/chart?cht=r&chs=" + size + "x" + size;

		img += "&chd=t:";
		img += data1.get("LABEL01") + "," + data1.get("LABEL02") + "," + data1.get("LABEL03") + ",";
		img += data1.get("LABEL04") + "," + data1.get("LABEL05") + "," + data1.get("LABEL06") + ",";
		img += data1.get("LABEL07") + "," + data1.get("LABEL08") + "," + data1.get("LABEL09") + ","
				+ data1.get("LABEL01");
		// img += "&chco=#FF0000"; // 선 색깔
		img += "&chls=2.0,4.0,0.0&chxt=x";
		img += "&chxl=0:|규모·형태|안정성|성장성|수익성|조직문화·분위기|급여·복리후생|근무시간·휴가|성장·경력|경영진·경영";
		img += "&chxr=0,0.0,360.0";
		return img;
	}

	@RequestMapping("/company/upload")
	public ModelAndView reviewUploadHandler(@RequestParam(name = "cmpn_nm") String CName,
			@RequestParam(name = "content") String content, @RequestParam(name="rate")int rate, HttpSession session) {
		
		
		String email = (String)session.getAttribute("email");
//		System.out.println("rate : " + rate);
//		System.out.println("이메일 : " + email);
		
		int rst = rDao.push(CName, content, email, rate);
		List reviewList = ddao.review(CName);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/company/review_list");
		mav.addObject("review", reviewList);
		mav.addObject("cnt", rst);
		return mav;
	}
}