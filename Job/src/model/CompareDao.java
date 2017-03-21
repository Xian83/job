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
public class CompareDao {

	@Autowired
	SqlSessionFactory factory;
	
	// 선택된 회사명으로 score db에서 모든 정보 긁어오기
	public List compare (String cmpn) {
		SqlSession sql = null;
		List list = new ArrayList();
		try {
			sql = factory.openSession();
			list = sql.selectList("mappers.compare.select", cmpn);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sql.close();
		}
		return list;
	}
	
	// 비교목록 db에 넣는 작업
	public int insertclist (Map map) {
		int rst = 0;
		SqlSession sql = null;
		try {
			sql = factory.openSession();
			rst = sql.insert("mappers.compare.insert", map);
			if(rst==1) {
				sql.commit();
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			sql.close();
		}
		
		return rst;
	}
	
	
}
