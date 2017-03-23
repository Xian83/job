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
		// mav.addObject("listSize", list.size());

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
	public HashMap detailSearchHandler(@RequestParam Map map, HttpServletRequest request) {
		// 테스트용 데이터 세팅
		map.put("search", "삼성");
		// map.put("AreaSido", new String[]{"부산", "서울"});
		// map.put("JCode", new String[]{"J1", "J2"});
		// map.put("Size", new String[]{"0", "1"});

		List list = null;
		HashMap data = new HashMap();

		try {
			list = sdao.getData(map);
			data = paging(list, request, data);
		} catch (IOException e) {
			e.printStackTrace();
		}

		// list2, page, size 만 넘겨주면 된다.
		return data;
	}

	public HashMap paging(List list, HttpServletRequest request, HashMap data) {

		int cnt = list.size();
		int size = cnt % 20 == 0 ? cnt / 20 : cnt / 20 + 1;
		String pStr = request.getParameter("page") == null ? "1" : request.getParameter("page");

		int start = (Integer.parseInt(pStr) - 1) * 20 + 1;
		int end = Integer.parseInt(pStr) * 20;

		// 페이지 분할 데이터
		List<HashMap> list2 = sdao.pasing2(start, end, list);

		data.put("list2", list2);
		data.put("size", size);
		data.put("page", pStr);
		return data;
	}

}
