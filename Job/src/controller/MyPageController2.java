package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;


import model.FileUploadDao;

import model.DetailDao;
import model.MemberDao;
import model.MyInfoDao;
import model.MyPageDao;

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

	@RequestMapping("/company")
	public ModelAndView my_companyHandler(HttpSession session) throws Exception {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main", "/my/company");

		String email = (String) session.getAttribute("email");

		// 최근 본 기업(lately) : 별다른 추가 정보 없음
		

		
		// 추천 기업(recommand)
		HashMap data = mDao.getInfo(email); //(WKP_ADRS, STNDD_BIG_GB, SALARY_MIN, SALARY_MAX)
		System.out.println("info : " + data.toString());// 확인용
		//추천기업 정보 가져오기 
		List reco = mypage.getRecommand(data); // CMPN_NM, Salary 정보 가져옴
		// score db에서 cmpn_nm 기준으로 데이터 가져오기
		List list_r = detail.getScoreData(reco);
		
		for (Object map : list_r) {
			if (((Map) map).get("LOGO") == null) {
				((Map) map).put("LOGO", "http://image.jinhak.com/job/site/tmp02.gif");
			}
		}
		mav.addObject("list_r", list_r);
		System.out.println("추천 = " + list_r);
		
		// 자주 본 기업(visit) - 데이터 잘 안 넘어 옴
		List<HashMap> list_v = mypage.getVisitData(email);
		mav.addObject("list_v", list_v);
		System.out.println("자주 본 기업 visit= " + list_v);
		
		// 스크랩한 기업(scrap)
		List<HashMap> list_s = mypage.getScrapData(email);
		mav.addObject("list_s", list_s);
		System.out.println("스크랩 = " + list_s);
		System.out.println("email = "+email);
		
		// 비교한 기업(compare)
		List<HashMap> list_c = mypage.getCompareData(email);
		mav.addObject("list_c", list_c);
		System.out.println("비교 compare = " + list_c);

		// 사진 등록
		/*String ct = file.getContentType();
		if (ct.startsWith("image")) {
			// �뙆�씪 �뾽濡쒕뱶
			Map map = fdao.execute(file);
			System.out.println("map = " + map);
			
			// DB 사진 추가
			email = req.getParameter("email");
			String url = (String) map.get("filelink");
			mav.addObject("url", url);
			System.out.println("url = " + url);
			boolean res = fdao.insert(email, url);
			if (res)
				mav.addObject("msg", "프로필 사진이 변경되었습니다");
			else 
				mav.addObject("msg", "프로필 사진 등록에 실패하였습니다");
		} else {
			mav.addObject("msg", "Not Image File");
		}
		
		mav.addObject("url2", "/my/company");
		mav.setViewName("util/alert");
		*/
		
		return mav;
	}

@RequestMapping("/update_pic")
	public ModelAndView update_pic(@RequestParam(name="pic") MultipartFile file, 
			HttpSession session, MultipartHttpServletRequest req)
			throws Exception {
		ModelAndView mav = new ModelAndView();
		
		System.out.println("여기 넘어옴?");
		// �궗吏� ���엯�씤 寃쎌슦留� �뾽濡쒕뱶 吏꾪뻾
		String ct = file.getContentType();
		if (ct.startsWith("image")) {
			// �뙆�씪 �뾽濡쒕뱶
			Map map = fdao.execute(file);
			System.out.println("map = " + map);
			
			// DB 사진 추가
			String email = req.getParameter("email");
			String url = (String) map.get("filelink");
			mav.addObject("url", url);
			System.out.println("url = " + url);
			boolean res = fdao.insert(email, url);
			if (res)
				mav.addObject("msg", "프로필 사진이 변경되었습니다");
			else 
				mav.addObject("msg", "프로필 사진 등록에 실패하였습니다");
		} else {
			mav.addObject("msg", "Not Image File");
		}
		
		mav.addObject("url2", "/my/company");
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
			picURL = "/picture/default.jpg";

		return mav;
	}

	@ResponseBody
	@RequestMapping("/interestAjax")
	public Map interestAjaxHandler(@RequestParam(value = "name", required = true) List<String> name) {

		// checked Value 가져오기
		int i = 0;
		for (String value : name) {
			System.out.println(">>> name's value : " + value);
			i++;
		}

		Map result = new HashMap();
		return result;
	}

}
