package model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.commons.collections.map.HashedMap;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DummyDao {
	@Autowired
	SqlSessionFactory factory;

	public void plus() {
		SqlSession session = factory.openSession();
		List<HashedMap> list = new ArrayList<>();
		HashedMap map = new HashedMap();

		try {
			list = session.selectList("mappers.dummy.name");

			for (int i = 0; i < list.size(); i++) {
				map.put("CMPN_NM", list.get(i));
				map.put("NUM", (int) (Math.random() * 10000) + 100);

				 session.insert("mappers.dummy.push",map);
			}
		} finally {
			session.close();
		}
	}
}
