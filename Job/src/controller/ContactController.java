package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/contact")

public class ContactController {
	
	// contact 메인 1페이지
	@RequestMapping("/form")
	public ModelAndView InitHandler1() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main", "contact/form");
		
		return mav;
	}
	
	// contact 메인 2페이지
	@RequestMapping("/form2")
	public ModelAndView InitHandler2() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main", "contact/form2");
		
		return mav;
	}
	
	// contact 기타 페이지
	@RequestMapping("/form_etc")
	public ModelAndView InitHandler3() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main", "contact/form_etc");
		
		return mav;
	}
	
	
}
