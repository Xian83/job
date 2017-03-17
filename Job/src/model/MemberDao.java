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
	
	//id �ߺ� üũ
	public boolean existCheck(String id){
		SqlSession sql = null;
		try {
			sql = factory.openSession();
			int n = sql.selectOne("mappers.member.idCheck", id);
			
			if(n == 1)
				return true;
			else
				return false;
			
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally{
			sql.close();
		}
	}	
	
	// id �� pass ��ġ�ϴ��� Ȯ���ϴ� �۾�
	public boolean existCheck(Map data){
		
		SqlSession sql = null;
		try {
			sql = factory.openSession();
			Integer cnt = sql.selectOne("mappers.member.existCheck", data);
			
			if(cnt == 1)
				return true;
			else
				return false;			
			
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally{
			sql.close();
		}
	}

	//id�� �ش��ϴ� �ΰ��������� �����ϴ� �޼ҵ�
	//����Ÿ���� Map���� �����ϰų�, Member ��ü�� ���� return
	public HashMap<String,Object> getData(String id){
		HashMap<String, Object> data = new HashMap<>();
		
		SqlSession sql = null;
		try {
			sql = factory.openSession();
			data = sql.selectOne("mappers.member.getById", id);			
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			sql.close();
		}
		
		return data;
	}
	
	public boolean update(Map data){
		
		SqlSession sql = null;
		try {
			sql = factory.openSession();
			int cnt = sql.update("mappers.member.update", data);
			
			if(cnt == 1){
				sql.commit();				
				return true;
			} else
				return false;			
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally{
			sql.close();
		}
	}
	
	public boolean delete(String id, String pass){
		HashMap<String, Object> data = new HashMap<>();
		data.put("id", id);
		data.put("pass", pass);
		
		SqlSession sql = null;
		try {
			sql = factory.openSession();
			int cnt = sql.delete("mappers.member.delete", data);
			
			if(cnt == 1){
				sql.commit();
				return true;
			} else
				return false;			
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally{
			sql.close();
		}
	}
	
	public boolean insert(Map data){
		
		SqlSession sql = null;
		try {
			sql = factory.openSession();
			int cnt = sql.insert("mappers.member.add", data);
			
			if(cnt == 1){
				sql.commit();				
				return true;
			} else
				return false;			
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally{
			sql.close();
		}
	}
	
}
