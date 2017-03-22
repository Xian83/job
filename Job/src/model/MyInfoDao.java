package model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MyInfoDao {

	@Autowired
	SqlSessionFactory factory;

//	public boolean insertPic(Map map) {
//		int p = 0;
//		SqlSession sql = null;
//		try {
//			System.out.println("insertPic 占쌔븝옙");
//			sql = factory.openSession();
//			p = sql.insert("mappers.member.addPic", map);
//
//			if (p == 1) {
//				sql.commit();
//				return true;
//			} else
//				return false;
//		} catch (Exception e) {
//			e.printStackTrace();
//			return false;
//		} finally {
//			sql.close();
//		}
//	}

	// 회占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙 - 占쏙옙占쏙옙 占쌀뤄옙占쏙옙占쏙옙 1
	public List getlocations() {
		List data = new ArrayList();

		SqlSession sql = null;
		try {
			System.out.println("getlocations 占쌔븝옙");
			sql = factory.openSession();
			data = sql.selectList("mappers.my.location");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sql.close();
		}

		return data;
	}

	// 회占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙 - 占쏙옙占쏙옙 占쌀뤄옙占쏙옙占쏙옙 2
	public List getIndustries() {
		List data = new ArrayList();

		SqlSession sql = null;
		try {
			System.out.println("getIndustries 占쌔븝옙");
			sql = factory.openSession();
			data = sql.selectList("mappers.my.industry");
			System.out.println("DAO industry =" + data);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sql.close();
		}

		return data;
	}

	// 회占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙 - 占쏙옙占쏙옙 占쌀뤄옙占쏙옙占쏙옙 3
	public Map getdata(String email) {
		Map data = new HashMap<>();

		SqlSession sql = null;
		try {
			System.out.println("getIndustries 占쌔븝옙");
			sql = factory.openSession();
			data = sql.selectOne("mappers.my.data", email);
			System.out.println(data);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sql.close();
		}

		return data;
	}

	// 占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙트
	public int update(Map data) {
		int r = 0;

		SqlSession sql = null;
		try {
			sql = factory.openSession();
			r = sql.update("mappers.my.update", data);
			System.out.println("update r =" + r);
			if (r == 1)
				sql.commit();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sql.close();
		}
		return r;
	}

	// 占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占� 占쏙옙占쏙옙 占쌀뤄옙占쏙옙占쏙옙 
	public String getLastetImageURL(String email){
		List<HashMap> data = new ArrayList<>();
		SqlSession sql = null;
		
		try {
			sql = factory.openSession();
			data = sql.selectList("mappers.my.picUrl", email);	
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			sql.close();
		}
		
		HashMap<String, Object> map = new HashMap<>();
		Iterator it = data.iterator();
		for(int i = 0; i<1; i++){
			map = (HashMap<String, Object>) it.next();
		}
		
		return data == null ? "null" : (String) map.get("URL");  		
	}



	public int updatePass(Map m) {
		int r = 0;

		SqlSession sql = null;
		try {
			sql = factory.openSession();
			r = sql.update("mappers.my.updatePass", m);
			System.out.println("update r =" + r);
			if (r == 1)
				sql.commit();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sql.close();
		}
		return r;
	}


	public int updateBirth(Map b) {
		int r = 0;
		SqlSession sql = null;
		try {
			sql = factory.openSession();
			r = sql.update("mappers.my.updateBirth", b);
			System.out.println("update b =" + r);
			if (r == 1)
				sql.commit();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sql.close();
		}
		return r;
	}
}
