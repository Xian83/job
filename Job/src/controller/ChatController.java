package controller;

import java.util.ArrayList;
import java.util.List;
import java.util.*;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/chat")
public class ChatController {
	List<Map> li;

	@PostConstruct
	public void init() {
		li = new ArrayList<>();
	
	}
	
	@RequestMapping("/chatAjax")
	@ResponseBody
	public String chatHandler(@RequestParam(name="msg") String msg, HttpSession session, HttpServletRequest req) {
		Map map = new HashMap();
		String name =(String)session.getAttribute("name");
		
		if(name==null){
			name = "손님"+(int)(Math.random()*10000)+1;
			session.setAttribute("name", name);
		}
		
			
		if(msg.equals("join1234555")){
			map.put("id", "서버");
			map.put("msg", name+"님이 들어오셨습니다");
		}else {
			map.put("id", name);
			map.put("msg", msg);
		}
			
		li.add(map);
		return "true";
	}
	
	@RequestMapping("/logAjax")
	@ResponseBody
	public List logHandler() {
		
		return li;
	}
	
	
}
