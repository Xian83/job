package controller;

import java.util.ArrayList;
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
	public ModelAndView join03Handler(@RequestParam Map data){
		ArrayList list = new ArrayList(); 
		list.add("농업, 임업 및 어업");
		list.add("광업");
		list.add("제조업");
		list.add("전기,가스,증기 및 수도사업");
		list.add("하수폐기물처리, 원료재생 및 환경복원업");
		list.add("건설업");
		list.add("도매 및 소매업");
		list.add("운수업");
		list.add("숙박 및 음식점업");
		
		ArrayList area = new ArrayList(); 
		area.add("서울특별시");
		area.add("부산광역시");
		area.add("대구광역시");
		area.add("인천광역시");
		area.add("광주광역시");
		area.add("대전광역시");
		area.add("울산광역시");
		area.add("세종특별자치시");
		area.add("경기도");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main", "/join/step03");
		mav.addObject("list", list);
		mav.addObject("area", area);
		mav.addObject("data", data);
		return mav;
	}
	
	//회원가입 - 결과 출력
	@RequestMapping("/result")
	public ModelAndView join03(@RequestParam Map map){
		// 페이스북 유저 아님
		map.put("facebook", "N");
		
		// 확인용
		System.out.println(map.toString());
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main", "/join/result");

		boolean res = mDao.insert(map);
		res = mDao.insertInfo(map);
		
		System.out.println("회원가입 결과 : " + res);
		if(res){
			mav.addObject("msg", "가입성공!!");
		} else {
			mav.addObject("msg", "가입실패!!");
		}
	
		return mav;	
	}
	
	// email 중복체크 Ajax
	@RequestMapping("/check_Email")
	@ResponseBody
	public String joinCheck(@RequestParam(name="chk") String chk){
		boolean res = false;
		if(chk.contains("@"))
			res = mDao.existCheck(chk);
		
		return String.valueOf(res);
	}
}
