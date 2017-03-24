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
				session.insert("mappers.career.push", map);
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
			System.out.println("e3 : " + e3.text());
			for (String str : arr) {
				if (str.endsWith("위"))
					li3.add(str);
			}
			data.put("scale", li3);
			
		} catch (IOException e) {
			e.printStackTrace();
		}

		return data;
	}
	
	// 작업 미완성
	public HashMap<String, List> getInfo02(String CompID) {
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
			System.out.println("e3 : " + e3.text());
			for (String str : arr) {
				if (str.endsWith("위"))
					li3.add(str);
			}
			data.put("scale", li3);
			
		} catch (IOException e) {
			e.printStackTrace();
		}

		return data;
	}
}
