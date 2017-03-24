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

	// �Ϻκ��� �����͸� ����Ʈȭ �����ִ� �޼���
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
	public List getData(HttpServletRequest req){
		List list = new ArrayList();
		try{
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
			for (int i = 0; i < area.length; i++)
				condition += "&AreaSido=" + area[i];
		}
		// industry condition add
		if (industry != null) {
			for (int i = 0; i < industry.length; i++)
				condition += "&JCode=" + industry[i];
		}
		// company size condition add
		if (size != null) {
			for (int i = 0; i < size.length; i++)
				condition += "&Size=" + size[i];
		}

		String url = "http://www.careercatch.co.kr/Comp/Controls/ifrmCompList.aspx?flag=Search" + condition
				+ "&intCurrentPage=1&intPageSize=20";

		return url + "&CurrentPage=" + page;
	}
}