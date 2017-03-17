package controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import model.MemberDao;


@Controller
@RequestMapping("/join")
public class JoinController {
	@Autowired
	MemberDao mDao;

	// 회원가입 - 약관동의
	@RequestMapping("/step01")
	public ModelAndView join01Handler(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main", "/join/step01");
		return mav;
	}
	
	// 회원가입 - 기본정보 입력
	@RequestMapping("/step02")
	public ModelAndView join02Handler(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main", "/join/step02");
		return mav;
	}
	
	// 회원가입 - 추가정보 입력
	@RequestMapping("/step03")
	public ModelAndView join03Handler(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main", "/join/step03");
		return mav;
	}
	
	//회원가입 - 결과 출력
	@RequestMapping("/result")
	public ModelAndView join03(@RequestParam Map map){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main", "/join/result");

		boolean res = mDao.insert(map);
		System.out.println("회원가입 결과 : " + res);
		if(res){
			mav.addObject("msg", "가입성공!!");
		} else {
			mav.addObject("msg", "가입실패!!");
		}
	
		return mav;	
	}
	
	// ID 중복체크 Ajax
	@RequestMapping("/check_Id")
	@ResponseBody
	public String joinCheck(@RequestParam(name="cid") String chk){
		boolean res = mDao.existCheck(chk);
		
		return String.valueOf(res);
	}
}
