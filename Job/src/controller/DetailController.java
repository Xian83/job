package controller;

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
		
		ModelAndView mav = new ModelAndView("company/detail_form");
		List scorelist =ddao.score(companyname);
		List salarylist = ddao.salary(companyname);
		mav.addObject("score",scorelist);
		mav.addObject("salary", salarylist);
		System.out.println(scorelist.toString());
		System.out.println(salarylist.toString());
		return mav ;
	}
}
