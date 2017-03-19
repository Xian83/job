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
	
	// 순위 기본페이지 - 평균연봉
	@RequestMapping("/form")
	public ModelAndView InitHandler() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main", "rank/form");
		
		List list = rdao.avgsalary();
		List list2 = rdao.search(list);
		mav.addObject("list1", list);
		mav.addObject("list2", list2);
		return mav;
	}
	
	
	// 순위 신입연봉
	@RequestMapping("/rookeysalary")
	public ModelAndView InitHandler2() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main", "rank/rookeysalary");
		
		List list = rdao.rookeysalary();
		List list2 = rdao.search(list);
		mav.addObject("list1", list);
		mav.addObject("list2", list2);
		return mav;
	}
	
	// 순위 재무평가
	@RequestMapping("/financescore")
	public ModelAndView InitHandler3() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main", "rank/financescore");
		
		List list = rdao.rookeysalary();
		List list2 = rdao.search(list);
		mav.addObject("list1", list);
		mav.addObject("list2", list2);
		return mav;
	}
	
	// 순위 재직자평가
		@RequestMapping("/slavescore")
		public ModelAndView InitHandler4() {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("t1");
			mav.addObject("main", "rank/slavescore");
			
			List list = rdao.rookeysalary();
			List list2 = rdao.search(list);
			mav.addObject("list1", list);
			mav.addObject("list2", list2);
			return mav;
		}

}