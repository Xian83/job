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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import model.MemberDao;
import model.MyInfoDao;

@Controller
@RequestMapping("/join")
public class JoinController {
	@Autowired
	MemberDao mDao;

	@Autowired
	MyInfoDao mydao;

	// 회원가입 - 약관동의
	@RequestMapping("/step01")
	public ModelAndView join01Handler() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main", "/join/step01");
		return mav;
	}

	// 회원가입 - 기본정보 입력
	@RequestMapping("/step02")
	public ModelAndView join02Handler() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main", "/join/step02");
		return mav;
	}

	// 회원가입 - 추가정보 입력
	@RequestMapping("/step03")
	public ModelAndView join03Handler(@RequestParam Map data) {
		List area = mydao.getlocations(); // 관심지역
		List industry = mydao.getIndustries();// 산업군

		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main", "/join/step03");
		mav.addObject("list", industry);
		mav.addObject("area", area);
		mav.addObject("data", data);
		return mav;
	}

	// 회원가입 - 결과
	@RequestMapping("/result")
	public ModelAndView join03(@RequestParam Map map, HttpSession session, HttpServletResponse resp) {
		// 페이스북 유저 아님
		map.put("facebook", "N");
		System.out.println(map.toString()); //확인용

		boolean res = mDao.insert(map);	// 기본정보 입력
		res = mDao.insertInfo(map);		// 추가정보 입력
		System.out.println("회원가입 결과 : " + res);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/index");
		mav.addObject("joinResult", res);
		
		// 회원가입 성공시, 자동로그인 처리
		if(res)
			login(map, session, resp);
		
		return mav;
	}

	// email 以묐났泥댄겕 Ajax
	@RequestMapping("/check_Email")
	@ResponseBody
	public String joinCheck(@RequestParam(name = "chk") String chk) {
		boolean res = false;
		if (chk.contains("@"))
			res = mDao.existCheck(chk);

		return String.valueOf(res);
	}

	// facebook 회원전용 추가 정보 입력창
	@RequestMapping("/step03F")
	public ModelAndView join03FHandler() {

		List location = mydao.getlocations(); // 관심지역
		List industry = mydao.getIndustries();// 산업군

		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main", "/join/step03F");
		mav.addObject("industry", industry);
		mav.addObject("location", location);
		return mav;
	}

	// facebook 회원전용 추가 정보 입력창
	@RequestMapping("/result02")
	public ModelAndView joinResult02Handler(@RequestParam Map data) {
		
		boolean res = mDao.insertInfo(data);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/");
		mav.addObject("res", res);
		
		return mav;
	}
	
	public void login(Map map, HttpSession session, HttpServletResponse resp) {
		System.out.println((String) map.get("email"));
		Map userData = mDao.getData((String) map.get("email"));

		String email = (String) userData.get("EMAIL");
		String name = (String) userData.get("NAME");
		String pass = (String) userData.get("PASS");

		session.setAttribute("auth", "yes");
		session.setAttribute("leave_try", 1);
		session.setAttribute("email", email);
		session.setAttribute("name", name);
		session.setAttribute("pass", pass);

		if (map.get("keep") != null) {
			Cookie c = new Cookie("login", email + "#" + name);
			c.setMaxAge(60 * 60 * 24);
			c.setPath("/");
			resp.addCookie(c);
		}
	}
}
