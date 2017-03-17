package controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.CompareDao;

@Controller
@RequestMapping("/compare")
public class CompareController {

	@Autowired
	CompareDao cdao;
	
	@RequestMapping("/form")
	public ModelAndView InitHandler(@RequestParam Map map1, Map map2) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main", "compare/form");
		//List listA = cdao.compare(map1);
		//List listB = cdao.compare(map2);
		//mav.addObject("listA", listA);
		//mav.addObject("listB", listB);
		return mav;
	}
	
}
