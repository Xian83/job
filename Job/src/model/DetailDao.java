package model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DetailDao {

	@Autowired
	SqlSessionFactory factory;

	public List<HashedMap> score(String COMPANYNAME) {
		SqlSession session = factory.openSession();
		List<HashedMap> list = new ArrayList<>();
		try {
			list = session.selectList("mappers.career.detailscore", COMPANYNAME);
			return list;

		} finally {
			session.close();
		}
	}

	public List salary(String COMPANYNAME) {
		SqlSession session = factory.openSession();
		List<HashedMap> list = new ArrayList<>();
		try {
			list = session.selectList("mappers.career.detailsalary", COMPANYNAME);
			return list;

		} finally {
			session.close();
		}
	}
	
	public List same(String DIVISION){
		SqlSession session = factory.openSession();
		List<HashedMap> list = new ArrayList<>();
		try{
			list = session.selectList("mappers.career.detailsame", DIVISION);
			return list;
		}finally{
			session.close();
		}
	}
	
	public List review(String COMPANYNAME){
		SqlSession session = factory.openSession();
		List<HashedMap> list = new ArrayList<>();
		try{
			list = session.selectList("mappers.career.review", COMPANYNAME);
			return list;
		}finally{
			session.close();
		}
	}
	
	public void insertVisit(String COMPANYNAME, String email){
		SqlSession session = factory.openSession();
		Map map = new HashMap<>();
		map.put("EMAIL", email);
		map.put("CMPN_NM", COMPANYNAME);
		try{
			session.insert("mappers.career.visit", map);
		}finally {
			session.close();
		}
	}
	
	public int insertInterest(String COMPANYNAME, String email){
		SqlSession session = factory.openSession();
		Map map = new HashMap<>();
		map.put("CMPN_NM", COMPANYNAME);
		map.put("EMAIL", email);
		List<HashMap> list = new ArrayList<>();
		try{
			list = session.selectList("mappers.career.interest",map);
			
			
			if((int)list.get(0).get("LOVE")==0){
				session.update("mappers.carrer.plus",map);
				return 1;
			}else if((int)list.get(0).get("LOVE")==1){
				session.update("mappers.carrer.minus",map);
				return 0;
			}else{
				session.insert("mappers.carrer.interest2", map);
				return 1;
			}
				
		}finally {
			session.close();
		}
	}

}
