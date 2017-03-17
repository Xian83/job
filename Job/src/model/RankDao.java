package model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RankDao {

	// 평균연봉 내림차순
	@Autowired
	SqlSessionFactory factory;
	
	public List avgsalary() {
		SqlSession sql = null;
		List list = new ArrayList();
		try {
			sql = factory.openSession();
			list = sql.selectList("mappers.rank.avgsalary");
			
		} catch (Exception e) {
			e.printStackTrace();			
		} finally{
			sql.close();
		}	
		return list;
	}
}
