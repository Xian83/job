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

	// rank page main
	@RequestMapping("/form")
	public ModelAndView InitHandler() {
		List list1 = rdao.avgsalary(50);
		List list2 = rdao.rookiesalary(50);
		List list3 = rdao.financeScore(50);
		List list4 = rdao.employeeScore(50);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main", "rank/form");
		mav.addObject("avg", list1);
		mav.addObject("rookie", list2);
		mav.addObject("finance", list3);
		mav.addObject("employee", list4);
				
		return mav;
	}

}