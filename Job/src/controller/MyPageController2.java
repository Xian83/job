package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

import model.CompareDao;
import model.DetailDao;
import model.FileUploadDao;
import model.MemberDao;
import model.MyInfoDao;
import model.MyPageDao;
import model.SearchDao;

@Controller
@RequestMapping("/my")
public class MyPageController2 {
   @Autowired
   MemberDao mDao;

   @Autowired
   MyPageDao mypage;

   @Autowired
   MyInfoDao mydao;

   @Autowired
   DetailDao detail;

   @Autowired
   FileUploadDao fdao;

   @Autowired
   SearchDao search;

   @Autowired
   CompareDao cdao;

   @RequestMapping("/result")
   public ModelAndView resultHandler(HttpServletResponse response, HttpSession session, @RequestParam Map data)
         throws Exception {
      ModelAndView mav = new ModelAndView();
      mav.setViewName("t1");
      mav.addObject("main", "/my/result");

      String email = (String) session.getAttribute("email");
      data.put("email", email);
      int rst = mydao.update(data);

      // Changing New Password
      Map map = mDao.getData(email);
      String pass1 = (String) map.get("PASS");
      String pass = (String) data.get("passcheck");
      if (pass == "") {
         pass = pass1;
      }
      if (pass != null && pass1 != pass) {
         Map m = new HashMap<>();
         m.put("pass", pass);
         m.put("email", email);
         int rst2 = mydao.updatePass(m);
      }

      String birth = (String) data.get("birth");
      Map b = new HashMap<>();
      b.put("birth", birth);
      b.put("email", email);
      int rst3 = mydao.updateBirth(b);

      mav.addObject("msg", "개인정보가 변경되었습니다");
      mav.addObject("url2", "/my/edit");
      mav.setViewName("util/alert");

      return mav;
   }

   @RequestMapping("/leave_form")
   public ModelAndView leave_formHandler(HttpSession session) {
      ModelAndView mav = new ModelAndView();
      mav.setViewName("t1");
      mav.addObject("main", "/my/leave_form");

      return mav;
   }

   // @RequestMapping(name="/leave_result", produces="application/text;
   // charset=utf8")
   // return result by ajax - 탈퇴 처리 / 비밀번호 3회 오류시, 자동로그아웃 기능 추가 필요
   @ResponseBody
   @RequestMapping("/leave_result")
   public boolean leave_resultHandler(HttpSession session, @RequestParam(name = "pass") String pass) {
      // ModelAndView mav = new ModelAndView();
      // mav.setViewName("tt");
      // mav.addObject("main", "/my/leave_result");

      String email = (String) session.getAttribute("email");
      int cnt = (int) session.getAttribute("leave_try");

      // email, pass check
      HashMap data = new HashMap<>();
      data.put("email", email);
      data.put("pass", pass);
      boolean res = mDao.existCheck(data);

      String result = "";

      if (res) {
         // 탈퇴처리
         mDao.delete(data);
         result = "redirect:/login/logout"; // 로그아웃 화면 이동
      } else {
         // increase password error count up
         session.setAttribute("leave_try", cnt++);
      }
      return res;
   }

   @RequestMapping("/edit")
   public ModelAndView my_editHandler(HttpSession session) throws Exception {

      ModelAndView mav = new ModelAndView();
      mav.setViewName("t1");
      mav.addObject("main", "/my/edit");

      String email = (String) session.getAttribute("email");

      // 사진 불러오기
      String picURL = mydao.getLastetImageURL(email);
      if (picURL == null || picURL.equals("null"))
         picURL = "/image/default.jpg";
      mav.addObject("picURL", picURL);

      // 개인정보 변경
      Map map = mDao.getData(email); // 湲곕낯�젙蹂�
      Map map2 = mydao.getdata(email); // 異붽��젙蹂�
      List list = mydao.getlocations(); // 愿��떖吏��뿭
      List list2 = mydao.getIndustries(); // 愿��떖�궛�뾽援�

      mav.addObject("picURL", picURL);
      mav.addObject("location", list);
      mav.addObject("industry", list2);
      mav.addObject("infos", map);
      mav.addObject("likeinfos", map2);

      return mav;
   }

   @RequestMapping("/company")
   public ModelAndView my_companyHandler(HttpServletResponse response, HttpSession session) throws Exception {

      ModelAndView mav = new ModelAndView();
      mav.setViewName("t1");
      mav.addObject("main", "/my/company");

      String email = (String) session.getAttribute("email");

      // 추천 기업(recommand)
      HashMap data = mDao.getInfo(email); // get data from member_Info table
      List reco = mypage.getRecommand(data); // get data from mongoDB(company)
      List list_r = mypage.getRecommand02(reco); // get data from score &
      // salary table

      mav.addObject("member", data); // 관심지역(AREA),산업군(STNDD_BIG_GB),
      // 연봉min/max
      mav.addObject("data", data);
      mav.addObject("reco", reco);
      mav.addObject("list_r", list_r);

      // 자주 본 기업(visit) - 데이터 잘 안 넘어 옴
      List<HashMap> list_v = mypage.getVisitData(email);
      mav.addObject("list_v", list_v);

      // System.out.println("자주 본 기업 visit= " + list_v);

      // 스크랩한 기업(scrap)
      List<HashMap> list_s = mypage.getScrapData(email);
      mav.addObject("list_s", list_s);
      // System.out.println("스크랩 = " + list_s);

      // System.out.println("CMPN_NM = " + CMPN_NM);
      //List<HashMap> visit = mypage.visitgraph("삼성전자");
   //   System.out.println("test 입니다 ===============" + visit.get(0).get("NUM"));
      // System.out.println("visit==============="+visit.get(0).get("NUM"));
      // 이렇게 쓰시오 조회수
      // mav.addObject("visit",visit);
      // if (CMPN_NM != null) {
      // boolean rst = mypage.deleteScrap(email, CMPN_NM);
      // System.out.println("삭제 됐어유");
      // /*
      // * if (rst) response.sendRedirect("/my/company");
      // */
      // }
      // 비교한 기업(compare)
      List<HashMap> list_c = mypage.getCompareData(email);
      mav.addObject("list_c", list_c);
      // System.out.println("비교 compare = " + list_c);
      String CM1 = (String) list_c.get(0).get("CM1");
      String CM2 = (String) list_c.get(0).get("CM2");

      String chartURL = makeChart_2(CM1, CM2);// graph

      /* mav.addObject("main", "my/compareResult"); */
      mav.addObject("score01", detail.score(CM1)); // FINANCE_SCORE,
                                          // EMPLOYEE_SCORE
      mav.addObject("score02", detail.score(CM2));
      mav.addObject("info01", detail.getInfo02(search.getCompID(CM1))); // HashMap
                                                         // (summary
                                                         // -
                                                         // List)
      mav.addObject("info02", detail.getInfo02(search.getCompID(CM2)));
      mav.addObject("chartURL", chartURL);

      // 사진 불러오기
      String picURL = mydao.getLastetImageURL(email);
      if (picURL == null || picURL.equals("null"))
         picURL = "/image/default.jpg";
      // System.out.println("picURL = " + picURL);
      mav.addObject("picURL", picURL);

      // 사진 등록
      String url = (String) session.getAttribute("url");

      return mav;
   }

   @RequestMapping("/update_pic")
   public ModelAndView update_pic(@RequestParam(name = "pic") MultipartFile file, HttpSession session,
         MultipartHttpServletRequest req) throws Exception {
      ModelAndView mav = new ModelAndView();

      // �궗吏� ���엯�씤 寃쎌슦留� �뾽濡쒕뱶 吏꾪뻾
      String ct = file.getContentType();
      if (ct.startsWith("image")) {
         // �뙆�씪 �뾽濡쒕뱶
         Map map = fdao.execute(file);

         // 사진 불러오기
         String email = req.getParameter("email");
         String picURL = mydao.getLastetImageURL(email);
         if (picURL == null || picURL.equals("null"))
            picURL = "/image/default.jpg";
         mav.addObject("picURL", picURL);
         // System.out.println("업데이트 picURL = " + picURL);

         // System.out.println("map = " + map);

         // DB 사진 추가
         String url = (String) map.get("filelink");
         mav.addObject("url", url);

         boolean res = fdao.insert(email, url);
         if (res)
            mav.addObject("msg", "프로필 사진이 변경되었습니다");
         else
            mav.addObject("msg", "프로필 사진 등록에 실패하였습니다");
      } else {
         mav.addObject("msg", "Not Image File");
      }
      mav.addObject("url2", "/my/edit");
      mav.setViewName("util/alert");
      return mav;

   }

   @RequestMapping("/interest")
   public ModelAndView interestHandler(HttpSession session) {
      List<HashMap> list = mypage.getScrapData((String) session.getAttribute("email"));

      ModelAndView mav = new ModelAndView();
      mav.setViewName("tt");
      mav.addObject("main", "/my/interest");
      mav.addObject("list", list);

      String email = (String) session.getAttribute("email");
      // 사진 추가
      String picURL = mydao.getLastetImageURL(email);
      if (picURL == null || picURL.equals("null"))
         picURL = "/image/default.jpg";

      return mav;
   }

   @ResponseBody
   @RequestMapping("/interestAjax")
   public Map interestAjaxHandler(@RequestParam(value = "name", required = true) List<String> name) {

      // checked Value 가져오기
      int i = 0;
      for (String value : name) {
         // System.out.println(">>> name's value : " + value);
         i++;
      }

      Map result = new HashMap();
      return result;
   }

   @RequestMapping("/reco")
   public void testHandler(HttpSession session) {
      String email = (String) session.getAttribute("email");

      // 추천 기업(recommand)
      // member_Info(WKP_ADRS, STNDD_BIG_GB, SALARY_MIN, SALARY_MAX)
      HashMap data = mDao.getInfo(email);
      // System.out.println("info : " + data.toString());// 확인용

      // 추천기업 정보 가져오기
      List reco = mypage.getRecommand(data);

      // score db에서 cmpn_nm 기준으로 데이터 가져오기
      List list_r = mypage.getRecommand02(reco);

      // System.out.println("추천 = " + list_r);
   }

   @RequestMapping("/applyInfo")
   public ModelAndView link() {
      ModelAndView mav = new ModelAndView("t1");
      mav.addObject("main", "/my/applyInfo");
      return mav;
   }

   @ResponseBody
   @RequestMapping("/deleteScrap")
   public boolean deleteScrapHandler(@RequestParam(name = "email") String email,
         @RequestParam(name = "CMPN_NM") String name) {
      boolean rst = mypage.deleteScrap(email, name);
      // System.out.println("사사삭제 완료");
      return rst;
   }

   public String makeChart_2(String cm1, String cm2) {
      System.out.println("cm1 =" + cm1 + " / cm2 = " + cm2);

      HashMap data1 = detail.getScore02(cm1);
      HashMap data2 = detail.getScore02(cm2);

      int size = 400;
      String img = "https://chart.googleapis.com/chart?cht=r&chs=" + size + "x" + size;
      img += "&chd=t:";
      img += data1.get("LABEL01") + "," + data1.get("LABEL02") + "," + data1.get("LABEL03") + ",";
      img += data1.get("LABEL04") + "," + data1.get("LABEL05") + "," + data1.get("LABEL06") + ",";
      img += data1.get("LABEL07") + "," + data1.get("LABEL08") + "," + data1.get("LABEL09") + ","
            + data1.get("LABEL01") + "|";

      img += data2.get("LABEL01") + "," + data2.get("LABEL02") + "," + data2.get("LABEL03") + ",";
      img += data2.get("LABEL04") + "," + data2.get("LABEL05") + "," + data2.get("LABEL06") + ",";
      img += data2.get("LABEL07") + "," + data2.get("LABEL08") + "," + data2.get("LABEL09") + ","
            + data2.get("LABEL01");

      img += "&chco=FF0000,FF9900"; // 선 색깔
      img += "&chls=2.0,4.0,0.0|2.0,4.0,0.0&chxt=x";
      img += "&chxl=0:|규모·형태|안정성|성장성|수익성|조직문화·분위기|급여·복리후생|근무시간·휴가|성장·경력|경영진·경영";
      img += "&chxr=0,0.0,360.0";
      img += "&chdl=" + cm1 + "|" + cm2 + "&chdlp=t";

      return img;
   }

   @ResponseBody
   @RequestMapping("/compare")
   public ModelAndView InitHandler1(@RequestParam(name = "cm1") String cm1, @RequestParam(name = "cm2") String cm2,
         HttpSession session) {
      ModelAndView mav = new ModelAndView();
      // mav.addObject("default", );
      String auth = (String) session.getAttribute("auth");

      if (auth.equals("yes")) {
         String email = (String) session.getAttribute("email");

      // 중복체크
      			List list_cc = cdao.comparelist(email, cm1, cm2);
      			List list_ccc = cdao.comparelist(email, cm2, cm1);
      			System.out.println("중복체크 : "+list_cc);
      				if (list_cc.size() == 0 && list_ccc.size() ==0) {
      					
      					// 마이페이지용 비교 데이터 쌓기
      					Map map = new HashMap();
      					map.put("email", email);
      					map.put("cm1", cm1);
      					map.put("cm2", cm2);
      					int rst = cdao.insertclist(map);
      				}

         // data setting
         // 회사명, 점수(재무평가,재직자평가), 방사형 그래프, 숫자(매출액, 영업이익, 당기 손익, 사원수)
         String chartURL = makeChart_2(cm1, cm2);// graph

         mav.setViewName("t5");
         mav.addObject("main", "my/compareResult");
         mav.addObject("score01", detail.score(cm1)); // FINANCE_SCORE,
                                             // EMPLOYEE_SCORE
         mav.addObject("score02", detail.score(cm2));
         mav.addObject("info01", detail.getInfo02(search.getCompID(cm1))); // HashMap
                                                            // (summary
                                                            // -
                                                            // List)
         mav.addObject("info02", detail.getInfo02(search.getCompID(cm2)));
         mav.addObject("chartURL", chartURL);

      }
      return mav;

   }

   @ResponseBody
   @RequestMapping("/visitgraph")
   public HashMap visitGraph(@RequestParam(name = "cm[]") List cm) {
      
      System.out.println(cm.size());
      ModelAndView mav = new ModelAndView();
      List<HashMap> list = new ArrayList<>();
      HashMap map = new HashMap<>();
      
      for (int t = 0; t < cm.size(); t++) {
         list = mypage.visitgraph((String)cm.get(t));
         map.put(cm.get(t), list);   
      }

      System.out.println("mapsize?=================="+map.size());
   
//      mav.setViewName("t5");
//      mav.addObject("main", "my/company");
//      mav.addObject("visit", map);
      return map;
   }
}