package model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class SalaryDao {
	@Autowired
	SqlSessionFactory factory;
	
	public List<HashMap> getSalary() {
		List<HashMap> list = null;
		SqlSession sql = null;

		try {
			sql = factory.openSession();
			list = sql.selectList("mappers.company.getSalary");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sql.close();
		}

		return list;
	}
	
}
