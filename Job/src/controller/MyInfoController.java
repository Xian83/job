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
		
	
		
		mav.addObject("location", list);
		mav.addObject("industry", list2);
		mav.addObject("infos", map);
		for(int i=0; i<2; i++) {
			System.out.println("¸®½ºÆ®?"+list2);
		}
		System.out.println("industry =" + list2);
		System.out.println("map =" + map);
	
		return mav;
	}
	@RequestMapping("/result")
	public ModelAndView resultHandler(@RequestParam Map data) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main", "my/result");
		

		boolean cnt = mydao.insert(data);
		System.out.println("data = " +data);
		return mav;
	}


	
}
