package model;

import java.math.BigDecimal;
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

	public int checkScrape(String COMPANYNAME, String email){
		SqlSession session = factory.openSession();
		Map map = new HashMap<>();
		map.put("CMPN_NM", COMPANYNAME);
		map.put("EMAIL", email);
		List<HashMap> list = new ArrayList<>();
		try{
			list = session.selectList("mappers.career.interest", map);
			if (list.size() == 0) {
				session.insert("mappers.career.push", map);
				return 0;
			}else {
				BigDecimal bd= (BigDecimal)list.get(0).get("LOVE");
				return bd.intValue();
			}
		}finally{
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
				BigDecimal bd= (BigDecimal)list.get(0).get("LOVE");
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

}
