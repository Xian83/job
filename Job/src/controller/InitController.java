package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class InitController {
//	@RequestMapping("/index")
	@RequestMapping({"/", "/index", "/index.jsp"})
	public ModelAndView InitHandler(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("root");
		return mav;
	}
}
