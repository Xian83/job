package controller;

import java.util.List;
import java.util.Map;

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

	// �쉶�썝媛��엯 - �빟愿��룞�쓽
	@RequestMapping("/step01")
	public ModelAndView join01Handler() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main", "/join/step01");
		return mav;
	}

	// �쉶�썝媛��엯 - 湲곕낯�젙蹂� �엯�젰
	@RequestMapping("/step02")
	public ModelAndView join02Handler() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main", "/join/step02");
		return mav;
	}

	// �쉶�썝媛��엯 - 異붽��젙蹂� �엯�젰
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

	// �쉶�썝媛��엯 - 寃곌낵 異쒕젰
	@RequestMapping("/result")
	public ModelAndView join03(@RequestParam Map map) {
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
		if (res) {
			mav.addObject("msg", "媛��엯�꽦怨�!!");
		} else {
			mav.addObject("msg", "媛��엯�떎�뙣!!");
		}

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
}
