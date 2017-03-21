package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

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

	// �쉶�썝媛��엯 - �빟愿��룞�쓽
	@RequestMapping("/step01")
	public ModelAndView join01Handler(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main", "/join/step01");
		return mav;
	}
	
	// �쉶�썝媛��엯 - 湲곕낯�젙蹂� �엯�젰
	@RequestMapping("/step02")
	public ModelAndView join02Handler(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main", "/join/step02");
		return mav;
	}
	
	// �쉶�썝媛��엯 - 異붽��젙蹂� �엯�젰
	@RequestMapping("/step03")
	public ModelAndView join03Handler(@RequestParam Map data){
		ArrayList list = new ArrayList(); 
		list.add("�냽�뾽, �엫�뾽 諛� �뼱�뾽");
		list.add("愿묒뾽");
		list.add("�젣議곗뾽");
		list.add("�쟾湲�,媛��뒪,利앷린 諛� �닔�룄�궗�뾽");
		list.add("�븯�닔�룓湲곕Ъ泥섎━, �썝猷뚯옱�깮 諛� �솚寃쎈났�썝�뾽");
		list.add("嫄댁꽕�뾽");
		list.add("�룄留� 諛� �냼留ㅼ뾽");
		list.add("�슫�닔�뾽");
		list.add("�닕諛� 諛� �쓬�떇�젏�뾽");
		
		ArrayList area = new ArrayList(); 
		area.add("�꽌�슱�듅蹂꾩떆");
		area.add("遺��궛愿묒뿭�떆");
		area.add("��援ш킅�뿭�떆");
		area.add("�씤泥쒓킅�뿭�떆");
		area.add("愿묒＜愿묒뿭�떆");
		area.add("���쟾愿묒뿭�떆");
		area.add("�슱�궛愿묒뿭�떆");
		area.add("�꽭醫낇듅蹂꾩옄移섏떆");
		area.add("寃쎄린�룄");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main", "/join/step03");
		mav.addObject("list", list);
		mav.addObject("area", area);
		mav.addObject("data", data);
		return mav;
	}
	
	//�쉶�썝媛��엯 - 寃곌낵 異쒕젰
	@RequestMapping("/result")
	public ModelAndView join03(@RequestParam Map map){
		// �럹�씠�뒪遺� �쑀�� �븘�떂
		map.put("facebook", "N");
		
		// �솗�씤�슜
		System.out.println(map.toString());
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main", "/join/result");

		boolean res = mDao.insert(map);
		res = mDao.insertInfo(map);
		
		
		System.out.println("�쉶�썝媛��엯 寃곌낵 : " + res);
		if(res){
			mav.addObject("msg", "媛��엯�꽦怨�!!");
		} else {
			mav.addObject("msg", "媛��엯�떎�뙣!!");
		}
	
		return mav;	
	}
	
	// email 以묐났泥댄겕 Ajax
	@RequestMapping("/check_Email")
	@ResponseBody
	public String joinCheck(@RequestParam(name="chk") String chk){
		boolean res = false;
		if(chk.contains("@"))
			res = mDao.existCheck(chk);
		
		return String.valueOf(res);
	}
}
