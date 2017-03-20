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
			System.out.println("getlocations 준비");
			sql = factory.openSession();
			data = sql.selectList("mappers.my.location");			
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			sql.close();
		}
		
		return data;
	}
	
	
	
/*	// 회원 정보 수정2(정보 수정해서 저장)
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

		// 회원 정보 수정1(정보 불러오기)
		// id에 해당하는 부가정보들을 리턴하는 작업.. 
		// 리턴타입을 Map으로 설정하거나 혹은.. 객체 설계.
			// Map으로 처리할때는 <String, Object> 컬럼명을 키로.. 
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
