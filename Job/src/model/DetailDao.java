package model;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.map.HashedMap;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DetailDao {

	@Autowired
	SqlSessionFactory factory;

	public List<HashedMap> score(String COMPANYNAME) {
		SqlSession session = factory.openSession();
		List<HashedMap> list = new ArrayList<>();
		try {
			list = session.selectList("mappers.career.detailscore", COMPANYNAME);
			return list;

		} finally {
			session.close();
		}
	}

	public List salary(String COMPANYNAME) {
		SqlSession session = factory.openSession();
		List<HashedMap> list = new ArrayList<>();
		try {
			list = session.selectList("mappers.career.detailsalary", COMPANYNAME);
			return list;

		} finally {
			session.close();
		}
	}

}