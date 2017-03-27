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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import model.SearchDao;

@Controller
@RequestMapping("/search")
public class SearchController {

   @Autowired
   SearchDao sdao;

   // 효정 - 시도중 - 보류
   @RequestMapping("/detailPage")
   public ModelAndView detailPageSearchHandler(HttpServletRequest req2, HashMap data) {
   
     System.out.println("페이지 넘어 옴");
   
     ModelAndView mav = new ModelAndView();
     mav.setViewName("search2");
     mav.addObject("main", "/search/searchAjax");
     mav.addObject("list2", data);
     mav.addObject("page", data.get("pStr"));
     mav.addObject("size", data.get("size"));
     
     
     System.out.println("여기서의 data = " + data);
     
     System.out.println("req p2 = " + req2.getAttribute("page"));
  
     
      return mav;
   }
   
   
   
   // Search Page main
   @RequestMapping("/company")
   public ModelAndView searchHandler(HttpServletRequest request,
         @RequestParam(name = "search", defaultValue = "삼성") String CName) throws IOException {

      // 기업명 기준 검색 결과 DB 가져오기
      List list = sdao.getData(CName);

      ModelAndView mav = new ModelAndView();
      mav.setViewName("search");
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
      public ModelAndView detailSearchHandler(HttpServletRequest req) {
         HashMap data = new HashMap();

         // paging 처리
         int cnt = sdao.getTotal(req);
         int size = cnt % 20 == 0 ? cnt / 20 : cnt / 20 + 1;
         String pStr = req.getParameter("page") == null ? "1" : req.getParameter("page");

         int start = (Integer.parseInt(pStr) - 1) * 20 + 1;
         int end = Integer.parseInt(pStr) * 20;

         // get 기업명
         List list = sdao.getData(req);
      
         // 페이지 분할 데이터
         list = sdao.pasing2(start, end, list);
         data.put("list", list);
         data.put("size", size);
         data.put("page", pStr);
         
         // 상세 검색 목록 뷰 
         ModelAndView mav = new ModelAndView();
         // 다시 작업 해야 함 - 푸터가 중간에 또 찍히는 문제 있음
         mav.setViewName("search2");
         mav.addObject("main", "/search/searchAjax");
         mav.addObject("list2", data);
         mav.addObject("page", pStr);
         mav.addObject("size", size);
         System.out.println("data ==== " + data);
         
         mav = detailPageSearchHandler(req, data);
         
         return mav;
      }
   

   // 주소 바꿔서 위의 걸로 사용하고 있음
   // Detail Search Result Ajax
   @RequestMapping("/detail_2")
   @ResponseBody
   public HashMap detailSearch_2Handler(HttpServletRequest req) {
      HashMap data = new HashMap();
   
      // paging 처리
      int cnt = sdao.getTotal(req);
      int size = cnt % 20 == 0 ? cnt / 20 : cnt / 20 + 1;
      String pStr = req.getParameter("page") == null ? "1" : req.getParameter("page");

      int start = (Integer.parseInt(pStr) - 1) * 20 + 1;
      int end = Integer.parseInt(pStr) * 20;

      // get 기업명
      List list = sdao.getData(req);
      
      // 페이지 분할 데이터
      list = sdao.pasing2(start, end, list);
      data.put("list", list);
      data.put("size", size);
      data.put("page", pStr);   
      
      ModelAndView mav = new ModelAndView();
     
      
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