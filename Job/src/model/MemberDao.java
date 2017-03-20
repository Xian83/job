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

	// 로그인시 email과 pass 매칭 여부 체크
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

	// 해당 email의 정보를 가져오는 것
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

	// 해당 email의 정보를 가져오는 것
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

	// 회원정보수정
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

	// 회원탈퇴
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

	// 회원가입시 email 중복 체크
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

	// 회원가입 : 신규회원 기본정보입력
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

	// 회원가입 : 신규회원 추가정보입력
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
