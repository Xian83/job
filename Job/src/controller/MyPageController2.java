package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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

	@RequestMapping("/index")
	public ModelAndView initHandler() {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("tt");
		mav.addObject("main", "/my/index");
		return mav;
	}

	@RequestMapping("/lately")
	public ModelAndView latelyHandler(HttpSession session) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("tt");
		mav.addObject("main", "/my/lately");

		String email = (String) session.getAttribute("email");
		// 사진 추가
		String picURL = mydao.getLastetImageURL(email);
		if (picURL == null || picURL.equals("null"))
			picURL = "/picture/default.jpg";
		
		return mav;
	}
	
	@RequestMapping("/recommand")
	public ModelAndView recommandHandler(HttpSession session) {
		String email = (String) session.getAttribute("email");
		
		// get member info data
		//(WKP_ADRS, STNDD_BIG_GB, SALARY_MIN, SALARY_MAX)
		HashMap data = mDao.getInfo(email); 
		System.out.println("info : " + data.toString());// 확인용

		//추천기업 정보 가져오기 
		List reco = mypage.getRecommand(data); // CMPN_NM, Salary 정보 가져옴
		// score db에서 cmpn_nm 기준으로 데이터 가져오기
//		List list = detail.getScoreData(reco);
		
//		for (Object map : list) {
//			if (((Map) map).get("LOGO") == null) {
//				((Map) map).put("LOGO", "http://image.jinhak.com/job/site/tmp02.gif");
//			}
//		}
//
		ModelAndView mav = new ModelAndView();
		mav.setViewName("tt");
		mav.addObject("main", "/my/recommand");
//		mav.addObject("list", list);
//		
//		// 사진 추가
//		String picURL = mydao.getLastetImageURL(email);
//		if (picURL == null || picURL.equals("null"))
//			picURL = "/picture/default.jpg";
		
		return mav;
	}

	@RequestMapping("/visit")
	public ModelAndView visitHandler(HttpSession session) {
		List<HashMap> list = mypage.getVisitData((String) session.getAttribute("email"));

		ModelAndView mav = new ModelAndView();
		mav.setViewName("tt");
		mav.addObject("main", "/my/visit");
		mav.addObject("list", list);
		
		String email = (String) session.getAttribute("email");
		// 사진 추가
		String picURL = mydao.getLastetImageURL(email);
		if (picURL == null || picURL.equals("null"))
			picURL = "/picture/default.jpg";
		
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
			picURL = "/picture/default.jpg";
	
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
	
	@RequestMapping("/scrap")
	public ModelAndView scrapHandler(HttpSession session) {
		List<HashMap> list = mypage.getCompareData((String) session.getAttribute("email"));

		ModelAndView mav = new ModelAndView();
		mav.setViewName("tt");
		mav.addObject("main", "/my/scrap");
		mav.addObject("list", list);
		
		String email = (String) session.getAttribute("email");
		// 사진 추가
		String picURL = mydao.getLastetImageURL(email);
		if (picURL == null || picURL.equals("null"))
			picURL = "/picture/default.jpg";
		return mav;
	}
	
	@RequestMapping("/compare")
	public ModelAndView compareHandler(HttpSession session) {
		List<HashMap> list = mypage.getCompareData((String) session.getAttribute("email"));

		ModelAndView mav = new ModelAndView();
		mav.setViewName("tt");
		mav.addObject("main", "/my/compare");
		mav.addObject("list", list);
		
		String email = (String) session.getAttribute("email");
		// 사진 추가
		String picURL = mydao.getLastetImageURL(email);
		if (picURL == null || picURL.equals("null"))
			picURL = "/picture/default.jpg";

		return mav;
	}
	

}
