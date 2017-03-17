package controller;

import java.util.List;

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
		
		List list = rdao.avgsalary();
		mav.addObject("list", list);
		
		return mav;
	}
	
	@RequestMapping("/sortsalary")
	public ModelAndView InitHandler2() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main", "rank/form");
		
		List list = rdao.avgsalary();
		mav.addObject("list", list);
		
		return mav;
	}
	
	@RequestMapping("/sortlocal")
	public ModelAndView InitHandler3(@RequestParam (name="local") String local) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main", "rank/form");
		System.out.println(local);
			if(local.equals("seoul")) {
				local = "서울";
			} else if (local.equals("geonggi")) {
				local = "경기";
			}
		List list = rdao.localsalary(local);
		mav.addObject("list", list);
		
		return mav;
	}

}