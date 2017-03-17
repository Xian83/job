package model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RankDao {

	
	@Autowired
	SqlSessionFactory factory;
	
	// 디폴트 평균연봉 내림차순
	/*public List salary() {
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
	}*/
	
	// 디폴트 평균연봉 내림차순
	public Map salary() {
		SqlSession sql = null;
		Map map = new HashMap();
		try {
			sql = factory.openSession();
			map = sql.selectOne("mappers.rank.avgsalary");
			
		} catch (Exception e) {
			e.printStackTrace();			
		} finally{
			sql.close();
		}	
		return map;
	}
	
	// 평균연봉 
	public List avgsalary(String avg) {
		SqlSession sql = null;
		List list = new ArrayList();
		try {
			sql = factory.openSession();
			list = sql.selectList("mappers.rank.avgsalary", avg);
			
		} catch (Exception e) {
			e.printStackTrace();			
		} finally{
			sql.close();
		}	
		return list;
	}
	
	// 신입연봉
	public List rookeysalary(String rookey) {
		SqlSession sql = null;
		List list = new ArrayList();
		try {
			sql = factory.openSession();
			list = sql.selectList("mappers.rank.rookeysalary", rookey);
			
		} catch (Exception e) {
			e.printStackTrace();			
		} finally{
			sql.close();
		}	
		return list;
	}
	
	// 평균연봉 로고까지
	public List avgsalary2(Map map) {
		SqlSession sql = null;
		List list = new ArrayList();
		try {
			sql = factory.openSession();
			list = sql.selectList("mappers.search.search", map.get("CMPN_NM"));
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			sql.close();
		}
		return list;
	}
	
	// 지역별 내림차순
		/*public List localsalary(String local) {
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
		}*/
}
