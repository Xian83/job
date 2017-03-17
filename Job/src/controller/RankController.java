package controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.RankDao;

@Controller
@RequestMapping("/rank")
public class RankController {
	
	@Autowired
	RankDao rdao;
	
	@RequestMapping("/form")
	public ModelAndView InitHandler() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main", "rank/form");
		
		List list = rdao.salary();
		List list2 = rdao.avgsalary2(list);
		mav.addObject("list1", list);
		mav.addObject("list2", list2);
		return mav;
	}
	
	@RequestMapping("/avgsalary")
	public ModelAndView InitHandler2(@RequestParam (name="avgsalary") String avg) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main", "rank/form");
		
		List list = rdao.avgsalary(avg);
		mav.addObject("list", list);
		
		return mav;
	}
	
	@RequestMapping("/rookeysalary")
	public ModelAndView InitHandler3(@RequestParam (name="rookeysalary") String rookey) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main", "rank/form");
		
		List list = rdao.rookeysalary(rookey);
		mav.addObject("list", list);
		
		return mav;
	}
	

}