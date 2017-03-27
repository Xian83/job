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
import model.MemberDao;
import model.MyInfoDao;

@Controller
@RequestMapping("/my")
public class MyInfoController {

	@Autowired
	MemberDao mdao;
	@Autowired
	MyInfoDao mydao;
	@Autowired
	FileUploadDao fdao;

	@RequestMapping("/info")
	public ModelAndView infoHandler(HttpSession session, @RequestParam Map data) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("tt");

		mav.addObject("main", "my/my_info");
		
		String email = (String) session.getAttribute("email");
		// 사진 추가
		String picURL = mydao.getLastetImageURL(email);
		if (picURL == null || picURL.equals("null"))
			picURL = "/picture/default.jpg";

		
		Map map = mdao.getData(email); // 湲곕낯�젙蹂�
		Map map2 = mydao.getdata(email); // 異붽��젙蹂�
		List list = mydao.getlocations(); // 愿��떖吏��뿭
		List list2 = mydao.getIndustries(); // 愿��떖�궛�뾽援�
		
		

		mav.addObject("url", picURL);
		mav.addObject("location", list);
		mav.addObject("industry", list2);
		mav.addObject("infos", map);
		mav.addObject("likeinfos", map2);
		mav.addObject("main", "my/my_info");
		
		System.out.println("FACEBOOK = " + map.get("FACEBOOK"));
		System.out.println("FACEBOOK map = " + map);
	
		return mav;
	}

	@RequestMapping("/result")
	public ModelAndView resultHandler(HttpSession session, @RequestParam Map data) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("tt");
		mav.addObject("main", "/my/result");

		String email = (String) session.getAttribute("email");
		data.put("email", email);
		int rst = mydao.update(data);	
		
		String pass1 = (String) session.getAttribute("pass");
		String pass = (String) data.get("passcheck");
		System.out.println("pass1 = " + pass1 + "/ pass = " + pass);
		if(pass != null && pass1 != pass) {
		Map m = new HashMap<>();
			m.put("pass", pass);
			m.put("email", email);
		int rst2 = mydao.updatePass(m);
		}
		
		String birth = (String) data.get("birth");
		Map b = new HashMap<>();
			b.put("birth", birth);
			b.put("email", email);
			System.out.println("map b = " + b );
		int rst3 = mydao.updateBirth(b);
		System.out.println("rst3  = " + rst3 );

		return mav;
	}

	@RequestMapping("/update_pic")
	public ModelAndView update_pic(@RequestParam(name="pic") MultipartFile file, HttpSession session, MultipartHttpServletRequest req)
			throws Exception {
		ModelAndView mav = new ModelAndView();
		// �궗吏� ���엯�씤 寃쎌슦留� �뾽濡쒕뱶 吏꾪뻾
		String ct = file.getContentType();
		if (ct.startsWith("image")) {
			// �뙆�씪 �뾽濡쒕뱶
			Map map = fdao.execute(file);
			System.out.println("map = " + map);

			// DB 사진 추가
			String email = req.getParameter("email");
			String url = (String) map.get("filelink");
			
			boolean res = fdao.insert(email, url);
			if (res)
				mav.addObject("msg", "파일 등록됨");
			else 
				mav.addObject("msg", "파일 등록실패");
		} else {
			mav.addObject("msg", "Not Image File");
		}
		mav.addObject("url","/my/info");
		mav.setViewName("util/alert");
		return mav;

	}
	
	
	@RequestMapping("/leave_form")
	public ModelAndView leave_formHandler(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("tt");
		mav.addObject("main", "/my/leave_form");
		
		return mav;
	}
	
	// return result by ajax
	@ResponseBody
	@RequestMapping("/leave_result")
	public boolean leave_resultHandler(HttpSession session, @RequestParam(name="pass") String pass ) {
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName("tt");
//		mav.addObject("main", "/my/leave_result");
		
		String email = (String) session.getAttribute("email");
		int cnt = (int) session.getAttribute("leave_try");
		
		// email, pass check 
		HashMap data = new HashMap<>();
		data.put("email", email);
		data.put("pass", pass);
		boolean res = mdao.existCheck(data);
		
		// increase password error count up
		if(!res)
			session.setAttribute("leave_try", cnt++);
		
		return res;
	}
}