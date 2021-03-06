package controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.MemberDao;
import model.RankDao;

@Controller
public class InitController {
	@Autowired
	RankDao rdao;

	@Autowired
	MemberDao mDao;

	@RequestMapping({ "/", "/index", "/index.jsp" })
	public ModelAndView InitHandler(@RequestParam(name = "joinResult", required = false) Boolean join) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("root");
		/*
		 * mav.setViewName("ttt"); mav.addObject("main", "/index");
		 */
		
		// 재직자 평가 내림차순 top 3 : 기업로고 + 기업명 + 재직자평가점수 (score)
		// 재무 평가 내림차순 top 3 : 기업로고 + 기업명 + 재무 평가 점수 (score)
		// 스크랩 많이 한 기업 top 3 : 기업로고 + 기업명 + 스크랩 수
		List list1 = rdao.avgsalary(3);
		List list2 = rdao.rookiesalary(3);
		List list3 = rdao.financeScore(3);
		List list4 = rdao.employeeScore(3);
		List list5 = rdao.scrapCount(3);
		List list6 = rdao.getCompanyInfo(list5);

		mav.addObject("avg", list1); // avg salary top3
		mav.addObject("rookie", list2); // rookie salary top3
		mav.addObject("finance", list3); // finance score top3
		mav.addObject("employee", list4); // employee score top3
		mav.addObject("scrap", list5); // scrap top3 (CMPN_NM, cnt)
		mav.addObject("scrapInfo", list6); // scrap companyInfo from SCORE TABLE

		// Join 결과
		if(join != null)
			mav.addObject("joinResult", join);		
		
		return mav;
	}


}