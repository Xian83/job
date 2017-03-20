package controller;

import java.io.IOException;
import java.util.HashMap;
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

import com.fasterxml.jackson.databind.ObjectMapper;

import model.MemberDao;

@Controller
@RequestMapping("/login")
public class LoginController {
	
	@Autowired
	MemberDao mDao;
	
	// 로그인 화면
	@RequestMapping("/form")
	public ModelAndView loginFormHandler(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main", "/login/form");
		return mav;
	}
	
	// 로그인 결과 출력
	@RequestMapping("/result")
	public ModelAndView loginResultHandle(@RequestParam Map map, HttpSession session, HttpServletResponse resp){
		
		boolean rst = mDao.existCheck(map);
		if(rst){
			login(map, session, resp);
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main", "/login/result");
		mav.addObject("rst", rst);
		return mav;
	}
	
	//로그아웃
	@RequestMapping("/logout")
	public void logoutHandle(HttpSession session, HttpServletResponse resp) throws IOException, InterruptedException{
		
		//쿠키 삭제
		Cookie c = new Cookie("login", null);
		c.setMaxAge(0);
		c.setPath("/");
		resp.addCookie(c);
		
		//로그인 정보 지우기
		session.setAttribute("auth", "no");
		session.removeAttribute("id");
		session.removeAttribute("name");
		session.removeAttribute("leave_try");
		Thread.sleep(300);
		resp.sendRedirect("/");
	}
	
	// 페이스북 연동하기
	@ResponseBody
	@RequestMapping("/fbLogin")
	public Map fbSignInHandler(@RequestParam Map map, HttpSession session, HttpServletResponse resp){
		ObjectMapper om = new ObjectMapper();
		boolean rst = false;
		boolean res = false;
		Map info = new HashMap();
		try {
			// 넘어온 info 정보 객체화
			info = om.readValue((String)map.get("info"), Map.class);
			// 멤버 가입여부 체크
			rst = mDao.existCheck((String)info.get("email"));
			info.put("exist", rst);
			System.out.println("가입여부 : " + rst);
			
			// 가입 진행
			if(!rst){
				String m = (String) info.get("birthday");
				// 가입 진행
				info.put("facebook", "Y");
				info.put("pass", "pass");
				info.put("birth",  m.split("/")[2]);
				res = mDao.insert(info);
				System.out.println(info.get("name") + ", 가입 결과 : " +  res);
			}
			// 로그인
			login(info, session, resp);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return info;
	}
	
	public void login(Map map, HttpSession session, HttpServletResponse resp){
		Map userData = mDao.getData((String)map.get("email"));
		
		String email = (String) userData.get("EMAIL");
		String name = (String) userData.get("NAME");
		
		session.setAttribute("auth", "yes");
		session.setAttribute("leave_try", 1);
		session.setAttribute("email", email);
		session.setAttribute("name", name);
		
		if(map.get("keep") != null){
			Cookie c = new Cookie("login", email + "#" + name);
			c.setMaxAge(60 * 60 * 24);
			c.setPath("/");
			resp.addCookie(c);
		}
	}
}