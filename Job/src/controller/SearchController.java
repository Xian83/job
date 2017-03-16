package controller;

import java.io.IOException;
import java.util.List;

import javax.swing.plaf.synth.SynthSeparatorUI;

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
		

			List list = sdao.search1(search);
			mav.addObject("list", list);
	
		return mav;
	}
	
	// 자동 완성 검색기능 - 미완성
	@RequestMapping("/index_search")
	public ModelAndView search1Handler2(@RequestParam (name="q") String search) throws IOException{
		
		ModelAndView mav = new ModelAndView();
		/*mav.setViewName("t1");
		mav.addObject("main", "search/list_form");*/
		
		System.out.println("q = " + search);
		List list = sdao.search1(search);
		mav.addObject("list", list);
		// list는 출력되나, index에서 출력은 되지 않음
		System.out.println("list = " + list);
	
		return mav;
	}
	
}
