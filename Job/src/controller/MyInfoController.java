package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
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

		Map map = mdao.getData(email);
		List list = mydao.getlocations();
		List list2 = mydao.getIndustries();
		Map map2 = mydao.getdata(email);
		String url = "/default.jpg";

		mav.addObject("url", url);
		mav.addObject("location", list);
		mav.addObject("industry", list2);
		mav.addObject("infos", map);
		mav.addObject("likeinfos", map2);

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
		System.out.println("파라미터 = " +data);
		return mav;
	}

	@RequestMapping("/update_pic")
	public ModelAndView update_pic(HttpSession session, @RequestParam (name="pic") MultipartFile file) throws Exception {
		
	         ModelAndView mav = null;
	         	mav.setViewName("t1");
	         	mav.addObject("main", "/my/update_pic");
	         String email = (String)session.getAttribute("email");
	         System.out.println("email = " + email);
	         HashMap map = fdao.execute(file);
	         //System.out.println(map.get("fileaddress"));
	            map.put("email", email);
	            
	    		System.out.println("pic map ? " + map);
	         boolean rst = mydao.insertPic(map);
	         if(rst) {
	        	 mav = new ModelAndView("/my/update_pic");
	            System.out.println("등록 성공");   
	            return mav;
	         }else {
	            mav = new ModelAndView("/my/update_pic");
	          
	            System.out.println("등록 실패");
	         }
	            return mav;   
	    	
	   }
}