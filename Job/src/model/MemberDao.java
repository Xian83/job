package model;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberDao {
	@Autowired
	SqlSessionFactory factory;

	// email & pass check
	public boolean existCheck(Map data) {

		SqlSession sql = null;
		try {
			sql = factory.openSession();
			Integer cnt = sql.selectOne("mappers.member.existCheck", data);

			if (cnt == 1)
				return true;
			else
				return false;

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			sql.close();
		}
	}

	// get member basic info data
	public HashMap<String, Object> getData(String email) {
		HashMap<String, Object> data = new HashMap<>();

		SqlSession sql = null;
		try {
			sql = factory.openSession();
			data = sql.selectOne("mappers.member.getById", email);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sql.close();
		}

		return data;
	}

	// get member additional info data
	public HashMap<String, Object> getInfo(String email) {
		HashMap<String, Object> data = new HashMap<>();

		SqlSession sql = null;
		try {
			sql = factory.openSession();
			data = sql.selectOne("mappers.member.getInfo", email);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sql.close();
		}

		return data;
	}
	


	// �쉶�썝�젙蹂댁닔�젙
	// public boolean update(Map data){
	//
	// SqlSession sql = null;
	// try {
	// sql = factory.openSession();
	// int cnt = sql.update("mappers.member.update", data);
	//
	// if(cnt == 1){
	// sql.commit();
	// return true;
	// } else
	// return false;
	// } catch (Exception e) {
	// e.printStackTrace();
	// return false;
	// } finally{
	// sql.close();
	// }
	// }

	// �쉶�썝�깉�눜
	public boolean delete(String id, String pass) {
		HashMap<String, Object> data = new HashMap<>();
		data.put("id", id);
		data.put("pass", pass);

		SqlSession sql = null;
		try {
			sql = factory.openSession();
			int cnt = sql.delete("mappers.member.delete", data);

			if (cnt == 1) {
				sql.commit();
				System.out.println("탈퇴 했을 거임");
				return true;
			} else
				return false;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			sql.close();
		}
	}

	// check exist by email
	public boolean existCheck(String email) {
		SqlSession sql = null;
		try {
			sql = factory.openSession();
			int n = sql.selectOne("mappers.member.emailCheck", email);

			if (n == 1)
				return true;
			else
				return false;

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			sql.close();
		}
	}

	// �쉶�썝媛��엯 : �떊洹쒗쉶�썝 湲곕낯�젙蹂댁엯�젰
	public boolean insert(Map data) {
		SqlSession sql = null;
		try {
			sql = factory.openSession();
			int cnt = sql.insert("mappers.member.add", data);

			if (cnt == 1) {
				sql.commit();
				return true;
			} else
				return false;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			sql.close();
		}
	}

	// �쉶�썝媛��엯 : �떊洹쒗쉶�썝 異붽��젙蹂댁엯�젰
	public boolean insertInfo(Map data) {
		SqlSession sql = null;
		try {
			sql = factory.openSession();
			int cnt = sql.insert("mappers.member.addInfo", data);

			if (cnt == 1) {
				sql.commit();
				return true;
			} else
				return false;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			sql.close();
		}
	}
}
