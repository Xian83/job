package controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.MyInfoDao;
import model.ReviewsDao;

@Controller
@RequestMapping("/review")
public class ReviewsController {

	@Autowired
	ReviewsDao rdao;
	
	@Autowired
	MyInfoDao myDao;
	
	@RequestMapping("/list_form")
	public ModelAndView reviewsHandler(@RequestParam(name="page", defaultValue="1")String page){
		 
		// paging
		int div = 6;	// review per page
		int cnt = Integer.parseInt(String.valueOf(rdao.totalCount().get("COUNT")));	// total data count
		int size = cnt % div == 0 ? cnt / div : cnt / div + 1;	// page count

		int start = (Integer.parseInt(page) - 1) * div + 1;
		int end = Integer.parseInt(page) * div;
				
		List<HashMap> review = rdao.review(start, end);	// get reviews
		review = addPicture(review); 				// add picURL
		System.out.println("=====================================? "+review);
		List<HashMap> rank = rdao.rank();				// ?? 				
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main","review/list_form");
		mav.addObject("page", page);
		mav.addObject("size", size);
		mav.addObject("review", review);
		mav.addObject("rank",rank);
		
		return mav;
	}

	
	@RequestMapping("/push")
	public ModelAndView reviewsPushHandler(@RequestParam Map map, HttpSession session) throws UnsupportedEncodingException{
		ModelAndView mav = new ModelAndView();
		String email = (String)session.getAttribute("email");
		String content = (String)map.get("content");
		String company = (String)map.get("cmpn_nm");
		
		rdao.push(company, content, email);
		
		mav.setViewName("redirect:/company/detail?cmpn_nm="+URLEncoder.encode(company,"UTF-8"));
	
		return mav;
	}
	
	public List addPicture(List<HashMap> review){
		String email = "";
		String picURL = "";

		for (HashMap obj : review) {
			email = (String) obj.get("EMAIL");
			picURL = myDao.getLastetImageURL(email);
			if (picURL == null || picURL.equals("null"))
				picURL = "/picture/default.jpg";
			obj.put("picURL", picURL);
		}
		return review;
	}
}

