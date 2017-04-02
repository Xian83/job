package controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
		List<HashMap> rank = rdao.rank();	
		List <HashMap> list = rdao.list();
		// review = addPicture(review); 				// add picURL
		System.out.println("reviews>>>>" + review);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main","review/list_form");
		mav.addObject("page", page);
		mav.addObject("size", size);
		mav.addObject("review", review);
		mav.addObject("rank",rank);
		System.out.println("rank =" + rank);
		
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
				picURL = "/image/default.jpg";
			obj.put("picURL", picURL);
		}
		return review;
	}
	
	// review search Ajax 
	@RequestMapping("/search")
	@ResponseBody
	public ModelAndView searchHandler(@RequestParam(name="CName") String CName, @RequestParam(name="page", defaultValue="1")String page) {
		
		System.out.println("넘어온 파람 = " +CName + "/" + page);
		// 기업명 기준으로 DB에서 데이터 가져오기
		List list_search = rDao.List_search(CName); 
		System.out.println("리뷰용 list_search = " + list_search);
		
		// 기업명 기준으로 DB에서 cnt 데이터 가져오기
		int list_cnt = rDao.List_cnt(CName);
		System.out.println("리뷰용 list_cnt = " + list_cnt);

	
		int size = list_cnt % 20 == 0 ? list_cnt / 20 : list_cnt / 20 + 1; // 총 페이지 수
		String pStr = page == null ? "1" : page;

		
		// 상세 검색 목록 뷰
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main","review/reviewAjax");
		mav.addObject("list", list_search);
		mav.addObject("page", pStr);
		
		mav.addObject("size", size);
		mav.addObject("cnt", list_cnt);
		//mav.addObject("key", sdao.getParam(req)); // paging 처리용
		return mav;
	}
}

