package controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.MemberDao;
import model.MyInfoDao;

@Controller
@RequestMapping("/my")
public class MyInfoController {
	
	@Autowired
	MemberDao mdao;
	@Autowired
	MyInfoDao mydao;

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
			
		mav.addObject("location", list);
		mav.addObject("industry", list2);
		mav.addObject("infos", map);
		mav.addObject("likeinfos", map2);
		
	/*	PictureDao pDao = new PictureDao();
		String picURL = pDao.getLastetImageURL(id);
		if(picURL== null){
			picURL = "/picture/default.jpg";
		}
		MemberDao mDao = new MemberDao();  // 내용 갖다 써야하므로 생성자 만들어줌
		HashMap<String, Object> val = mDao.getDetails(id);// 리턴되는 값에 이름, 나이, 성별, 이메일 주소들이 담겨져 있어야 함
		
		request.setAttribute("url", picURL);
		request.setAttribute("map", val);
		
		*/
		
		return mav;
	}
	@RequestMapping("/result")
	public ModelAndView resultHandler(HttpSession session, @RequestParam Map data) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t1");
		//mav.addObject("main", "my/result");
		
		String email = (String) session.getAttribute("email");
		data.put("email", email);
		int rst = mydao.update(data);
		System.out.println("Map rst = " + rst);
		System.out.println("파라미터 = " +data);
		return mav;
	}


	
}
