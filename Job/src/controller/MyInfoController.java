package controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
		mav.setViewName("t1");

		mav.addObject("main", "my/my_info");

		String email = (String) session.getAttribute("email");
		
		Map map = mdao.getData(email); // 기본정보
		Map map2 = mydao.getdata(email); // 추가정보
		List list = mydao.getlocations(); // 관심지역
		List list2 = mydao.getIndustries(); // 관심산업군

		// DB에서 프로필 사진 가져와서 처리
		String picURL = mydao.getLastetImageURL(email);
		if (picURL == null || picURL.equals("null"))
			picURL = "/default.jpg";

		mav.addObject("url", picURL);
		mav.addObject("location", list);
		mav.addObject("industry", list2);
		mav.addObject("infos", map);
		mav.addObject("likeinfos", map2);
		mav.addObject("main", "my/my_info");

		/*
		 * PictureDao pDao = new PictureDao(); String picURL =
		 * pDao.getLastetImageURL(id); if(picURL== null){ picURL =
		 * "/picture/default.jpg"; } MemberDao mDao = new MemberDao(); // ����
		 * ���� ����ϹǷ� ������ ������� HashMap<String, Object> val =
		 * mDao.getDetails(id);// ���ϵǴ� ���� �̸�, ����, ����, �̸��� �ּҵ���
		 * ����� �־�� ��
		 * 
		 * request.setAttribute("url", picURL); request.setAttribute("map",
		 * val);
		 * 
		 */

		return mav;
	}

	@RequestMapping("/result")
	public ModelAndView resultHandler(HttpSession session, @RequestParam Map data) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		mav.addObject("main", "/my/result");

		String email = (String) session.getAttribute("email");
		data.put("email", email);
		int rst = mydao.update(data);
		System.out.println("Map rst = " + rst);
		System.out.println("�Ķ���� = " + data);
		return mav;
	}

	@RequestMapping("/update_pic")
	public ModelAndView update_pic(@RequestParam(name="pic") MultipartFile file, HttpSession session, MultipartHttpServletRequest req)
			throws Exception {
		ModelAndView mav = new ModelAndView();

		// 사진 타입인 경우만 업로드 진행
		String ct = file.getContentType();
		if (ct.startsWith("image")) {
			// 파일 업로드
			Map map = fdao.execute(file);

			// DB 업로드
//			String email = (String) session.getAttribute("eamil");
			String email = req.getParameter("email");
			String url = (String) map.get("filelink");
			
			boolean res = fdao.insert(email, url);
			if (!res)
				mav.addObject("msg", "사진 업로드 실패");
		} else {
			mav.addObject("msg", "Not Image File");
		}
		
		mav.setViewName("redirect:/my/info");
		return mav;

	}
}