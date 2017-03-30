package controller;

import java.util.ArrayList;
import java.util.HashMap;
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

import model.MemberDao;
import model.MyPageDao;
import model.RankDao;

@Controller
@RequestMapping("/rank")
public class RankController {

	@Autowired
	RankDao rdao;

	@Autowired
	MemberDao mDao;

	@Autowired
	MyPageDao mypage;

	// rank page main
	@RequestMapping("/form")
	public ModelAndView InitHandler(HttpServletResponse response,
			@CookieValue(name = "cmpn_nm", defaultValue = "") String origin, HttpSession session) {
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

		// 로그인했을때 추천리스트추가
		String email = (String) session.getAttribute("email");
		String auth = (String) session.getAttribute("auth");

		if (auth != null && auth.equals("yes")) {
			HashMap data = mDao.getInfo(email); // get data from member_Info
												// table
			List reco = mypage.getRecommand(data); // get data from
													// mongoDB(company)
			List list_r = mypage.getRecommand02(reco); // get data from score &
														// salary table

			mav.addObject("member", data); // 관심지역(AREA),산업군(STNDD_BIG_GB),
											// 연봉min/max
			mav.addObject("list_r", list_r);
			System.out.println("추천 = " + list_r);
		}

		return mav;
	}
	

}