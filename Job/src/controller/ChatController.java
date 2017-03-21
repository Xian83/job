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
			map.put("id", session.getAttribute("name"));
			map.put("msg", msg);
		li.add(map);
		return "true";
	}
	
	@RequestMapping("/logAjax")
	@ResponseBody
	public List logHandler() {
		return li;
	}
}
