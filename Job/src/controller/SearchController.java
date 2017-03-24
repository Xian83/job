package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import model.SearchDao;

@Controller
@RequestMapping("/search")
public class SearchController {

	@Autowired
	SearchDao sdao;

	// Search Page main
	@RequestMapping("/company")
	public ModelAndView searchHandler(HttpServletRequest request,
			@RequestParam(name = "search", defaultValue = "") String CName) throws IOException {

		// 기업명 기준 검색 결과 DB 가져오기
		List list = sdao.getData(CName);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main", "search/list_form");
		mav.addObject("list", list);

		mav = paging(list, mav, request, CName);

		return mav;
	}
	
	// default Search Paging 처리
	public ModelAndView paging(List list, ModelAndView mav, HttpServletRequest request, String CName) {

		int cnt = list.size();
		int size = cnt % 20 == 0 ? cnt / 20 : cnt / 20 + 1;
		mav.addObject("cnt", cnt);
		mav.addObject("size", size);

		String pStr = request.getParameter("page") == null ? "1" : request.getParameter("page");
		mav.addObject("page", pStr);

		int start = (Integer.parseInt(pStr) - 1) * 20 + 1;
		int end = Integer.parseInt(pStr) * 20;

		// 페이지 분할
		List<HashMap> list2 = sdao.pasing(start, end, CName);
		mav.addObject("list2", list2);

		return mav;
	}

	// Detail Search Result Ajax
	@RequestMapping("/detail")
	@ResponseBody
	public HashMap detailSearchHandler(HttpServletRequest req) {
		HashMap data = new HashMap();
		
		// Paging 
		int cnt = sdao.getTotal(req);
		int size = cnt % 20 == 0 ? cnt / 20 : cnt / 20 + 1;
		String pStr = req.getParameter("page") == null ? "1" : req.getParameter("page");
		
		int start = (Integer.parseInt(pStr) - 1) * 20 + 1;
		int end = Integer.parseInt(pStr) * 20;

		// get 기업명.
		List list = sdao.getData(req);
		
		// 페이지 분할 데이터
		list = sdao.pasing2(start, end, list);
		data.put("list", list);
		data.put("size", size);
		data.put("page", pStr);		
		
		return data;
	}
	
	public boolean check(HttpServletRequest req){
		boolean result = false;
		String name = req.getParameter("search");
		String[] area = req.getParameterValues("chkSido");
		String[] industry = req.getParameterValues("chkJinhakCode");
		String[] size = req.getParameterValues("chkSize");
		String page = req.getParameter("page") == null ? "1" : req.getParameter("page");
		
		if(area == null && industry == null && size == null){
			
		}
		
		return result;
	}
}