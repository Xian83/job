package controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.MemberDao;
import model.MyInfoDao;

@Controller
@RequestMapping("/my")
public class MyInfoController {
	
	@Autowired
	MemberDao mdao;
	@Autowired
	MyInfoDao mydao;

	@RequestMapping("/info")
	public ModelAndView infoHandler(HttpSession session, @RequestParam Map data) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main", "my/my_info");
		
		String email = (String) session.getAttribute("email");
		Map map = mdao.getData(email);
		List list = mydao.getlocations();
		List list2 = mydao.getIndustries();
		Map map2 = mydao.getdata(email);
			
		mav.addObject("location", list);
		mav.addObject("industry", list2);
		mav.addObject("infos", map);
		mav.addObject("likeinfos", map2);
		System.out.println("location =" + list);
		System.out.println("map2 =" + map2);
		System.out.println("infos =" + map);
	
		return mav;
	}
	@RequestMapping("/result")
	public ModelAndView resultHandler(HttpSession session, @RequestParam Map data) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main", "my/result");
		
		String email = (String) session.getAttribute("email");
		mydao.update(email);

		System.out.println("파라미터 = " +data);
		return mav;
	}


	
}
