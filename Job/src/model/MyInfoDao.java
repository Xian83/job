package model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MyInfoDao {

	@Autowired
	SqlSessionFactory factory;
	

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
				}

		// ȸ�� ���� ����1(���� �ҷ�����)
		// id�� �ش��ϴ� �ΰ��������� �����ϴ� �۾�.. 
		// ����Ÿ���� Map���� �����ϰų� Ȥ��.. ��ü ����.
			// Map���� ó���Ҷ��� <String, Object> �÷����� Ű��.. 
		public HashMap<String, Object> getDetails(String id) {
			HashMap<String, Object> map = null;
			try {
				
				String sql = 
						String.format("select * from member where id='%s'", id);
					//PreparedStatement ps = conn.prepareStatement(sql);
					ResultSet rs = ps.executeQuery();
					if(rs.next()) {
						map = new HashMap<>();
						map.put("id", rs.getString("id"));
						map.put("pass", rs.getString("pass"));
						map.put("name", rs.getString("name"));
						map.put("age", rs.getInt("age"));
						map.put("gender", rs.getString("gender"));
						map.put("email", rs.getString("email"));
						map.put("join_date", rs.getDate("join_date"));
					}
				conn.close();
			}catch(Exception e){
				e.printStackTrace();
				
			}
			return map;
		}*/
	
}
