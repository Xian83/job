package controller;

import java.io.IOException;
import java.util.List;

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
	
	// 기업명으로 검색 
	@RequestMapping("/name")
	public ModelAndView search1Handler(@RequestParam (name="search") String search) throws IOException{
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main", "search/list_form");
		
		System.out.println("param search == " + search );  

			List list = sdao.search1(search);
	
		return mav;
	}
}
