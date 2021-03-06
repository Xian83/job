package controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
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
import org.springframework.web.bind.annotation.RequestParam;

import model.CareerCatchDao;

@Controller
public class CareerCatchController {

	@Autowired
	CareerCatchDao cdao;

	@RequestMapping("/test01")
	public void getDataHandler() {
		try {
			List li = new ArrayList();
			List image = new ArrayList<>();
			List division = new ArrayList<>();
			for (int p = 1; p <= 2328; p++) { // 50page
				InputStream is = new URL("http://www.careercatch.co.kr/Comp/Controls/ifrmCompList.aspx?CurrentPage=" + p
						+ "&intCurrentPage=2&UserSetting=&PublicCode=&intPageSize=20&IPO=&AreaSido=&ThemeName=&ReportGubun=&State=&StableJum=0&ApplyYN=&SubName=&GangsoType=&GrowJum=0&CName=&Sort=a.TotJum%20desc&JCode=&Size=&JScore=&GroupCode=&flag=Search&IsStock=&TypeJum=0&PageState=2")
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
			// System.out.println("image size = "+ image.size());
			// System.out.println("division size = "+ division.size());
			cdao.addCareer(image, li, division);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 커리어캐치 기업 상세 페이지
	@RequestMapping("/test02")
	public void getData2Handler() {
		List<HashMap> li1 = new ArrayList<>();
		List<String> li2 = new ArrayList<>();
		List<String> li3 = new ArrayList<>();

		// DB에 이미 있다고 가정하고 작업 진행
		// step 1 : get url by company name
		String url = "http://www.careercatch.co.kr/Comp/Controls/ifrmCompInfo.aspx?CompID=695091";

		try {
			Document doc = Jsoup.connect(url).get();
			for (int i = 0; i < 8; i++) {
				HashMap<String, Object> map = new HashMap<>();
				DecimalFormat df = new DecimalFormat("00");

				// get rank, company name, company score(재무평가, 재직자평판)
				Elements e = doc.select("#rptList2_ctl" + df.format(i) + "_tr td:not(.bdr1, .al1 nowrap)");
				// 5 (주)잇츠스킨 91.47
				// System.out.println(e.text());

				// score String split
				String[] ar = e.text().trim().split("\\s+");
				// System.out.println(ar[0]);
				// System.out.println(ar[1]);
				// System.out.println(ar[2]);

				// input data into HashMap
				map.put("rank", Integer.parseInt(ar[0]));
				map.put("cmpn", ar[1]);
				map.put("score", Double.parseDouble(ar[2]));

				li1.add(map);
			}

			// employee increase ratio
			Elements e2 = doc.select(".bg1 .al3");
			String[] ar = e2.text().trim().split("\\s+");
			for (int i = 12; i < ar.length; i++) {
				li2.add(ar[i]);
			}

			// industry scale rank
			Elements e3 = doc.select("td:not(.bdr1, .al1 nowrap, .al3)");
			String[] arr = e3.text().trim().split("\\s+");
			System.out.println("e3 : " + e3.text());
			for (String data : arr) {
				if (data.endsWith("위"))
					li3.add(data);
			}

		} catch (IOException e) {
			e.printStackTrace();
		}

		for (HashMap data : li1) {
			System.out.println(data.get("rank"));
			System.out.println(data.get("cmpn"));
			System.out.println(data.get("score"));
		}

		System.out.println(li2.size());
		for (String data : li2) {
			System.out.println(data);
		}
		System.out.println(li3.toString());
	}

	// 커리어캐치 기업 상세 페이지(개요)
	@RequestMapping("/test")
	public HashMap getData3Handler() {
		HashMap map = new HashMap<>();
		List<String> li1 = new ArrayList<>();

		// DB에 이미 있다고 가정하고 작업 진행
		// step 1 : get url by company name
		String url = "http://www.careercatch.co.kr/Comp/CompSummary.aspx?CompID=695091";
		// String url =
		// "http://www.careercatch.co.kr/Comp/CompSummary.aspx?CompID=126321";
		// String url =
		// "http://www.careercatch.co.kr/Comp/CompSummary.aspx?CompID=C38916";

		try {
			Document doc = Jsoup.connect(url).get();

			// 매출액, 영억이익, 당기손익, 사원수
			Elements e1 = doc.select(".table1 td");
			String[] ar = e1.text().trim().split("\\s+");
			li1.add(ar[6]);
			li1.add(ar[7]);
			li1.add(ar[8]);
			li1.add(ar[10]);
			System.out.println(ar[6] + " : " + ar[10]);
			map.put("summary", li1);

			// 회사 위치
			Elements e2 = doc.select("h4 .fw_normal");
			String[] ar2 = e2.text().trim().split("\\s+", 2);
			System.out.println("address : " + ar2[1]);
			map.put("address", ar2[1]);

			// 회사 제도, 사내문화 / 분위기
			int cnt = 0;
			Elements e3 = doc.select(".list_slash");
			if (e3 != null) {
				for (Element m : e3) {
					String key = cnt == 0 ? "system" : "culture";
					map.put(key, m.text());
					System.out.println(key + " : " + m.text());
					cnt++;
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return map;
	}

	// 회사별 CompID 가져오기
	@RequestMapping("/test99")
	public String getCompID(@RequestParam(name = "type") String CName) {
		CName ="삼성전자";
		
		String url = "http://www.careercatch.co.kr/Comp/Controls/ifrmCompList.aspx?flag=Search"
				+ "&intCurrentPage=1&intPageSize=20&CName=" + CName;

		int start = 0;
		int end = 0;
		String CompID = "";
		try {
			Document doc = Jsoup.connect(url).get();
			Elements e = doc.select(".company_info a");
			for (Element t : e) {
				if (t.text().equals(CName)) {
					CompID = t.attr("href");

					if (CompID.startsWith("/Comp/CompInfo.aspx?CompID=") && CompID.endsWith("&flag=Search")
							&& t.text().length() != 0) {

						start = CompID.indexOf("=");
						end = CompID.indexOf("&");
						CompID = CompID.substring(start + 1, end);

						System.out.println("회사코드 : " + CompID);
					}
				}
			}
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		return CompID;
	}
}