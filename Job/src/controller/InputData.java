package controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.DataScarpDao;
import model.SalaryDao;

@Controller
public class InputData {

	@Autowired
	SalaryDao sDao;
	
	@Autowired
	DataScarpDao dataDao;

	@RequestMapping("/input_data")
	public ModelAndView formDataHandler() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main", "data/input_data");
		return mav;
	}

	// ���� �۾���
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
	
	// �󼼰˻� DB �߰���
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
	
	// data Insert to MongoDB
	// for detail search
	@RequestMapping("/input_result02")
	public ModelAndView getDataHandler3(@RequestParam Map map) {
		String data = "";
		boolean result = false;
		try {
			data = dataDao.getData(map);
			result = dataDao.insert(data);
			
		} catch (IOException e) {
			e.printStackTrace();
		}

		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main", "data/input_result");
		mav.addObject("result", result);
		return mav;
	}
	
	// data Insert to MongoDB
	// for company detail page
	@RequestMapping("/input_result03")
	public ModelAndView getDataHandler4(@RequestParam Map map) {
		List list = null;
		boolean result = false;
		list = dataDao.getData((String)map.get("PK_NM_HASH"));
		result = dataDao.insert(list);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main", "data/input_result");
		mav.addObject("result", result);
		return mav;
	}
	
}
