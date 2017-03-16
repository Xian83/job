package controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;


@Controller
public class CompanyDtController {
	
	@RequestMapping("/company")
	public ModelAndView searchByNameHandler(@RequestParam Map map){
		ModelAndView mav = new ModelAndView("company/detail_form");
		String name = (String)map.get("search");
		String target = "인증키 ㅠㅠ";
		
		try {
			URL url = new URL(target);
			BufferedReader br = new BufferedReader(new InputStreamReader(url.openStream()));
			String outstr = "";
			while(true){
				String str =br.readLine();
				if(str==null){
					break;
				}
				outstr += str;
			}
			Map m = new ObjectMapper().readValue(outstr, Map.class);
			mav.addObject("search", m);
		
			return mav;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return mav;
		}
	}
}
