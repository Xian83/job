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
public class MyInfoDao {

	@Autowired
	SqlSessionFactory factory;
	

	
	// ȸ�� ���� ���� - ���� �ҷ����� 1
	public List getlocations(){
		List data = new ArrayList();
		
		SqlSession sql = null;
		try {
			System.out.println("getlocations �غ�");
			sql = factory.openSession();
			data = sql.selectList("mappers.my.location");			
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			sql.close();
		}
		
		return data;
	}
	
	// ȸ�� ���� ���� - ���� �ҷ����� 2
	public List getIndustries(){
		List data = new ArrayList();
		
		SqlSession sql = null;
		try {
			System.out.println("getIndustries �غ�");
			sql = factory.openSession();
			data = sql.selectList("mappers.my.industry");
			System.out.println("DAO industry =" + data);
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			sql.close();
		}
		
		return data;
	}
	
	// ȸ�� ���� ���� - ���� �ҷ����� 3
		public Map getdata(String email){
			Map data = new HashMap<>();
			
			SqlSession sql = null;
			try {
				System.out.println("getIndustries �غ�");
				sql = factory.openSession();
				data = sql.selectOne("mappers.my.data", email);
			} catch (Exception e) {
				e.printStackTrace();
			} finally{
				sql.close();
			}
			
			return data;
		}


	
	// ���� ���� ������Ʈ
		public boolean update (String email){
			boolean r;
			
			SqlSession sql = null;
			try {
				sql = factory.openSession();
				int cnt = sql.selectOne("mappers.my.industry", email);
				System.out.println("update cnt =" + cnt);
				if(cnt==1)
					return true;
				else
					return false;
				
			}catch(Exception e){
				e.printStackTrace();
				return false;
			}
		}
	
/*	// ȸ�� ���� ����2(���� �����ؼ� ����)
			public int update(String name, int age, String gender, String email,String id) {
				int rs =0;
				try {
					
					String sql = 
							String.format("update member set name='%s', age=%d, gender='%s', email='%s' where id='%s'", 
									name,age,gender,email,id);
					//PreparedStatement ps = conn.prepareStatement(sql);
					//rs = ps.executeUpdate();	
	
				}catch(Exception e) {
					e.printStackTrace();
				}
				return rs;
				} */

	
	
}
