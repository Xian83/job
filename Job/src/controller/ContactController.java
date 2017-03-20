package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/contact")

public class ContactController {
	
	// contact 메인
	@RequestMapping("/form")
	public ModelAndView InitHandler1() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main", "contact/form");
		
		return mav;
	}
	
	
	@RequestMapping("/form2")
	public ModelAndView InitHandler2() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main", "contact/form2");
		
		return mav;
	}
	/*// addr
	
	@RequestMapping("/addr")
	public ModelAndView InitHandler1() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main", "contact/addr");
		
		return mav;
	}
	
	@RequestMapping("/addrRst")
	public ModelAndView InitHandler2() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main", "contact/addrRst");
		
		return mav;
	}*/
}
