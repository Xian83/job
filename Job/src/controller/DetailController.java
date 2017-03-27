package controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
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
import model.GoogleMap;
import model.SalaryDao;
import model.SearchDao;

@Controller
@RequestMapping("/company")
public class DetailController {
	@Autowired
	DetailDao ddao;

	@Autowired
	SalaryDao sDao;

	@Autowired
	SearchDao search;

	@Autowired
	GoogleMap google;

	@RequestMapping("/detail")
	public ModelAndView detailHandler(@RequestParam(name = "cmpn_nm") String companyname, HttpServletResponse response,
			HttpSession session, @CookieValue(name = "cmpn_nm", defaultValue = "") String origin) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("ttt");
		mav.addObject("main", "company/detail_form");

		// get data by Company name
		HashMap scorelist = ddao.score(companyname);
		HashMap salarylist = ddao.salary(companyname);
		List reviewList = ddao.review(companyname);

		// member check & 관심기업 여부 확인
		String email = (String) session.getAttribute("email");
		if (email == null) {
			email = "visitant";
		} else {
			int a = ddao.checkScrape(companyname, email);
			mav.addObject("scrape", a); // 0 : 아님, 1: 관심기업
		}

		// increase visit count to DB
		ddao.insertVisit(companyname, email);

		// get same industry company list (finance score desc)
		String div = (String) scorelist.get("DIVISION");
		List samelist = ddao.same(div);
		System.out.println("산업군 : " + div);

		// salary info
		HashMap industry = sDao.getSalary(div); // same industry
		HashMap allCompany = sDao.getSalary("all"); // all company
		System.out.println(industry.get("avg") + "" + industry.get("rookie"));

		String CompID = search.getCompID(companyname);
		// career catch site data
		HashMap<String, List> info01 = ddao.getInfo01(CompID);
		HashMap<String, Object> info02 = ddao.getInfo02(CompID);

		// data set for view
		mav.addObject("score", scorelist);
		mav.addObject("same", samelist);
		mav.addObject("review", reviewList);
		mav.addObject("salary", salarylist);
		mav.addObject("industry", industry); // HashMap(avg, rookie)
		mav.addObject("allCompany", allCompany);// HashMap(avg, rookie)
		mav.addObject("info01", info01);// HashMap<List>(rank8, employee, scale)
		mav.addObject("info02", info02);// HashMap (summary, address, system, culture)
		mav.addObject("json", google.map((String) info02.get("address")));

		// 쿠키생성
		String u = origin + "#" + companyname;
		Cookie c = new Cookie("cmpn_nm", u);
		c.setPath("/");
		// c.setMaxAge(60 * 60 * 12);
		response.addCookie(c);

		return mav;
	}

	@RequestMapping("/interest")
	public ModelAndView interestHandler(@RequestParam(name = "cmpn_nm") String companyname,
			HttpServletResponse response, HttpSession session) throws UnsupportedEncodingException {
		ModelAndView mav = new ModelAndView();
		int a = ddao.insertInterest(companyname, (String) session.getAttribute("email"));
		mav.addObject("scrape", a);
		mav.setViewName("redirect:/company/detail?cmpn_nm=" + URLEncoder.encode(companyname, "UTF-8"));
		return mav;
	}

}