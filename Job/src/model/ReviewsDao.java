package model;

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
		try{
			list = session.selectList("mappers.review.review");
			return list;
		}finally{
			session.close();
		}
	}
	
	public List<HashedMap> score() {
		SqlSession session = factory.openSession();
		List<HashedMap> list = new ArrayList<>();
		try{
			list = session.selectList("mappers.review.r1");
			return list;
		}finally{
			session.close();
		}
	}
	
	public List<HashedMap> salary() {
		SqlSession session = factory.openSession();
		List<HashedMap> list = new ArrayList<>();
		try{
			list = session.selectList("mappers.review.r2");
			return list;
		}finally{
			session.close();
		}
	}
	
}
