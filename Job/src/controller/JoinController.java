package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/join")
public class JoinController {

	// 로그인 선택창
	@RequestMapping("/step01")
	public ModelAndView join01Handler(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main", "/join/step01");
		return mav;
	}
	
	// 로그인 선택창
	@RequestMapping("/step02")
	public ModelAndView join02Handler(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main", "/join/step02");
		return mav;
	}
	
	// 로그인 선택창
	@RequestMapping("/step03")
	public ModelAndView join03Handler(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main", "/join/step03");
		return mav;
	}
}
