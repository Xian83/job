package controller;

import java.io.BufferedReader;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import model.CareerCatchDao;

@Controller
public class CareerCatchController {

	@Autowired
	CareerCatchDao cdao;

	@RequestMapping("/test")
	public void getDataHandler() {
		try {
			List li = new ArrayList();
			List image = new ArrayList<>();
			List division = new ArrayList<>();
			for (int p = 1; p <= 2328; p++) { // 50page
				InputStream is = new URL("http://www.careercatch.co.kr/Comp/Controls/ifrmCompList.aspx?CurrentPage="+p+"&intCurrentPage=2&UserSetting=&PublicCode=&intPageSize=20&IPO=&AreaSido=&ThemeName=&ReportGubun=&State=&StableJum=0&ApplyYN=&SubName=&GangsoType=&GrowJum=0&CName=&Sort=a.TotJum%20desc&JCode=&Size=&JScore=&GroupCode=&flag=Search&IsStock=&TypeJum=0&PageState=2")
								.openStream();
				BufferedReader br = new BufferedReader(new InputStreamReader(is));
				// for (int i = 0; i <= 240; i++) {
				// br.readLine();
				// }
				Pattern img = Pattern.compile("(<img\\s+)(.*)(/>)");// 이미지 파일 범위

				String line;
				StringBuilder sb = new StringBuilder();
				while ((line = br.readLine()) != null) {
					sb.append(line);
					Matcher mImg = img.matcher(line);// 이미지파일에 맞는 정규식이 있는지 한줄씩
					if (mImg.find()) {
						int s = mImg.start();
						int e = mImg.end(); // 이미지 파일이 있는 정규식이 있다면 시작과 끝을 뽑음
						String found = line.substring(s, e);
						Pattern src = Pattern.compile("(src=)\'(http://.+\\.*)\'(.*)");
						Matcher mSrc = src.matcher(found); // 그룹을 2개로 나눠 이미지 정규식
						if (mSrc.find()) {
							String t = mSrc.group(2);

							image.add(t.substring(0, t.length() - 11));
						}
					}
				}
				br.close();
				Document doc = Jsoup.parse(sb.toString());
				Elements elm = doc.select("dl.company_info a");
				for (Element m : elm) {

					if (m.text().length() != 0) {

						li.add(m.text());

					}
				}
				
				Document doc2 = Jsoup.parse(sb.toString());
				Elements elm2 = doc.select("p.txt span");
				for (Element m : elm2) {

					if (m.text().length() != 0) {

						division.add(m.text());

					}
				}
			}
//			 System.out.println("image size = "+ image.size());
//			 System.out.println("division size = "+ division.size());
		cdao.addCareer(image, li, division);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}