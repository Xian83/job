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
			picURL = "/image/default.jpg";

		
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

	
}