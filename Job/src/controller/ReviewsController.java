package controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
		List reviewList = rdao.review();
		List rankList = rdao.rank();
//		List salaryList = rdao.salary();
		int size = reviewList.size();
		mav.addObject("size",size);
		mav.addObject("rank",rankList);
//		mav.addObject("score",scoreList);
		mav.addObject("review", reviewList);
		mav.addObject("main","review/list_form");
		
		return mav;
	}

	
	@RequestMapping("/push")
	public ModelAndView reviewsPushHandler(@RequestParam Map map, HttpSession session){
		ModelAndView mav = new ModelAndView();
		String email = (String)session.getAttribute("email");
		String content = (String)map.get("content");
		String company = (String)map.get("cmpn_nm");
		
		rdao.push(company, content, email);
		
		mav.setViewName("t1");
		mav.addObject("main","review/list_form");
		
		
		return mav;
	}
}

