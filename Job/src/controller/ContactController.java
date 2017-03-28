package controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import model.GoogleMap;

@Controller
@RequestMapping("/contact")

public class ContactController {
	@Autowired
	GoogleMap google;

	// contact 메인 1페이지
	@RequestMapping("/form")
	public ModelAndView InitHandler1() {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main", "contact/form");
		mav.addObject("json", google.map("서울특별시+강남구+역삼동+826-27"));

		return mav;
	}

	// contact 메인 2페이지
	@RequestMapping("/form2")
	public ModelAndView InitHandler2() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main", "contact/form2");

		return mav;
	}

	// contact 기타 페이지
	@RequestMapping("/form_etc")
	public ModelAndView InitHandler3() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main", "contact/form_etc");

		return mav;
	}

	// contact menu 접히는 것 test용
	@RequestMapping("/test")
	public ModelAndView InitHandler4() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main", "contact/test");

		return mav;
	}
}
