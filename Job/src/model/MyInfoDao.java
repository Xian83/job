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
//			System.out.println("insertPic �غ�");
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

	// ȸ�� ���� ���� - ���� �ҷ����� 1
	public List getlocations() {
		List data = new ArrayList();

		SqlSession sql = null;
		try {
			System.out.println("getlocations �غ�");
			sql = factory.openSession();
			data = sql.selectList("mappers.my.location");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sql.close();
		}

		return data;
	}

	// ȸ�� ���� ���� - ���� �ҷ����� 2
	public List getIndustries() {
		List data = new ArrayList();

		SqlSession sql = null;
		try {
			System.out.println("getIndustries �غ�");
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

	// ȸ�� ���� ���� - ���� �ҷ����� 3
	public Map getdata(String email) {
		Map data = new HashMap<>();

		SqlSession sql = null;
		try {
			System.out.println("getIndustries �غ�");
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

	// ���� ���� ������Ʈ
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

	// �������� ����� ���� �ҷ����� 
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
/*
 * // ȸ�� ���� ����2(���� �����ؼ� ����) public int update(String name, int age,
 * String gender, String email,String id) { int rs =0; try {
 * 
 * String sql = String.
 * format("update member set name='%s', age=%d, gender='%s', email='%s' where id='%s'"
 * , name,age,gender,email,id); //PreparedStatement ps =
 * conn.prepareStatement(sql); //rs = ps.executeUpdate();
 * 
 * }catch(Exception e) { e.printStackTrace(); } return rs; }
 */