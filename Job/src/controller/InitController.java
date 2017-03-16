package controller;

import java.io.BufferedReader;
import java.io.FileWriter;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.URL;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class InitController {
	// @RequestMapping("/index")
	@RequestMapping({ "/", "/index", "/index.jsp" })
	public ModelAndView InitHandler() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("root");
		try {
			URL url = new URL(
					"https://kreditjob.com/api/company/fssCompanyList?pagingIndex=1&pagingNum=1000&fssType=KOSDAQ&sortFss=CMPN_NM&order=ASC&_=1489488818233");
			String su = url.toString();
			System.out.println(url);
			System.out.println("!!!!!!!!!");

			/*
			 * Map map = HashMap(); map.put("PK_NM", PK_NM);
			 */

			InputStream is = url.openStream();
			InputStreamReader in = new InputStreamReader(is, "utf-8");
			BufferedReader br = new BufferedReader(in);

			String line;
			int i = 1;
			StringBuilder sb = new StringBuilder();
			while ((line = br.readLine()) != null) {
				// if(line.contains("disc_id") && line.contains("checkbox")){
				//
				// int n = line.indexOf("title");
				// int pre = line.indexOf("\"", n);
				// int end = line.indexOf("\"", pre+1);
				//
				// String data = line.substring(pre+1, end);
				// DecimalFormat df = new DecimalFormat("000");
				//
				// pw.println( df.format(i++) + "À§ : " + data);
				// }
				sb.append(line);

			}

			System.out.println("toString " + sb.toString());

			br.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

}
