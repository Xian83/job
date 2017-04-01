package controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
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
import org.springframework.web.servlet.ModelAndView;

import model.DetailDao;
import model.GoogleMap;
import model.MemberDao;
import model.MyPageDao;
import model.SalaryDao;
import model.SearchDao;

@Controller
//@RequestMapping("/company")
public class DetailController {
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

//	@RequestMapping("/detail")
	public ModelAndView detailHandler(@RequestParam(name = "cmpn_nm") String companyname, HttpServletResponse response,
			HttpSession session, @CookieValue(name = "cmpn_nm", defaultValue = "") String origin) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("ttt");
		mav.addObject("main", "company/detail_form");
		HashMap totalvisit = ddao.inqurity(companyname);// �쉶�궗 議고쉶�닔 利앷� and 珥� 議고쉶�닔

		// get data by Company name
		HashMap scorelist = ddao.score(companyname);
		HashMap salarylist = ddao.salary(companyname);
		List reviewList = ddao.review(companyname);
		String chartURL = makeChart(ddao.getScore02(companyname));// graph

		// member check & 愿��떖湲곗뾽 �뿬遺� �솗�씤
		String email = (String) session.getAttribute("email");
		if (email == null) {
			email = "visitant";
		} else {
			int a = ddao.checkScrape(companyname, email);
			mav.addObject("scrape", a); // 0 : �븘�떂, 1: 愿��떖湲곗뾽
		}

		// increase visit count to DB
		ddao.insertVisit(companyname, email);
		HashMap rate = ddao.manWomanrate(companyname);
		// get same industry company list (finance score desc)
		String div = (String) scorelist.get("DIVISION");
		List samelist = ddao.same(div);
		// System.out.println("�궛�뾽援� : " + div); //�솗�씤�슜

		// salary info
		HashMap industry = sDao.getSalary(div); // same industry
		HashMap allCompany = sDao.getSalary("all"); // all company
		// System.out.println(industry.get("AVG") + " vs " +
		// industry.get("ROOKIE")); // �솗�씤�슜

		String CompID = search.getCompID(companyname);
		// career catch site data
		HashMap<String, List> info01 = ddao.getInfo01(CompID);
		HashMap<String, Object> info02 = ddao.getInfo02(CompID);

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
		mav.addObject("chartURL", chartURL); // 諛⑹궗�삎 洹몃옒�봽 二쇱냼
		mav.addObject("rate", rate); // �긽�꽭�럹�씠吏�瑜� �겢由��븳 �궓��鍮꾩쑉 hashmap(man, woman)
		mav.addObject("total", totalvisit); // �쟾泥� 議고쉶�닔 hashmap(sum)

		// 荑좏궎�깮�꽦
		String[] arr = origin.split("#"); // 遊ㅻ뜕 荑좏궎 紐⑸줉
		// �씠 諛곗뿴�뿉 companyname �씠 媛믪씠 �엳�깘 �뾾�깘..
		// 諛곗뿴�뿉 �뾾�뒗 �쉶�궗紐낆씪�븣留� origin+"#"+companyname �씠嫄몃줈 荑좏궎瑜� �쟾�넚�쓣 �떆耳�
		// System.out.println("origin="+origin);
		boolean rst = false;
		for (String cc : arr) {
			if (cc.equals(companyname)) {
				rst = true;
				break;
			}
		}

		if (rst == false) {
			origin = companyname + "#" + origin;
			Cookie c = new Cookie("cmpn_nm", origin);
			c.setPath("/");
			response.addCookie(c);
			// System.out.println("coo="+origin);
		}

		// 荑좏궎泥섎━
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

		// 濡쒓렇�씤�뻽�쓣�븣 異붿쿇由ъ뒪�듃異붽�
		String auth = (String) session.getAttribute("auth");

		if (auth != null && auth.equals("yes")) {
			HashMap data = mDao.getInfo(email); // get data from member_Info
												// table
			List reco = mypage.getRecommand(data); // get data from
													// mongoDB(company)
			List list_r = mypage.getRecommand02(reco); // get data from score &
														// salary table

			mav.addObject("member", data); // 愿��떖吏��뿭(AREA),�궛�뾽援�(STNDD_BIG_GB),
											// �뿰遊뎜in/max
			mav.addObject("list_r", list_r);
			System.out.println("異붿쿇 = " + list_r);
		}

		return mav;
	}

//	@RequestMapping("/interest")
	public ModelAndView interestHandler(@RequestParam(name = "cmpn_nm") String companyname,
			HttpServletResponse response, HttpSession session) throws UnsupportedEncodingException {
		ModelAndView mav = new ModelAndView();
		int a = ddao.insertInterest(companyname, (String) session.getAttribute("email"));
		mav.addObject("scrape", a);
		mav.setViewName("redirect:/company/detail?cmpn_nm=" + URLEncoder.encode(companyname, "UTF-8"));
		return mav;
	}

	public String makeChart(HashMap data1) {
		int size = 500;
		String img = "https://chart.googleapis.com/chart?cht=r&chs=" + size + "x" + size;

		img += "&chd=t:";
		img += data1.get("LABEL01") + "," + data1.get("LABEL02") + "," + data1.get("LABEL03") + ",";
		img += data1.get("LABEL04") + "," + data1.get("LABEL05") + "," + data1.get("LABEL06") + ",";
		img += data1.get("LABEL07") + "," + data1.get("LABEL08") + "," + data1.get("LABEL09") + ","
				+ data1.get("LABEL01");
		// img += "&chco=#FF0000"; // �꽑 �깋源�
		img += "&chls=2.0,4.0,0.0&chxt=x";
		img += "&chxl=0:|洹쒕え쨌�삎�깭|�븞�젙�꽦|�꽦�옣�꽦|�닔�씡�꽦|議곗쭅臾명솕쨌遺꾩쐞湲�|湲됱뿬쨌蹂듬━�썑�깮|洹쇰Т�떆媛꽷룻쑕媛�|�꽦�옣쨌寃쎈젰|寃쎌쁺吏꽷룰꼍�쁺";
		img += "&chxr=0,0.0,360.0";
		return img;
	}

//	@RequestMapping("/basic_info")
	public ModelAndView basicInfoHandler(@RequestParam(name = "cmpn_nm", defaultValue = "컴투스") String CName,
			HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main", "/company/basic_info");

		HashMap totalvisit = ddao.inqurity(CName);// �쉶�궗 議고쉶�닔 利앷� and 珥� 議고쉶�닔

		// get data by Company name
		HashMap scorelist = ddao.score(CName);
		HashMap salarylist = ddao.salary(CName);
		List reviewList = ddao.review(CName);
		String chartURL = makeChart(ddao.getScore02(CName));// graph

		// member check & 愿��떖湲곗뾽 �뿬遺� �솗�씤
		String email = (String) session.getAttribute("email");
		if (email == null) {
			email = "visitant";
		} else {
			int a = ddao.checkScrape(CName, email);
			mav.addObject("scrape", a); // 0 : �븘�떂, 1: 愿��떖湲곗뾽
		}

		// increase visit count to DB
		ddao.insertVisit(CName, email);
		HashMap rate = ddao.manWomanrate(CName);
		// get same industry company list (finance score desc)
		String div = (String) scorelist.get("DIVISION");
		List samelist = ddao.same(div);
		// System.out.println("�궛�뾽援� : " + div); //�솗�씤�슜

		// salary info
		HashMap industry = sDao.getSalary(div); // same industry
		HashMap allCompany = sDao.getSalary("all"); // all company
		// System.out.println(industry.get("AVG") + " vs " +
		// industry.get("ROOKIE")); // �솗�씤�슜

		String CompID = search.getCompID(CName);
		// career catch site data
		HashMap<String, List> info01 = ddao.getInfo01(CompID);
		HashMap<String, Object> info02 = ddao.getInfo02(CompID);

		// 1二쇱씪媛� 議고쉶�닔 洹몃옒�봽
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
		mav.addObject("info02", info02);// HashMap (summary, address, system, culture)
		mav.addObject("json", google.map((String) info02.get("address")));
		mav.addObject("chartURL", chartURL); // 諛⑹궗�삎 洹몃옒�봽 二쇱냼
		mav.addObject("rate", rate); // �긽�꽭�럹�씠吏�瑜� �겢由��븳 �궓��鍮꾩쑉 hashmap(man, woman)
		mav.addObject("total", totalvisit); // �쟾泥� 議고쉶�닔 hashmap(sum)
		mav.addObject("vList", vList); // 理쒓렐 1二쇱씪媛� 議고쉶�닔 蹂��솕 洹몃옒�봽�슜
		
		return mav;
	}
}