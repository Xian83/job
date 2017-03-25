package model;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SalaryDao {
	@Autowired
	SqlSessionFactory factory;

	// same industry Avg Salary, Rookie Salary
	public HashMap getSalary(String type) {
		HashMap map = new HashMap<>();
		SqlSession sql = null;

		try {
			sql = factory.openSession();
			if(type.equals("all"))
				map = sql.selectOne("mappers.salary.getSalaryAll");
			else
				map = sql.selectOne("mappers.salary.getSalaryIndustry", type);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sql.close();
		}

		return map;
	}
}
