package model;

import java.io.BufferedReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.URL;
import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class SalaryDao {
	@Autowired
	SqlSessionFactory factory;
	
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

	public boolean insert(String data, String type) throws JsonParseException, JsonMappingException, IOException {		
		boolean result = false;
		SqlSession sql = null;
		
		try {
			sql = factory.openSession();
			
			ObjectMapper om = new ObjectMapper();
			Map map = om.readValue(data, Map.class);
			ArrayList list = (ArrayList) map.get("data");

			for (Object dataOne : list) {
				int cnt = 0;
				
				if(type.equals("a"))
					cnt = sql.insert("mappers.company.inputA", (Map) dataOne);
				else if(type.equals("b"))
					cnt = sql.insert("mappers.company.inputB", (Map) dataOne);
				
				if(cnt == 1){
					sql.commit();
					result = true;
				} else
					result = false;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		} finally{
			sql.close();
		}
		return result;
	}
}
