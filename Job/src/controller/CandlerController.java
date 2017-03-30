package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/candler")
public class CandlerController {

	@RequestMapping("/applyInfo")
	public ModelAndView link() {
		ModelAndView mav = new ModelAndView("t1");
		mav.addObject("main", "/my/applyInfo");
		return mav;
	}

}
