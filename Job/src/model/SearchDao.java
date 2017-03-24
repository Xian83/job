package model;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public List getData(String [] AreaSido, String [] JCode, String [] Size, String search ) throws IOException {
		List<String> list = new ArrayList();
		

		String condition = "";
		// Search Condition Setting
		// company name condition add
		if (search != null)
			condition += "&CName=" + search;

		// area condition add
		if (AreaSido != null) {
			for (int i = 0; i < AreaSido.length; i++)
				condition += "&AreaSido=" + AreaSido[i];
		}
		// industry condition add
		if (JCode != null) {
			for (int i = 0; i < JCode.length; i++)
				condition += "&JCode=" + JCode[i];
		}
		// company size condition add
		if (Size != null) {
			for (int i = 0; i < Size.length; i++)
				condition += "&Size=" + Size[i];
		}

		String url = "http://www.careercatch.co.kr/Comp/Controls/ifrmCompList.aspx?flag=Search" 
				+ condition + "&intCurrentPage=1&intPageSize=20";
		
		// --------------------------------------------------------------
		// Search		
		try {
			int page = 1;	// current page
			int total = 0;	// total data count
			
			search : 
			while(true){
				
				// connect
				Document doc = Jsoup.connect(url + "&CurrentPage=" + page).get();
				System.out.println("URL : " + url + "&CurrentPage=" + page);
				System.out.println(doc.toString() + "=======================");
				// check total count
				Element cnt = doc.select(".iframe p").first();
				String[] ar = cnt.text().split("\\s+");
				ar[1] = ar[1].replaceAll("\\,", "");
				total = Integer.parseInt(ar[1].substring(0, ar[1].length()-1));
				System.out.println(total);
				
				// break condition
				if(total == 0 || page ==  5)
					break search;
				
				// store company names to list
				Elements cname = doc.select("dl.company_info dt");				
				String[] cmpn = cname.text().split("\\s+");
				list.addAll(Arrays.asList(cmpn));
				
				page++;
			}

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
}
