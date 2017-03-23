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

	// AvgSalary Top 50
	public List<HashMap> avgsalary(int count) {
		SqlSession sql = null;
		List<HashMap> list = new ArrayList<>();
		try {
			sql = factory.openSession();
			list = sql.selectList("mappers.rank.avg", count);
			// System.out.println(list);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sql.close();
		}
		return list;
	}

	// RookieSalary Top 50
	public List<HashMap> rookiesalary(int count) {
		SqlSession sql = null;
		List<HashMap> list = new ArrayList<>();
		try {
			sql = factory.openSession();
			list = sql.selectList("mappers.rank.rookie", count);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sql.close();
		}
		return list;
	}

	// Finance Score Top 50
	public List<HashMap> financeScore(int count) {
		SqlSession sql = null;
		List<HashMap> list = new ArrayList<>();
		try {
			sql = factory.openSession();
			list = sql.selectList("mappers.rank.finance", count);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sql.close();
		}
		return list;
	}

	// Finance Score Top 50
	public List<HashMap> employeeScore(int count) {
		SqlSession sql = null;
		List<HashMap> list = new ArrayList<>();
		try {
			sql = factory.openSession();
			list = sql.selectList("mappers.rank.employee", count);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sql.close();
		}
		return list;
	}

	// Scrap count Top 3
	public List<HashMap> scrapCount(int count) {
		SqlSession sql = null;
		List<HashMap> list = new ArrayList<>();
		try {
			sql = factory.openSession();
			list = sql.selectList("mappers.rank.scrap", count);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sql.close();
		}
		return list;
	}

	public List getCompanyInfo(List list) {
		
		SqlSession sql = null;
		List list2 = null;
		
		try {
			sql = factory.openSession();
			list2 = sql.selectList("mappers.rank.getInfo", list);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sql.close();
		}
		return list2;
	}
}
