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
	
	// 선택된 회원이 본 비교리스트 불러오기 
	public List comparelist (String email, String cm1, String cm2) {
		SqlSession sql = null;
		List list = new ArrayList();
		try {
			sql = factory.openSession();
			HashMap map = new HashMap();
			map.put("email", email);
			map.put("cm1", cm1);
			map.put("cm2", cm2);
			list = sql.selectList("mappers.compare.listall", map);
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
