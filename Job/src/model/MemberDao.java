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

	// 濡쒓렇�씤�떆 email怨� pass 留ㅼ묶 �뿬遺� 泥댄겕
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

	// �빐�떦 email�쓽 �젙蹂대�� 媛��졇�삤�뒗 寃�
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

	// �빐�떦 email�쓽 �젙蹂대�� 媛��졇�삤�뒗 寃�
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

	// �쉶�썝媛��엯�떆 email 以묐났 泥댄겕
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
