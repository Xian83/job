package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.DetailDao;
import model.ReviewsDao;

@Controller
@RequestMapping("/review")
public class ReviewsController {

	@Autowired
	ReviewsDao rdao;
	
	
	@RequestMapping("/list_form")
	public ModelAndView reviewsHandler(){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
//		List reviewList = rdao.review();
//		List scoreList = rdao.score();
//		List salaryList = rdao.salary();
//		mav.addObject("salary",salaryList);
//		mav.addObject("score",scoreList);
//		mav.addObject("review", reviewList);
		mav.addObject("main","reviews/page");
		
		return mav;
	}
}
