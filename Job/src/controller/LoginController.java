package controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/login")
public class LoginController {
	
	// 페이스북 연동하기
	@RequestMapping("/fb")
	public ModelAndView fbSignUpHandler(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main", "signUp/step02");
		return mav;
	}
	
	// 로그인 선택창
	@RequestMapping("/form")
	public ModelAndView loginFormHandler(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main", "/login/form");
		return mav;
	}
}