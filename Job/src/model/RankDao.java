package model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RankDao {

	
	@Autowired
	SqlSessionFactory factory;
	
	// 평균연봉 내림차순
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
	
	// 지역별 내림차순
		public List localsalary(String local) {
			SqlSession sql = null;
			List list = new ArrayList();
			try {
				sql = factory.openSession();
				list = sql.selectList("mappers.rank.local", local);
				
			} catch (Exception e) {
				e.printStackTrace();			
			} finally{
				sql.close();
			}	
			return list;
		}
}
