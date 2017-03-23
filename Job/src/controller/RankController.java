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
		List list = rdao.avgsalary(50);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main", "rank/form");
		mav.addObject("list", list);
				
		return mav;
	}

	// ���� ���Կ���
	@RequestMapping("/rookeysalary")
	public ModelAndView InitHandler2() {
		List list = rdao.rookiesalary(50);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main", "rank/rookeysalary");
		mav.addObject("list", list);
		
		return mav;
	}

	// 재무평가
	@RequestMapping("/financescore")
	public ModelAndView InitHandler3() {
		List list = rdao.financeScore(50);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main", "rank/financescore");
		mav.addObject("list", list);
		return mav;
	}

	// 재직자 평가 점수
	@RequestMapping("/slavescore")
	public ModelAndView InitHandler4() {
		List list = rdao.employeeScore(50);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main", "rank/slavescore");
		mav.addObject("list", list);
		return mav;
	}

}