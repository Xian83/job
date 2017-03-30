package model;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Service
public class SearchDao {

	@Autowired
	SqlSessionFactory factory;

	// get Search Result by Company Name
	public List getData(String CName) throws IOException {
		SqlSession sql = null;
		List list = new ArrayList();

		try {
			sql = factory.openSession();
			list = sql.selectList("mappers.search.search", "%" + CName + "%");
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			sql.close();
		}
		return list;
	}

	// page 처리
	public List<HashMap> pasing(int start, int end, String search) {
		List<HashMap> SomeCompanies = new ArrayList<>();
		SqlSession sql = factory.openSession();
		try {
			Map map = new HashMap();
			map.put("search", "%" + search + "%");
			map.put("start", start);
			map.put("end", end);
			SomeCompanies = sql.selectList("mappers.search.pasing", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sql.close();
		}

		return SomeCompanies;
	}

	// get Search Result by detail condition
	public List getData(HttpServletRequest req) {
		List list = new ArrayList();
		try {
			String url = getURL(req);

			// connect
			Document doc = Jsoup.connect(url).get();
			System.out.println("URL : " + url);

			// store company names to list
			Elements cname = doc.select("dl.company_info dt");
			String[] cmpn = cname.text().split("\\s+");
			list.addAll(Arrays.asList(cmpn));

		} catch (IOException e) {
			e.printStackTrace();
		}

		return list;
	}

	// detail search result paging
	public List<HashMap> pasing2(int start, int end, List list) {
		List<HashMap> cmpn_info = new ArrayList<>();
		SqlSession sql = factory.openSession();
		try {
			Map map = new HashMap();
			map.put("list", list);
			map.put("start", start);
			map.put("end", end);
			cmpn_info = sql.selectList("mappers.search.pasinglist", list);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sql.close();
		}

		return cmpn_info;
	}

	public int getTotal(HttpServletRequest req) {
		List list = new ArrayList();
		int total = 0; // total data count

		try {
			// make full URL w/ condition
			String url = getURL(req);

			// connect
			Document doc = Jsoup.connect(url).get();

			// get total count
			Element cnt = doc.select(".iframe p").first();
			String[] ar = cnt.text().split("\\s+");
			ar[1] = ar[1].replaceAll("\\,", "");
			total = Integer.parseInt(ar[1].substring(0, ar[1].length() - 1));
			System.out.println(total);
		} catch (IOException e) {
			e.printStackTrace();
		}

		return total;
	}

	// get URL
	public String getURL(HttpServletRequest req) {
		String name = req.getParameter("search");
		String[] area = req.getParameterValues("chkSido");
		String[] industry = req.getParameterValues("chkJinhakCode");
		String[] size = req.getParameterValues("chkSize");
		String page = req.getParameter("page") == null ? "1" : req.getParameter("page");

		String condition = "";
		// Search Condition Setting
		// company name condition add
		if (name != null)
			condition += "&CName=" + name;

		// area condition add
		if (area != null) {
			if (!area[0].equals("전체")) {
				for (int i = 0; i < area.length; i++)
					condition += "&AreaSido=" + area[i];
			}
		}
		// industry condition add
		if (industry != null) {
			if (!industry[0].equals("전체")) {
				for (int i = 0; i < industry.length; i++)
					condition += "&JCode=" + industry[i];
			}
		}
		// company size condition add
		if (size != null) {
			if (!size[0].equals("전체")) {
				for (int i = 0; i < size.length; i++)
					condition += "&Size=" + size[i];
			}
		}

		String url = "http://www.careercatch.co.kr/Comp/Controls/ifrmCompList.aspx?flag=Search" + condition
				+ "&intCurrentPage=1&intPageSize=20&Sort=a.TotJum%20desc";

		System.out.println("URL = " + url);
		return url + "&CurrentPage=" + page;
	}

	// 회사별 CompID 가져오기
	public String getCompID(String CName) {
//		String url = "http://www.careercatch.co.kr/Comp/Controls/ifrmCompList.aspx?"
//				+"flag=Search&AreaSido=%EC%A0%84%EC%B2%B4&JCode=%EC%A0%84%EC%B2%B4&IsStock=&Size=%EC%A0%84%EC%B2%B4"
//				+"&GangsoType=&PublicCode=&IPO=%EC%A0%84%EC%B2%B4&ThemeName=&SubName=&GroupCode=&ReportGubun=&CName="
//				+CName+"&UserSetting=N&TypeJum=0&StableJum=0&GrowJum=0&ProfitJum=0&Sort=a.TotJum%20desc";
		
		String url = "http://www.careercatch.co.kr/Comp/Controls/ifrmCompList.aspx?flag=Search"
				+ "&intCurrentPage=1&intPageSize=20&Sort=a.TotJum%20desc&CName=" + CName;
		System.out.println("찾아본 주소 : " + url);
		int start = 0;
		int end = 0;
		String CompID = "";
		try {
			Document doc = Jsoup.connect(url).get();
			Elements e = doc.select(".company_info dt a");
			for (Element t : e) {
				System.out.println("회사이름 : " + t.text());
				System.out.println("===== " + t.attr("href"));
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

	// get param
	public String getParam(HttpServletRequest req) {
		String name = req.getParameter("search");
		String[] area = req.getParameterValues("chkSido");
		String[] industry = req.getParameterValues("chkJinhakCode");
		String[] size = req.getParameterValues("chkSize");

		String param = "";
		// Search Condition Setting
		// company name condition add
		if (name != null)
			param += "&CName=" + name;

		// area condition add
		if (area != null) {
			for (int i = 0; i < area.length; i++)
				param += "&AreaSido=" + area[i];
		}
		// industry condition add
		if (industry != null) {
			for (int i = 0; i < industry.length; i++)
				param += "&JCode=" + industry[i];
		}
		// company size condition add
		if (size != null) {
			for (int i = 0; i < size.length; i++)
				param += "&Size=" + size[i];
		}

		System.out.println("param : " +param);
		return param;
	}

}