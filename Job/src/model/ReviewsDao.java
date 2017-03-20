package model;

import java.io.IOException;
import java.util.*;
import org.apache.commons.collections.map.HashedMap;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReviewsDao {

	@Autowired
	SqlSessionFactory factory;

	public List<HashedMap> review() {
		SqlSession session = factory.openSession();
		List<HashedMap> list = new ArrayList<>();
		try {
			list = session.selectList("mappers.review.review");
			return list;
		} finally {
			session.close();
		}
	}

	public List<HashedMap> rank() {
		SqlSession session = factory.openSession();
		List<HashedMap> list = new ArrayList<>();
		try {
			list = session.selectList("mappers.review.rank");
			return list;
		} finally {
			session.close();
		}
	}

	public int push(String cmpn_nm, String content, String email) {

		SqlSession session = factory.openSession();
		int a = 0;
		Map map = new HashMap();
		map.put("CMPN_NM", cmpn_nm);
		map.put("CONTENTS", content);
		map.put("EMAIL", email);
		try {
			a = session.insert("mappers.review.push", map);
			System.out.println(a);
			return a;
		} catch (Exception e) {
			e.printStackTrace();
			return a;

		} finally {
			session.close();

		}

	}

	//
	// public List<HashedMap> salary() {
	// SqlSession session = factory.openSession();
	// List<HashedMap> list = new ArrayList<>();
	// try{
	// list = session.selectList("mappers.review.r2");
	// return list;
	// }finally{
	// session.close();
	// }
	// }

}
