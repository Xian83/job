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
import model.DetailDao;
import model.SearchDao;

@Controller
@RequestMapping("/compare")
public class CompareController {
	@Autowired
	DetailDao ddao;
	@Autowired
	CompareDao cdao;
	@Autowired
	SearchDao search;

	@RequestMapping("/form")
	public ModelAndView InitHandler(HttpServletRequest request,
			@CookieValue(name = "cmpn_nm", defaultValue = "") String val) {
		ModelAndView mav = new ModelAndView();

		// 쿠키처리
		List<String> cookielist = new ArrayList<>();
		if (!val.equals("")) {
			String[] ar = val.split("#");
			for (String a : ar) {
				if (a.equals(""))
					continue;
				cookielist.add(a);
			}
		}
		int csize = cookielist.size();
		// System.out.println(cookielist);
		mav.setViewName("t1");
		mav.addObject("main", "compare/form");
		mav.addObject("clist", cookielist);
		mav.addObject("csize", csize);

		return mav;
	}

	// 비교처리 페이지
	@RequestMapping("/result")
	public ModelAndView InitHandler1(@RequestParam(name = "cm1") String cm1, @RequestParam(name = "cm2") String cm2,
			HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String auth = (String) session.getAttribute("auth");

		if (auth.equals("yes")) {
			String email = (String) session.getAttribute("email");
			
			// 마이페이지용 비교 데이터 쌓기
			Map map = new HashMap();
			map.put("email", email);
			map.put("cm1", cm1);
			map.put("cm2", cm2);
			int rst = cdao.insertclist(map);
			
			// data setting
			// 회사명, 점수(재무평가,재직자평가), 방사형 그래프, 숫자(매출액, 영업이익, 당기 손익, 사원수)			
			String chartURL = makeChart(ddao.getScore02(cm1), ddao.getScore02(cm2));// graph
			
			mav.setViewName("t1");
			mav.addObject("main", "compare/result");
			mav.addObject("score01", ddao.score(cm1));	// FINANCE_SCORE, EMPLOYEE_SCORE
			mav.addObject("score02", ddao.score(cm2));
			mav.addObject("info01", ddao.getInfo02(search.getCompID(cm1)));	// HashMap (summary - List)
			mav.addObject("info02", ddao.getInfo02(search.getCompID(cm2)));
			mav.addObject("chartURL", chartURL);
			
		} else {
			System.out.println("비회원이라서 비교불가");
			mav.setViewName("t1");
			mav.addObject("main", "index");
		}
		return mav;
	}

	public String makeChart(HashMap data1, HashMap data2) {
		int size = 300;
		String img = "https://chart.googleapis.com/chart?cht=r&chs=" + size + "x" + size;
		img += "chd=t:";
		img += data1.get("LABEL01") + "," + data1.get("LABEL02") + "," + data1.get("LABEL03") + ",";
		img += data1.get("LABEL04") + "," + data1.get("LABEL05") + "," + data1.get("LABEL06") + ",";
		img += data1.get("LABEL07") + "," + data1.get("LABEL08") + "," + data1.get("LABEL09") + ","+ data1.get("LABEL01")+  "|";

		img += data2.get("LABEL01") + "," + data2.get("LABEL02") + "," + data2.get("LABEL03") + ",";
		img += data2.get("LABEL04") + "," + data2.get("LABEL05") + "," + data2.get("LABEL06") + ",";
		img += data2.get("LABEL07") + "," + data2.get("LABEL08") + "," + data2.get("LABEL09") + ","+ data2.get("LABEL01");

		img += "&chco=FF0000,FF9900"; // 선 색깔
		img += "&chls=2.0,4.0,0.0|2.0,4.0,0.0&chxt=x";
		img += "&chxl=0:|규모·형태|안정성|성장성|수익성|조직문화·분위기|급여·복리후생|근무시간·휴가|성장·경력|경영진·경영";
		img += "&chxr=0,0.0,360.0";

		return img;
	}
}
