package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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
		int csize = cookielist.size();
		//System.out.println(cookielist);
		mav.setViewName("t1");
		mav.addObject("main", "compare/form");
		mav.addObject("clist", cookielist);
		mav.addObject("csize", csize);
		
		return mav;
	}
	
	// 비교처리 페이지
	@RequestMapping("/result")
	public ModelAndView InitHandler1(@RequestParam (name="cm1") String cm1, @RequestParam (name="cm2") String cm2, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String auth = (String)session.getAttribute("auth");
		
		if(auth.equals("yes")){
			
			String email = (String)session.getAttribute("email");
			//System.out.println(s);
			//System.out.println(cm1);
			//System.out.println(cm2);
			Map map = new HashMap();
			map.put("email", email);
			map.put("cm1", cm1);
			map.put("cm2", cm2);
			int rst = cdao.insertclist(map);
			//System.out.println("db에 들어갔는지 : "+rst);
			List list1 = cdao.compare(cm1);
			List list2 = cdao.compare(cm2);
			
			mav.setViewName("t1");
			mav.addObject("list1", list1);
			mav.addObject("list2", list2);
			mav.addObject("main", "compare/result");
		} else {
			System.out.println("비회원이라서 비교불가");
			mav.setViewName("t1");
			mav.addObject("main", "index");
		}
		return mav;
	}
}
		        	 
		 

		
