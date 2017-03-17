package controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.DetailDao;

@Controller
@RequestMapping("/company")
public class DetailController {
	@Autowired
	DetailDao ddao;
	
	@RequestMapping("/detail")
	public ModelAndView detailHandler(@RequestParam(name="cmpn_nm") String companyname){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		List scorelist =ddao.score(companyname);
		List salarylist = ddao.salary(companyname);
		HashMap map = (HashMap) scorelist.get(0);
		String div = (String)map.get("DIVISION");
		List samelist = ddao.same(div);
		mav.addObject("score",scorelist);
		mav.addObject("same",samelist);
		mav.addObject("salary", salarylist);
		mav.addObject("main", "company/detail_form");
		
		return mav ;
	}
}
