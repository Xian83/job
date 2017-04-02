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

import com.fasterxml.jackson.core.JsonProcessingException;
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

		mav.addObject("msg", "媛쒖씤�젙蹂닿� 蹂�寃쎈릺�뿀�뒿�땲�떎");
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
	// return result by ajax - �깉�눜 泥섎━ / 鍮꾨�踰덊샇 3�쉶 �삤瑜섏떆, �옄�룞濡쒓렇�븘�썐 湲곕뒫 異붽� �븘�슂
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
			// �깉�눜泥섎━
			mDao.delete(data);
			result = "redirect:/login/logout"; // 濡쒓렇�븘�썐 �솕硫� �씠�룞
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

		// �궗吏� 遺덈윭�삤湲�
		String picURL = mydao.getLastetImageURL(email);
		if (picURL == null || picURL.equals("null"))
			picURL = "/image/default.jpg";
		mav.addObject("picURL", picURL);

		// 媛쒖씤�젙蹂� 蹂�寃�
		Map map = mDao.getData(email); // 疫꿸퀡�궚占쎌젟癰귨옙
		Map map2 = mydao.getdata(email); // �빊遺쏙옙占쎌젟癰귨옙
		List list = mydao.getlocations(); // �꽴占쏙옙�뼎筌욑옙占쎈열
		List list2 = mydao.getIndustries(); // �꽴占쏙옙�뼎占쎄텦占쎈씜�뤃占�

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

		// 異붿쿇 湲곗뾽(recommand)
		HashMap data = mDao.getInfo(email); // get data from member_Info table
		List reco = mypage.getRecommand(data); // get data from mongoDB(company)
		List list_r = mypage.getRecommand02(reco); // get data from score &
		// salary table

		mav.addObject("member", data); // 愿��떖吏��뿭(AREA),�궛�뾽援�(STNDD_BIG_GB),
		// �뿰遊뎜in/max
		mav.addObject("data", data);
		mav.addObject("reco", reco);
		mav.addObject("list_r", list_r);

		// �옄二� 蹂� 湲곗뾽(visit) - �뜲�씠�꽣 �옒 �븞 �꽆�뼱 �샂
		List<HashMap> list_v = mypage.getVisitData(email);
		mav.addObject("list_v", list_v);

		// System.out.println("�옄二� 蹂� 湲곗뾽 visit= " + list_v);

		// �뒪�겕�옪�븳 湲곗뾽(scrap)
		List<HashMap> list_s = mypage.getScrapData(email);
		mav.addObject("list_s", list_s);
		// System.out.println("�뒪�겕�옪 = " + list_s);

		List<HashMap> list_c = mypage.getCompareData(email);
		mav.addObject("list_c", list_c);
//		if(list_c.get(0).get("CM1")==null){
//			mav.addObject("info01", detail.getInfo02(search.getCompID("1")));
//			mav.addObject("info02", detail.getInfo02(search.getCompID("")));
//		}
//			String CM1 = (String) list_c.get(0).get("CM1");
//			String CM2 = (String) list_c.get(0).get("CM2");
//
//			String chartURL = makeChart_2(CM1, CM2);// graph
//
//			/* mav.addObject("main", "my/compareResult"); */
//			mav.addObject("score01", detail.score(CM1)); // FINANCE_SCORE,
//			// EMPLOYEE_SCORE
//			mav.addObject("score02", detail.score(CM2));
//			mav.addObject("info01", detail.getInfo02(search.getCompID(CM1)));
//			mav.addObject("info02", detail.getInfo02(search.getCompID(CM2)));
//			mav.addObject("chartURL", chartURL);
//	
	

		
		// HashMap
		// (summary
		// -
		// List)
		
		// =========================================================================================================
		// �궗吏� 遺덈윭�삤湲�
		String picURL = mydao.getLastetImageURL(email);
		if (picURL == null || picURL.equals("null"))
			picURL = "/image/default.jpg";
		// System.out.println("picURL = " + picURL);
		mav.addObject("picURL", picURL);

		// �궗吏� �벑濡�
		String url = (String) session.getAttribute("url");

		return mav;
	}

	@RequestMapping("/update_pic")
	public ModelAndView update_pic(@RequestParam(name = "pic") MultipartFile file, HttpSession session,
			MultipartHttpServletRequest req) throws Exception {
		ModelAndView mav = new ModelAndView();

		// 占쎄텢筌욑옙 占쏙옙占쎌뿯占쎌뵥 野껋럩�뒭筌랃옙 占쎈씜嚥≪뮆諭� 筌욊쑵六�
		String ct = file.getContentType();
		if (ct.startsWith("image")) {
			// 占쎈솁占쎌뵬 占쎈씜嚥≪뮆諭�
			Map map = fdao.execute(file);

			// �궗吏� 遺덈윭�삤湲�
			String email = req.getParameter("email");
			String picURL = mydao.getLastetImageURL(email);
			if (picURL == null || picURL.equals("null"))
				picURL = "/image/default.jpg";
			mav.addObject("picURL", picURL);
			// System.out.println("�뾽�뜲�씠�듃 picURL = " + picURL);

			// System.out.println("map = " + map);

			// DB �궗吏� 異붽�
			String url = (String) map.get("filelink");
			mav.addObject("url", url);

			boolean res = fdao.insert(email, url);
			if (res)
				mav.addObject("msg", "�봽濡쒗븘 �궗吏꾩씠 蹂�寃쎈릺�뿀�뒿�땲�떎");
			else
				mav.addObject("msg", "�봽濡쒗븘 �궗吏� �벑濡앹뿉 �떎�뙣�븯���뒿�땲�떎");
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
		// �궗吏� 異붽�
		String picURL = mydao.getLastetImageURL(email);
		if (picURL == null || picURL.equals("null"))
			picURL = "/image/default.jpg";

		return mav;
	}

	@ResponseBody
	@RequestMapping("/interestAjax")
	public Map interestAjaxHandler(@RequestParam(value = "name", required = true) List<String> name) {

		// checked Value 媛��졇�삤湲�
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

		// 異붿쿇 湲곗뾽(recommand)
		// member_Info(WKP_ADRS, STNDD_BIG_GB, SALARY_MIN, SALARY_MAX)
		HashMap data = mDao.getInfo(email);
		// System.out.println("info : " + data.toString());// �솗�씤�슜

		// 異붿쿇湲곗뾽 �젙蹂� 媛��졇�삤湲�
		List reco = mypage.getRecommand(data);

		// score db�뿉�꽌 cmpn_nm 湲곗��쑝濡� �뜲�씠�꽣 媛��졇�삤湲�
		List list_r = mypage.getRecommand02(reco);

		// System.out.println("異붿쿇 = " + list_r);
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
		// System.out.println("�궗�궗�궘�젣 �셿猷�");
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

		img += "&chco=FF0000,FF9900"; // �꽑 �깋源�
		img += "&chls=2.0,4.0,0.0|2.0,4.0,0.0&chxt=x";
		img += "&chxl=0:|洹쒕え쨌�삎�깭|�븞�젙�꽦|�꽦�옣�꽦|�닔�씡�꽦|議곗쭅臾명솕쨌遺꾩쐞湲�|湲됱뿬쨌蹂듬━�썑�깮|洹쇰Т�떆媛꽷룻쑕媛�|�꽦�옣쨌寃쎈젰|寃쎌쁺吏꽷룰꼍�쁺";
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

			// 以묐났泥댄겕
			List list_cc = cdao.comparelist(email, cm1, cm2);
			List list_ccc = cdao.comparelist(email, cm2, cm1);
			System.out.println("以묐났泥댄겕 : " + list_cc);
			if (list_cc.size() == 0 && list_ccc.size() == 0) {

				// 留덉씠�럹�씠吏��슜 鍮꾧탳 �뜲�씠�꽣 �뙎湲�
				Map map = new HashMap();
				map.put("email", email);
				map.put("cm1", cm1);
				map.put("cm2", cm2);
				int rst = cdao.insertclist(map);
			}

			// data setting
			// �쉶�궗紐�, �젏�닔(�옱臾댄룊媛�,�옱吏곸옄�룊媛�), 諛⑹궗�삎 洹몃옒�봽, �닽�옄(留ㅼ텧�븸, �쁺�뾽�씠�씡, �떦湲� �넀�씡, �궗�썝�닔)
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
	@RequestMapping(path="/visitgraph", produces="application/json;charset=utf-8")
	public String visitGraph(@RequestParam(name = "cm[]") List cm) throws JsonProcessingException {

		ModelAndView mav = new ModelAndView();
		List<HashMap> list = new ArrayList<>();
		List list2 = new ArrayList<>();

		for (int t = 0; t < cm.size(); t++) {
			HashMap map = new HashMap<>();
			list = mypage.visitgraph2((String) cm.get(t));
			map.put("cmpn" , cm.get(t));
			map.put("data", list);
			list2.add(map);
		}

		ObjectMapper om = new ObjectMapper();
		String str = om.writeValueAsString(list2);

		System.out.println(str);
		// System.out.println(map);
		// System.out.println(list2.get(0));
		// mav.setViewName("t5");
		// mav.addObject("main", "my/company");
		// mav.addObject("visit", map);
		return str;
	}

}