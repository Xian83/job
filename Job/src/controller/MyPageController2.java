package controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import model.MemberDao;
import model.RecommandDao;

@Controller
@RequestMapping("/my")
public class MyPageController2 {
	@Autowired
	MemberDao mDao;
	
	@Autowired
	RecommandDao rDao;
	
	@RequestMapping("/index")
	public ModelAndView initHandler(){
			
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main", "/my/index");
		return mav;
	}	
	
	@RequestMapping("/recommand")
	public ModelAndView recommandHandler(HttpSession session){
		String email = (String) session.getAttribute("email");
		Map data = mDao.getInfo(email);
		System.out.println("info : " + data.toString());//확인용
		
		List list = rDao.getData(data);	//
		for(Object map : list){
			if(((Map) map).get("LOGO") == null){
				((Map) map).put("LOGO", "http://image.jinhak.com/job/site/tmp02.gif");
			}
		}		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main", "/my/recommand");
		mav.addObject("list", list);
		return mav;
	}
}
