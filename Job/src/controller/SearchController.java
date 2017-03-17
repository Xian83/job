package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.SearchDao;

@Controller
@RequestMapping("/search")
public class SearchController {
	
	@Autowired
	SearchDao sdao;
	
	// 湲곗뾽紐낆쑝濡� 寃��깋 
	@RequestMapping("/company")
	public ModelAndView search1Handler(HttpServletRequest request, @RequestParam (name="search", defaultValue="삼성") String search) throws IOException{
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main", "search/list_form");
		
		List list = sdao.search1(search);
		System.out.println(list);
		mav.addObject("list", list);
		mav.addObject("listSize", list.size());
		int cnt = list.size();


		int size = cnt % 20 == 0 ? cnt / 20 : cnt / 20 + 1; 
		mav.addObject("cnt", cnt);
		mav.addObject("size", size);
	
		String pStr = request.getParameter("page") == null ? "1" : request.getParameter("page");
		mav.addObject("page", pStr);
		System.out.println(pStr);

		int start = (Integer.parseInt(pStr) - 1) * 20 + 1;
		int end = Integer.parseInt(pStr) * 20;
	
		List<HashMap> list2 = sdao.pasing(start, end, search); // 페이지 분할해서
		mav.addObject("list2", list2);
		

		return mav;
	}
	
	// �옄�룞 �셿�꽦 寃��깋湲곕뒫 - 誘몄셿�꽦
	/*@RequestMapping("/index_search")
	public ModelAndView search1Handler2(@RequestParam (name="q") String search) throws IOException{
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main", "search/list_form");
		
		System.out.println("q = " + search);
		List list = sdao.search1(search);
		mav.addObject("list", list);
		// list�뒗 異쒕젰�릺�굹, index�뿉�꽌 異쒕젰�� �릺吏� �븡�쓬
		System.out.println("list = " + list);
	
		return mav;
	}*/
	

	
}
