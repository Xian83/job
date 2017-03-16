package controller;

import java.io.IOException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.SalaryDao;

@Controller
public class InputData {

	@Autowired
	SalaryDao sDao;

	@RequestMapping("/input_data")
	public ModelAndView formDataHandler() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main", "data/input_data");
		return mav;
	}

	// 현정 작업용
//	@RequestMapping("/input_result")
//	public ModelAndView getDataHandler(@RequestParam Map map) {
//		String data = "";
//		boolean result = false;
//		try {
//			data = sDao.getData(map);
//			result = sDao.insert2(data, (String) map.get("type"));
//			
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName("t1");
//		mav.addObject("main", "data/input_result");
//		mav.addObject("result", result);
//		return mav;
//	}
	
	// 상세검색 DB 추가용
	@RequestMapping("/input_result")
	public ModelAndView getDataHandler2(@RequestParam Map map) {
		String data = "";
		boolean result = false;
		try {
			data = sDao.getData(map);
			result = sDao.insert(data);
			
		} catch (IOException e) {
			e.printStackTrace();
		}

		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main", "data/input_result");
		mav.addObject("result", result);
		return mav;
	}
	
	
	
}
