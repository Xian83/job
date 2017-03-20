package model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RecommandDao {
	@Autowired
	SqlSessionFactory factory;

	public List getData(Map data) {
		List list = new ArrayList();
		SqlSession sql = null;

		try {
			sql = factory.openSession();
			list = sql.selectList("mappers.mypage.recommand", data);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sql.close();
		}
		return list;
	}
}
