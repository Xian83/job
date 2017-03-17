package model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class SearchDao {

	@Autowired
	SqlSessionFactory factory;
	
	// 회사 이름 검색 - 검색어 포함된 회사 목록
	public List search1(String search) throws IOException {		
		SqlSession sql = null;
		List list = new ArrayList();
		
		try {
			sql = factory.openSession();
			
				list = sql.selectList("mappers.search.search", "%"+search+"%");
				

		} catch (Exception e) {
			e.printStackTrace();
		
		} finally{
			sql.close();
		}
		return list;
	}
	
	
	// 일부분의 데이터를 리스트화 시켜주는 메서드
	public List<HashMap> pasing(int start, int end,String search) {
		List<HashMap> SomeCompanies = new ArrayList<>();
		SqlSession sql = factory.openSession();
		try {
			Map map = new HashMap();
				map.put("search", "%"+search+"%");
				map.put("start", start);
				map.put("end", end);
			SomeCompanies = sql.selectList("mappers.search.pasing", map);  // mapper 쿼리 문에 매개 변수 필요하면 써 줘야 함 -
																						// 여러개면 map으로 넣어야 함
			
			System.out.println("SomeCompanies ? " + SomeCompanies.toString());
				System.out.println("페이징 처리 완료");
			 } catch (Exception e){
				 e.printStackTrace();
				 System.out.println("페이징 처리 실패");
			 } finally {
				 sql.close();
		} 
	
		return SomeCompanies;

	}
}
