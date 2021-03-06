package controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import model.CompareDao;
import model.MyInfoDao;
import model.ReviewsDao;

@Controller
@RequestMapping("/review")
public class ReviewsController {

	@Autowired
	ReviewsDao rdao;
	
	@Autowired
	MyInfoDao myDao;
	
	@Autowired
	CompareDao cDao;
	
	@Autowired
	ReviewsDao rDao;
	
	@RequestMapping("/list_form")
	public ModelAndView reviewsHandler(@RequestParam(name="page", defaultValue="1")String page){
		 
		// paging
		int div = 6;	// review per page
		int cnt = Integer.parseInt(String.valueOf(rdao.totalCount().get("COUNT")));	// total data count
		int size = cnt % div == 0 ? cnt / div : cnt / div + 1;	// page count

		int start = (Integer.parseInt(page) - 1) * div + 1;
		int end = Integer.parseInt(page) * div;
		
		List<HashMap> review = rdao.review(start, end);	// get reviews
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main","review/list_form");
		mav.addObject("page", page);
		mav.addObject("size", size);
		mav.addObject("review", review);
		mav.addObject("cnt",cnt);
		
		return mav;
	}

	
//	@RequestMapping("/push")
//	public ModelAndView reviewsPushHandler(@RequestParam Map map, HttpSession session) throws UnsupportedEncodingException{
//		ModelAndView mav = new ModelAndView();
//		String email = (String)session.getAttribute("email");
//		String content = (String)map.get("content");
//		String company = (String)map.get("cmpn_nm");
//		
//		rdao.push(company, content, email);
//		
//		mav.setViewName("redirect:/company?cmpn_nm="+URLEncoder.encode(company,"UTF-8"));
//	
//		return mav;
//	}
	
	public List addPicture(List<HashMap> review){
		String email = "";
		String picURL = "";

		for (HashMap obj : review) {
			email = (String) obj.get("EMAIL");
			picURL = myDao.getLastetImageURL(email);
			if (picURL == null || picURL.equals("null"))
				picURL = "/image/default.jpg";
			obj.put("picURL", picURL);
		}
		return review;
	}
	
	// review search Ajax 
	@RequestMapping("/search")
	@ResponseBody
	public ModelAndView searchHandler(@RequestParam(name="CName") String CName, @RequestParam(name="page", defaultValue="1")String page) {
		
		// 기업명 기준으로 DB에서 데이터 개수 가져오기
		int cnt = Integer.parseInt(String.valueOf(rdao.totalCount(CName).get("COUNT")));	// total data count
		
		// 기업명 기준으로 DB에서 로고 가져오기
		List<HashMap> list_logo = rDao.searchLogo(CName);
		
		int div = 6;
		int size = cnt % div == 0 ? cnt / div : cnt / div + 1; // 총 페이지 수
		
		int start = (Integer.parseInt(page) - 1) * div + 1;
		int end = Integer.parseInt(page) * div;
		
//		기업명 기준으로 DB에서 해당 페이지 데이터 가져오기
		List<HashMap> review = rdao.getByName(CName, start, end, list_logo);	// get reviews
		
		// 상세 검색 목록 뷰
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/review/reviewAjax");
		mav.addObject("review", review);
		mav.addObject("page", page);
//		mav.addObject("logo",list_logo);
		mav.addObject("size", size);
		mav.addObject("cnt", cnt);
		mav.addObject("CName", CName);
		return mav;
	}
}

