package model;

import java.io.IOException;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DetailDao {

	@Autowired
	SqlSessionFactory factory;

	public HashMap score(String COMPANYNAME) {
		SqlSession session = factory.openSession();
		HashMap map = new HashMap();
		try {
			map = session.selectOne("mappers.career.detailscore", COMPANYNAME);

		} finally {
			session.close();
		}
		return map;
	}

	public HashMap salary(String COMPANYNAME) {
		SqlSession session = factory.openSession();
		HashMap map = new HashMap();
		try {
			map = session.selectOne("mappers.career.detailsalary", COMPANYNAME);

		} finally {
			session.close();
		}
		return map;
	}

	public List same(String DIVISION) {
		SqlSession session = factory.openSession();
		List<HashedMap> list = new ArrayList<>();
		try {
			list = session.selectList("mappers.career.detailsame", DIVISION);
			return list;
		} finally {
			session.close();
		}
	}

	public List review(String COMPANYNAME) {
		SqlSession session = factory.openSession();
		List<HashedMap> list = new ArrayList<>();
		try {
			list = session.selectList("mappers.career.review", COMPANYNAME);
			return list;
		} finally {
			session.close();
		}
	}

	public void insertVisit(String COMPANYNAME, String email) {
		SqlSession session = factory.openSession();
		Map map = new HashMap<>();
		map.put("EMAIL", email);
		map.put("CMPN_NM", COMPANYNAME);
		try {
			session.insert("mappers.career.visit", map);
		} finally {
			session.close();
		}
	}

	public int checkScrape(String COMPANYNAME, String email) {
		SqlSession session = factory.openSession();
		Map map = new HashMap<>();
		map.put("CMPN_NM", COMPANYNAME);
		map.put("EMAIL", email);
		List<HashMap> list = new ArrayList<>();
		try {
			list = session.selectList("mappers.career.interest", map);
			if (list.size() == 0) {
				return 0;
			} else {
				BigDecimal bd = (BigDecimal) list.get(0).get("LOVE");
				return bd.intValue();
			}
		} finally {
			session.close();
		}
	}

	public int insertInterest(String COMPANYNAME, String email) {
		SqlSession session = factory.openSession();
		Map map = new HashMap<>();
		map.put("CMPN_NM", COMPANYNAME);
		map.put("EMAIL", email);
		List<HashMap> list = new ArrayList<>();
		Integer love = 1;
		try {
			list = session.selectList("mappers.career.interest", map);
			// System.out.println(list.toString());
			// System.out.println(list.size());
			if (list.size() == 0) {
				session.insert("mappers.career.push", map);
				return 1;
			} else {
				BigDecimal bd = (BigDecimal) list.get(0).get("LOVE");
				love = bd.intValue();
			}

			if (love == 0) {
				session.update("mappers.career.plus", map);
				return 1;
			} else {
				session.update("mappers.career.minus", map);
				return 0;
			}

		} finally {
			session.close();
		}
	}

	public HashMap<String, List> getInfo01(String CompID) {
		HashMap<String, List> data = new HashMap<>();
		List<HashMap> li1 = new ArrayList<>();
		List<String> li2 = new ArrayList<>();
		List<String> li3 = new ArrayList<>();

		String url = "http://www.careercatch.co.kr/Comp/Controls/ifrmCompInfo.aspx?CompID=" + CompID;

		try {
			Document doc = Jsoup.connect(url).get();
			for (int i = 0; i < 8; i++) {
				HashMap<String, Object> map = new HashMap<>();
				DecimalFormat df = new DecimalFormat("00");

				// get rank, company name, company score(finance)
				Elements e = doc.select("#rptList2_ctl" + df.format(i) + "_tr td:not(.bdr1, .al1 nowrap)");

				// score String split
				String[] ar = e.text().trim().split("\\s+");

				// input data into HashMap
				map.put("rank", Integer.parseInt(ar[0]));
				map.put("cmpn", ar[1]);
				map.put("score", Double.parseDouble(ar[2]));

				li1.add(map);
			}
			data.put("rank8", li1);

			// employee increase ratio
			Elements e2 = doc.select(".bg1 .al3");
			String[] ar = e2.text().trim().split("\\s+");
			for (int i = 12; i < ar.length; i++) {
				li2.add(ar[i]);
			}
			data.put("employee", li2);

			// industry scale rank
			Elements e3 = doc.select("td:not(.bdr1, .al1 nowrap, .al3)");
			String[] arr = e3.text().trim().split("\\s+");
			for (String str : arr) {
				if (str.endsWith("위")) {
					li3.add(str);
//					System.out.println(str);
				}
			}
			data.put("scale", li3);

		} catch (IOException e) {
			e.printStackTrace();
		}

		return data;
	}

	// 기업 개요 페이지 정보
	public HashMap getInfo02(String CompID) {
		HashMap data = new HashMap<>();
		List<String> li1 = new ArrayList<>();

		String url = "http://www.careercatch.co.kr/Comp/CompSummary.aspx?CompID=" + CompID;

		try {
			Document doc = Jsoup.connect(url).get();

			// 매출액, 영억이익, 당기손익, 사원수
			Elements e1 = doc.select(".table1 td");

			int flag = 1;
			for (Element t : e1) {
				if (flag == 5)
					data.put("num01", t.text());
				if (flag == 6)
					data.put("num02", t.text());
				if (flag == 7)
					data.put("num03", t.text());
				if (flag == 9)
					data.put("num04", t.text());
				flag++;
			}
//			System.out.println("매출액 : " + data.get("num01"));
//			System.out.println("영업이익 : " + data.get("num02"));
//			System.out.println("당기손익 : " + data.get("num03"));
//			System.out.println("사원수 : " + data.get("num04"));

			// 회사 위치
			Elements e2 = doc.select("h4 .fw_normal");
			String[] ar2 = e2.text().trim().split("\\s+", 2);
//			System.out.println("주소 : " + e2.text());
			if(ar2.length > 1){
				data.put("address", ar2[1]);
//				System.out.println("address : " + ar2[1]);
			} else {
				data.put("address", "");
			}

			// 회사 제도, 사내문화 / 분위기
			int cnt = 0;
			Elements e3 = doc.select(".list_slash");
			if (e3 != null) {
				for (Element m : e3) {
					String key = cnt == 0 ? "system" : "culture";
					data.put(key, m.text());
//					System.out.println(key + " : " + m.text());
					cnt++;
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return data;
	}

	public HashMap getScore02(String COMPANYNAME) {
		SqlSession session = factory.openSession();
		HashMap map = new HashMap();
		try {
			map = session.selectOne("mappers.company.getScore02", COMPANYNAME);

		} finally {
			session.close();
		}
		return map;
	}

//	public List<HashMap> getScoreData(List data) {
//		List<HashMap> list = new ArrayList<>();
//		HashMap map = new HashMap();
//		
//		// 기업명 기준으로 넘기고, 추천 기업 가져오기
//		SqlSession session = factory.openSession();
//		try {
//			map = session.selectOne("mappers.company.getScore03", data);
//
//		} finally {
//			session.close();
//		}
//		
//		
//		return list;
//	}

	public HashMap<String, Integer> manWomanrate(String COMPANYNAME) {
		SqlSession session = factory.openSession();
		List<HashedMap> list = new ArrayList<>();
		HashMap<String, Integer> data = new HashMap<>();
		try {

			data.put("man", session.selectList("mappers.career.man", COMPANYNAME).size());		
			data.put("woman", session.selectList("mappers.career.woman", COMPANYNAME).size());	
//			System.out.println("남자===================="+session.selectList("mappers.career.man", COMPANYNAME).size());
//			System.out.println("여자===================="+session.selectList("mappers.career.woman", COMPANYNAME).size());
			//data.put("visi", session.selectList("mappers.career.visi", COMPANYNAME).size());
		} finally {
			session.close();
		}
		return data;
	}
	
	public HashMap inqurity(String COMPANYNAME){
		SqlSession session = factory.openSession();
		HashMap<String, Number> map = new HashMap<>();
		try{
			session.update("mappers.career.inqur", COMPANYNAME);//회사들어올때 조회수
			map = session.selectOne("mappers.career.total",COMPANYNAME);//sum으로 들어옴
			
		}finally {
			session.close();
		}
		return map;
	}

}
