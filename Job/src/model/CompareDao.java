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
	
	/*public List compare (Map map) {
		SqlSession sql = null;
		List list = new ArrayList();
		try {
			sql = factory.openSession();
			list = sql.selectList("mappers.compare.select", map.get("CMPN_NM"));
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sql.close();
		}
		return list;
	}*/
}
