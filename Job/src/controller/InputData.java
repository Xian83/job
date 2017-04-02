package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.CompanyDao;
import model.DataScarpDao;
import model.DummyDataGeneratorDao;
import model.MyPageDao;

@Controller
public class InputData {

	@Autowired
	CompanyDao cDao;

	@Autowired
	DataScarpDao dataDao;

	@Autowired
	MyPageDao dummy;

	@Autowired
	DummyDataGeneratorDao generate;

	@RequestMapping("/input_data")
	public ModelAndView formDataHandler() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main", "data/input_data");
		return mav;
	}

	// ���� �۾���
	// @RequestMapping("/input_result")
	// public ModelAndView getDataHandler(@RequestParam Map map) {
	// String data = "";
	// boolean result = false;
	// try {
	// data = cDao.getData(map);
	// result = cDao.insert2(data, (String) map.get("type"));
	//
	// } catch (IOException e) {
	// e.printStackTrace();
	// }
	//
	// ModelAndView mav = new ModelAndView();
	// mav.setViewName("t1");
	// mav.addObject("main", "data/input_result");
	// mav.addObject("result", result);
	// return mav;
	// }

	// �󼼰˻� DB �߰���
	@RequestMapping("/input_result")
	public ModelAndView getDataHandler2(@RequestParam Map map) {
		String data = "";
		boolean result = false;
		try {
			data = cDao.getData(map);
			result = cDao.insert(data);

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
		list = dataDao.getData((String) map.get("PK_NM_HASH"));
		result = dataDao.insert2(list);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main", "data/input_result");
		mav.addObject("result", result);
		return mav;
	}

	// dummy data input
	@RequestMapping("/input_result04")
	public ModelAndView inputDataHandler5() {
		boolean result = false;

		result = dummy.insert();

		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main", "data/input_result");
		mav.addObject("result", result);
		return mav;
	}

	// dummy data input to salary
	@RequestMapping("/input_result05")
	public ModelAndView inputDataHandler6() {
		boolean result = false;

		List<HashMap> li1 = cDao.getScore(); // score data
		List<HashMap> li2 = cDao.getSalary(); // salary data

		List<String> score = new ArrayList<>();
		List<String> salary = new ArrayList<>();
		for (HashMap map : li1) {
			score.add((String) map.get("CMPN_NM"));
		}
		for (HashMap map : li2) {
			salary.add((String) map.get("CMPN_NM"));
		}

		// duplicated company name removed
		System.out.println("중복 제거 전 : " + score.size());
		score.removeAll(salary);
		System.out.println("중복 제거 후 : " + score.size());

		// generate dummy data
		result = generate.insert(score);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main", "data/input_result");
		mav.addObject("result", result);
		return mav;
	}

	// dummy data input to score2 table : 방사형 그래프용
	@RequestMapping("/input_result06")
	public ModelAndView inputDataHandler7() {
		boolean result = false;

		List<HashMap> list = cDao.getScore(); // score data

		// generate dummy data
		result = generate.insert2(list);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main", "data/input_result");
		mav.addObject("result", result);
		return mav;
	}

	// dummy data input to visit table : 방문자 성별 분석용
	@RequestMapping("/input_result07")
	public ModelAndView inputDataHandler8() {
		boolean result = false;

		List<HashMap> list = cDao.getScore(); // score data

		// generate dummy data
		result = generate.insertVisit(list);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main", "data/input_result");
		mav.addObject("result", result);
		return mav;
	}

	// dummy data input to visit table : 방문자 성별 분석용
	@RequestMapping("/input_result08")
	public ModelAndView inputDataHandler9() {
		boolean result = false;

		List<HashMap> list = cDao.getScore(); // score data

		// generate dummy data
		result = generate.insertReview(list);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main", "data/input_result");
		mav.addObject("result", result);
		return mav;
	}
}
