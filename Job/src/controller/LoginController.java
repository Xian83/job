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
	
	// 濡쒓렇�씤 �솕硫�
	@RequestMapping("/form")
	public ModelAndView loginFormHandler(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main", "/login/form");
		return mav;
	}
	
	// 濡쒓렇�씤 寃곌낵 異쒕젰
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
	
	//濡쒓렇�븘�썐
	@RequestMapping("/logout")
	public void logoutHandle(HttpSession session, HttpServletResponse resp) throws IOException, InterruptedException{
		
		//荑좏궎 �궘�젣
		Cookie c = new Cookie("login", null);
		c.setMaxAge(0);
		c.setPath("/");
		resp.addCookie(c);
		
		//濡쒓렇�씤 �젙蹂� 吏��슦湲�
		session.setAttribute("auth", "no");
		session.removeAttribute("id");
		session.removeAttribute("name");
		session.removeAttribute("leave_try");
		Thread.sleep(300);
		resp.sendRedirect("/");
	}
	
	// �럹�씠�뒪遺� �뿰�룞�븯湲�
	@ResponseBody
	@RequestMapping("/fbLogin")
	public boolean fbSignInHandler(@RequestParam Map map, HttpSession session, HttpServletResponse resp){
		ObjectMapper om = new ObjectMapper();
		boolean rst = false;
		boolean res = false;
		Map info = new HashMap();
		try {
			// �꽆�뼱�삩 info �젙蹂� 媛앹껜�솕
			info = om.readValue((String)map.get("info"), Map.class);
			// 硫ㅻ쾭 媛��엯�뿬遺� 泥댄겕
			rst = mDao.existCheck((String)info.get("email"));
			info.put("exist", rst);
			System.out.println("媛��엯�뿬遺� : " + rst);
			
			// 媛��엯 吏꾪뻾
			if(!rst){
				String m = (String) info.get("birthday");
				// 媛��엯 吏꾪뻾
				info.put("facebook", "Y");
				info.put("pass", "pass");
				info.put("birth",  m.split("/")[2]);
				res = mDao.insert(info);
				System.out.println(info.get("name") + ", 媛��엯 寃곌낵 : " +  res);
			}
			// 濡쒓렇�씤
			login(info, session, resp);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return rst;
	}
	
	public void login(Map map, HttpSession session, HttpServletResponse resp){
		Map userData = mDao.getData((String)map.get("email"));
		
		String email = (String) userData.get("EMAIL");
		String name = (String) userData.get("NAME");
		String pass = (String) userData.get("PASS");
		
		session.setAttribute("auth", "yes");
		session.setAttribute("leave_try", 1);
		session.setAttribute("email", email);
		session.setAttribute("name", name);
		session.setAttribute("pass", pass);
		
		if(map.get("keep") != null){
			Cookie c = new Cookie("login", email + "#" + name);
			c.setMaxAge(60 * 60 * 24);
			c.setPath("/");
			resp.addCookie(c);
		}
	}
}