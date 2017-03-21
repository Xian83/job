package controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.DetailDao;
import model.ReviewsDao;

@Controller
@RequestMapping("/company")
public class DetailController {
	@Autowired
	DetailDao ddao;

	@RequestMapping("/detail")
	public ModelAndView detailHandler(@RequestParam(name = "cmpn_nm") String companyname,
			HttpServletResponse response, @CookieValue(name="cmpn_nm", defaultValue="") String val) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		List scorelist = ddao.score(companyname);
		List salarylist = ddao.salary(companyname);
		List reviewList = ddao.review(companyname);
		HashMap map = (HashMap) scorelist.get(0);
		String div = (String) map.get("DIVISION");
		List samelist = ddao.same(div);
		mav.addObject("score", scorelist);
		mav.addObject("same", samelist);
		mav.addObject("review", reviewList);
		mav.addObject("salary", salarylist);
		mav.addObject("main", "company/detail_form");

		// 쿠키생성
		
		String u = val+"#"+companyname;
		Cookie c = new Cookie("cmpn_nm", u);
		c.setPath("/");
		c.setMaxAge(60 * 60 * 12);
		response.addCookie(c);

		return mav;
	}
}
