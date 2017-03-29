package controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import model.FileUploadDao;

import model.DetailDao;
import model.MemberDao;
import model.MyInfoDao;
import model.MyPageDao;

@Controller
@RequestMapping("/my")
public class MyPageController2 {
	@Autowired
	MemberDao mDao;

	@Autowired
	MyPageDao mypage;

	@Autowired
	MyInfoDao mydao;

	@Autowired
	DetailDao detail;

	@Autowired
	FileUploadDao fdao;
	
	@Autowired
	MemberDao mdao;
	

	
	@RequestMapping("/result")
	public ModelAndView resultHandler(HttpServletResponse response, HttpSession session, @RequestParam Map data) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main", "/my/result");

		String email = (String) session.getAttribute("email");
		data.put("email", email);
		int rst = mydao.update(data);	
		
		// Changing New Password 
		Map map = mdao.getData(email);
		String pass1 = (String) map.get("PASS");
		String pass = (String) data.get("passcheck");
		if(pass == "") {
			pass = pass1;
		} if (pass != null && pass1 != pass) {
		Map m = new HashMap<>();
			m.put("pass", pass);
			m.put("email", email);
		int rst2 = mydao.updatePass(m);
		}
		
		
		String birth = (String) data.get("birth");
		Map b = new HashMap<>();
			b.put("birth", birth);
			b.put("email", email);
		int rst3 = mydao.updateBirth(b);

		mav.addObject("msg", "개인정보가 변경되었습니다");

		
	mav.addObject("url2", "/my/edit");
	mav.setViewName("util/alert");

		
		
		
		//response.sendRedirect("/my/edit");
		return mav;
	}

	
	
	@RequestMapping("/leave_form")
	public ModelAndView leave_formHandler(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main", "/my/leave_form");
		
		return mav;
	}
	
	// return result by ajax - 탈퇴 처리 / 비밀번호 3회 오류시, 자동로그아웃 기능 추가 필요
	   @ResponseBody
	   @RequestMapping("/leave_result")
	   public boolean leave_resultHandler(HttpSession session, @RequestParam(name="pass") String pass ) {
//	      ModelAndView mav = new ModelAndView();
//	      mav.setViewName("tt");
//	      mav.addObject("main", "/my/leave_result");
	      
	      String email = (String) session.getAttribute("email");
	      int cnt = (int) session.getAttribute("leave_try");
	      
	      // email, pass check 
	      HashMap data = new HashMap<>();
	      data.put("email", email);
	      data.put("pass", pass);
	      boolean res = mdao.existCheck(data);
	      
	      // increase password error count up
	      if(!res)
	         session.setAttribute("leave_try", cnt++);
	    	  
	      return res;
	   }

	@RequestMapping("/edit")
	public ModelAndView my_editHandler(HttpSession session) throws Exception {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main", "/my/edit");

		String email = (String) session.getAttribute("email");
		
		// 사진 불러오기
		String picURL = mydao.getLastetImageURL(email);
		if (picURL == null || picURL.equals("null"))
			picURL = "/image/default.jpg";
		mav.addObject("picURL", picURL);
		
		// 개인정보 변경
		Map map = mdao.getData(email); // 湲곕낯�젙蹂�
		Map map2 = mydao.getdata(email); // 異붽��젙蹂�
		List list = mydao.getlocations(); // 愿��떖吏��뿭
		List list2 = mydao.getIndustries(); // 愿��떖�궛�뾽援�
		
		mav.addObject("picURL", picURL);
		mav.addObject("location", list);
		mav.addObject("industry", list2);
		mav.addObject("infos", map);
		mav.addObject("likeinfos", map2);

		return mav;
	}
	
	
	@RequestMapping("/company")
	public ModelAndView my_companyHandler(HttpServletResponse response, HttpSession session, @RequestParam Map map) throws Exception {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main", "/my/company");

		String email = (String) session.getAttribute("email");

		// 최근 본 기업(lately) : 별다른 추가 정보 없음

		// 추천 기업(recommand)
		/*// member_Info(WKP_ADRS, STNDD_BIG_GB, SALARY_MIN, SALARY_MAX)
		HashMap data = mDao.getInfo(email);
		System.out.println("info : " + data.toString());// 확인용

		// 추천기업 정보 가져오기
		List reco = mypage.getRecommand(data); // CMPN_NM, Salary 정보 가져옴
		// score db에서 cmpn_nm 기준으로 데이터 가져오기
		List list_r = detail.getScoreData(reco);

		for (Object map : list_r) {
			if (((Map) map).get("LOGO") == null) {
				((Map) map).put("LOGO", "/image/default_logo.png");
			}
		}
		mav.addObject("list_r", list_r);

		System.out.println("추천 = " + list_r);*/



		// 자주 본 기업(visit) - 데이터 잘 안 넘어 옴
		List<HashMap> list_v = mypage.getVisitData(email);
		mav.addObject("list_v", list_v);

		System.out.println("자주 본 기업 visit= " + list_v);


		// 스크랩한 기업(scrap)
		List<HashMap> list_s = mypage.getScrapData(email);
		mav.addObject("list_s", list_s);
		System.out.println("스크랩 = " + list_s);

		//System.out.println("email = "+email);
		
		String email2 = (String) map.get("email");
		String company = (String) map.get("company");
		boolean rst = mypage.deleteScrap(email, company);
		if (rst)
			response.sendRedirect("/my/company");
		

		// 비교한 기업(compare)
		List<HashMap> list_c = mypage.getCompareData(email);
		mav.addObject("list_c", list_c);
		System.out.println("비교 compare = " + list_c);

		// 사진 불러오기
		String picURL = mydao.getLastetImageURL(email);
		if (picURL == null || picURL.equals("null"))
			picURL = "/image/default.jpg";
		//System.out.println("picURL = " + picURL);
		mav.addObject("picURL", picURL);
	

		// 사진 등록
		String url = (String) session.getAttribute("url");
		System.out.println("사진 url =" + url);
		/*
		 * String ct = file.getContentType(); if (ct.startsWith("image")) { //
		 * �뙆�씪 �뾽濡쒕뱶 Map map = fdao.execute(file); System.out.println("map = "
		 * + map);
		 * 
		 * // DB 사진 추가 email = req.getParameter("email"); String url = (String)
		 * map.get("filelink"); mav.addObject("url", url);
		 * System.out.println("url = " + url); boolean res = fdao.insert(email,
		 * url); if (res) mav.addObject("msg", "프로필 사진이 변경되었습니다"); else
		 * mav.addObject("msg", "프로필 사진 등록에 실패하였습니다"); } else {
		 * mav.addObject("msg", "Not Image File"); }
		 * 
		 * mav.addObject("url2", "/my/company"); mav.setViewName("util/alert");
		 */

		return mav;
	}

	@RequestMapping("/update_pic")
	public ModelAndView update_pic(@RequestParam(name = "pic") MultipartFile file, HttpSession session,
			MultipartHttpServletRequest req) throws Exception {
		ModelAndView mav = new ModelAndView();

		// �궗吏� ���엯�씤 寃쎌슦留� �뾽濡쒕뱶 吏꾪뻾
		String ct = file.getContentType();
		if (ct.startsWith("image")) {
			// �뙆�씪 �뾽濡쒕뱶
			Map map = fdao.execute(file);

			// 사진 불러오기
			String email = req.getParameter("email");
			String picURL = mydao.getLastetImageURL(email);
			if (picURL == null || picURL.equals("null"))
				picURL = "/image/default.jpg";
			mav.addObject("picURL", picURL);
			System.out.println("업데이트 picURL = " + picURL);
			
			System.out.println("map = " + map);

			// DB 사진 추가
			String url = (String) map.get("filelink");
			mav.addObject("url", url);


			boolean res = fdao.insert(email, url);
			if (res)
				mav.addObject("msg", "프로필 사진이 변경되었습니다");
			else
				mav.addObject("msg", "프로필 사진 등록에 실패하였습니다");
		} else {
			mav.addObject("msg", "Not Image File");
		}	
		mav.addObject("url2", "/my/edit");
		mav.setViewName("util/alert");
		return mav;

	}

	@RequestMapping("/interest")
	public ModelAndView interestHandler(HttpSession session) {
		List<HashMap> list = mypage.getScrapData((String) session.getAttribute("email"));

		ModelAndView mav = new ModelAndView();
		mav.setViewName("tt");
		mav.addObject("main", "/my/interest");
		mav.addObject("list", list);

		String email = (String) session.getAttribute("email");
		// 사진 추가
		String picURL = mydao.getLastetImageURL(email);
		if (picURL == null || picURL.equals("null"))
			picURL = "/image/default.jpg";

		return mav;
	}

	@ResponseBody
	@RequestMapping("/interestAjax")
	public Map interestAjaxHandler(@RequestParam(value = "name", required = true) List<String> name) {

		// checked Value 가져오기
		int i = 0;
		for (String value : name) {
			System.out.println(">>> name's value : " + value);
			i++;
		}

		Map result = new HashMap();
		return result;
	}

	@RequestMapping("/reco")
	public void testHandler(HttpSession session) {
		String email = (String) session.getAttribute("email");
		
		// 추천 기업(recommand)
		// member_Info(WKP_ADRS, STNDD_BIG_GB, SALARY_MIN, SALARY_MAX)
		HashMap data = mDao.getInfo(email);
		System.out.println("info : " + data.toString());// 확인용

		// 추천기업 정보 가져오기
		List reco = mypage.getRecommand(data);
		
		// score db에서 cmpn_nm 기준으로 데이터 가져오기
		List list_r = detail.getScoreData(reco);

		for (Object map : list_r) {
			if (((Map) map).get("LOGO") == null) {
				((Map) map).put("LOGO", "/image/default_logo.png");
			}
		}
		System.out.println("추천 = " + list_r);
		
		// 최종
		// 관심지역, 산업군, 연봉 정보
		// 기업명, 연봉, 로고
		

	}
}
