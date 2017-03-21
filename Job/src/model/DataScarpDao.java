package model;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.mongodb.BasicDBObject;
import com.mongodb.DBCollection;

@Service
public class DataScarpDao {
	@Autowired
	MongoTemplate template;
	
	// Scarping data(JSON String) from URL
	public String getData(Map map) throws IOException {
		URL url = new URL((String) map.get("url"));
		InputStream is = url.openStream();
		InputStreamReader in = new InputStreamReader(is, "utf-8");
		BufferedReader br = new BufferedReader(in);

		String line;
		StringBuilder sb = new StringBuilder();
		while ((line = br.readLine()) != null) {
			sb.append(line);
		}

		br.close();

		return sb.toString();
	}
	
	public boolean insert(String data) {
		boolean result = true;
		int cnt = 0;
		try {
			ObjectMapper om = new ObjectMapper();
			Map map = om.readValue(data, Map.class);
			Map map2 = (Map)map.get("data");
			ArrayList list = (ArrayList) map2.get("list");
			for (Object dataOne : list) {
//				System.out.println(((Map) dataOne).get("CMPN_NM"));
				template.insert((Map)dataOne, "company");
				cnt++;
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println("데이터갯수 : " + cnt);
		return result;
	}
	
	// get PK_NM_HASH List from company collection 
	public List getData(String column){		
		// Query 문 작성
		Query query = new Query();
		query.fields().include("PK_NM_HASH");
		System.out.println(query.toString());
		
		// 쿼리, 받을 객체, 컬렉션명
		List list = template.find(query, HashMap.class, "company");
		System.out.println("불러온 list 사이즈" + list.size());
		return list;
	}
	
	// insert data one by one
	public boolean insert(List list) {
		boolean result = true;
		
		int cnt = 0;
		try {
			for (Object dataOne : list) {
				// Use PK_NM_HASH get data(JSON String) from URL
				((Map) dataOne).put("url", "https://kreditjob.com/api/company/companyPage?PK_NM=" + ((Map) dataOne).get("PK_NM_HASH"));
				String data = getData((Map)dataOne);
				
				//String to Map 
				ObjectMapper om = new ObjectMapper();
				Map map = om.readValue(data, Map.class);
				
				// insert data
				template.insert((Map)map.get("data"), "company_info");
				cnt++;
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		System.out.println("입력한 데이터 : " + cnt);
		return result;
	}
	
	public boolean insert2(List list) {
		boolean result = true;
		List datas = new ArrayList();
		
		int cnt = 0;
		try {
			for (Object dataOne : list) {
				// Use PK_NM_HASH get data(JSON String) from URL
				((Map) dataOne).put("url", "https://kreditjob.com/api/company/companyPage?PK_NM=" + ((Map) dataOne).get("PK_NM_HASH"));
				String data = getData((Map)dataOne);
				
				//String to Map 
				ObjectMapper om = new ObjectMapper();
				Map map = om.readValue(data, Map.class);
				datas.add(new BasicDBObject(map));
				cnt++;
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println("데이터 수집 완료 : " + cnt);
		
		// insert data
		template.insertAll(datas);
		
		System.out.println("데이터 입력 완료 ");
		return result;
	}
}
