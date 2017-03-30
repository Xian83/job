package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.SearchDao;

@Controller
public class SearchController {

	@Autowired
	SearchDao sdao;

	// Search Page main
	@RequestMapping("/search")
	public ModelAndView searchHandler(HttpServletRequest req,
			@RequestParam(name = "CName", defaultValue = "") String CName) throws IOException {

		int cnt = CName.equals("") ? 40231 : sdao.getTotal(req);
		int size = cnt % 20 == 0 ? cnt / 20 : cnt / 20 + 1;
		String pStr = req.getParameter("page") == null ? "1" : req.getParameter("page");

//		int start = (Integer.parseInt(pStr) - 1) * 20 + 1;
//		int end = Integer.parseInt(pStr) * 20;

//		// 페이지 분할
//		List<HashMap> list = sdao.pasing(start, end, CName);
		
		// 커리어 캐치에서 기업명 List 가져오기
		List list = sdao.getData(req);
		System.out.println(list.size() + "개 기업 데이터 불러오는 중 ...");

		// 기업명 기준으로 DB에서 데이터 가져오기
		list = sdao.getDataByCName(list);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("search");
		mav.addObject("main", "search/list_form");
		mav.addObject("cnt", cnt);
		mav.addObject("size", size);
		mav.addObject("page", pStr);
		mav.addObject("list", list);
		mav.addObject("CName", CName);
		mav.addObject("key", sdao.getParam(req)); // paging 처리용

		return mav;
	}

	// Detail Search Result Ajax
	@RequestMapping("/search/detail")
	public ModelAndView detailHandler(HttpServletRequest req) {

		int cnt = sdao.getTotal(req); // 커리어 캐치에서 total data 개수 가져옴
		int size = cnt % 20 == 0 ? cnt / 20 : cnt / 20 + 1; // 총 페이지 수
		String pStr = req.getParameter("page") == null ? "1" : req.getParameter("page");

		// 커리어 캐치에서 기업명 List 가져오기
		List list = sdao.getData(req);
		System.out.println(list.size() + "개 기업 데이터 불러오는 중 ...");

		// 기업명 기준으로 DB에서 데이터 가져오기
		list = sdao.getDataByCName(list);

		// 상세 검색 목록 뷰
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/search/searchAjax");
		mav.addObject("list", list);
		mav.addObject("page", pStr);
		mav.addObject("cnt", cnt);
		mav.addObject("size", size);
		mav.addObject("key", sdao.getParam(req)); // paging 처리용
		return mav;
	}

}