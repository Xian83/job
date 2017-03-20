package controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
	public ModelAndView infoHandler(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main", "my/my_info");
		
		String email = (String) session.getAttribute("email");
		Map map = mdao.getData(email);
		List list = mydao.getlocations();
		
		mav.addObject("location", list);
		mav.addObject("infos", map);
		
		System.out.println("map =" + map);
	
		return mav;
	}


	
}
