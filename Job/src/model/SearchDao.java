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
}
