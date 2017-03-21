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

import model.MemberDao;
import model.MyPageDao;
import model.RecommandDao;

@Controller
@RequestMapping("/my")
public class MyPageController2 {
	@Autowired
	MemberDao mDao;

	@Autowired
	RecommandDao rDao;

	@Autowired
	MyPageDao mypage;

	@RequestMapping("/index")
	public ModelAndView initHandler() {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main", "/my/index");
		return mav;
	}

	@RequestMapping("/recommand")
	public ModelAndView recommandHandler(HttpSession session) {
		String email = (String) session.getAttribute("email");
		Map data = mDao.getInfo(email);
		System.out.println("info : " + data.toString());// 확인용

		List list = rDao.getData(data); //
		for (Object map : list) {
			if (((Map) map).get("LOGO") == null) {
				((Map) map).put("LOGO", "http://image.jinhak.com/job/site/tmp02.gif");
			}
		}

		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main", "/my/recommand");
		mav.addObject("list", list);
		return mav;
	}

	@RequestMapping("/visit")
	public ModelAndView visitHandler(HttpSession session) {
		List<HashMap> list = mypage.getVisitData((String) session.getAttribute("email"));

		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main", "/my/visit");
		mav.addObject("list", list);
		return mav;
	}

	@RequestMapping("/interest")
	public ModelAndView interestHandler(HttpSession session) {
		List<HashMap> list = mypage.getScrapData((String) session.getAttribute("email"));

		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main", "/my/interest");
		mav.addObject("list", list);
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
	
	@RequestMapping("/compare")
	public ModelAndView compareHandler(HttpSession session) {
		List<HashMap> list = mypage.getCompareData((String) session.getAttribute("email"));

		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main", "/my/compare");
		mav.addObject("list", list);
		return mav;
	}
}
