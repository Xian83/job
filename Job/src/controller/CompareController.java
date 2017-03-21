package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Cookie;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.CompareDao;

@Controller
@RequestMapping("/compare")
public class CompareController {

	@Autowired
	CompareDao cdao;

	@RequestMapping("/form")
	public ModelAndView InitHandler(HttpServletRequest request, @CookieValue(name="cmpn_nm",defaultValue="")String val) {
		ModelAndView mav = new ModelAndView();
		
		// 쿠키처리
		List<String> cookielist = new ArrayList<>();
		if(!val.equals("")) {
			String[] ar = val.split("#");
			for(String a : ar) {
				if(a.equals(""))
					continue;
				cookielist.add(a);
			}
		}
		
		//System.out.println(cookielist);
		mav.setViewName("t1");
		mav.addObject("main", "compare/form");
		mav.addObject("clist", cookielist);
		
		return mav;
	}
	
	@RequestMapping("/result")
	public ModelAndView InitHandler1(@RequestParam (name="cm1") String cm1, @RequestParam (name="cm2") String cm2) {
		ModelAndView mav = new ModelAndView();
		
		System.out.println(cm1);
		System.out.println(cm2);
		List list1 = cdao.compare(cm1);
		List list2 = cdao.compare(cm2);
		
		mav.setViewName("t1");
		mav.addObject("list1", list1);
		mav.addObject("list2", list2);
		mav.addObject("main", "compare/form");
		return mav;
	}
}
		        	 
		 

		
