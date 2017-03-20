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
	public ModelAndView InitHandler(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		// 쿠키처리
		Cookie[] ar = request.getCookies();
		List cookielist = new ArrayList();
		Map<String, String> map = new TreeMap<>();
		if(ar != null) {  
			for(Cookie c : ar){
				String cn = c.getName();
				if(cn.contains("cmpn_nm")){
					String cv = c.getValue();
					map.put(cn, cv);
					String pa = c.getPath();
					int ma = c.getMaxAge();
					//System.out.println(  cn +"["+cv+"]..." + pa+"("+ma+" sec)");
					cookielist.add(map);
				}
			}
			//System.out.println(map.get("cmpn_nm"));
			//System.out.println(cookielist.toString());
		}
		//System.out.println(cookielist);
		mav.setViewName("t1");
		mav.addObject("main", "compare/form");
		mav.addObject("clist", cookielist);
		
		return mav;
	}
}
		        	 
		 

		
