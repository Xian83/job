package controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.RankDao;

@Controller
@RequestMapping("/rank")
public class RankController {

	@Autowired
	RankDao rdao;

	// rank page main
	@RequestMapping("/form")
	public ModelAndView InitHandler(HttpServletResponse response,
			@CookieValue(name = "cmpn_nm", defaultValue = "") String origin) {
		List list1 = rdao.avgsalary(50);
		List list2 = rdao.rookiesalary(50);
		List list3 = rdao.financeScore(50);
		List list4 = rdao.employeeScore(50);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("ttt");
		mav.addObject("main", "rank/form");
		mav.addObject("avg", list1);
		mav.addObject("rookie", list2);
		mav.addObject("finance", list3);
		mav.addObject("employee", list4);

		

		// 쿠키처리
		List<String> cookielist = new ArrayList<>();
		if (!origin.equals("")) {
			String[] ar = origin.split("#");
			for (String a : ar) {
				if (a.equals(""))
					continue;
				cookielist.add(a);
			}
		}
		int csize = cookielist.size();

		mav.addObject("clist", cookielist);
		mav.addObject("csize", csize);
		return mav;
	}

}