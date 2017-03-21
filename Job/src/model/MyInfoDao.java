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
	
	public boolean insertPic(Map map) {
		int p = 0;
		SqlSession sql = null;
		try {
			System.out.println("insertPic 준비");
			sql = factory.openSession();
			p = sql.insert("mappers.member.addPic", map);

			if (p == 1) {
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
	
	
	
	// 회원 정보 수정 - 정보 불러오기 1
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
	
	// 회원 정보 수정 - 정보 불러오기 2
	public List getIndustries(){
		List data = new ArrayList();
		
		SqlSession sql = null;
		try {
			System.out.println("getIndustries 준비");
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
	
	// 회원 정보 수정 - 정보 불러오기 3
		public Map getdata(String email){
			Map data = new HashMap<>();
			
			SqlSession sql = null;
			try {
				System.out.println("getIndustries 준비");
				sql = factory.openSession();
				data = sql.selectOne("mappers.my.data", email);
			} catch (Exception e) {
				e.printStackTrace();
			} finally{
				sql.close();
			}
			
			return data;
		}


	
	// 관심 정보 업데이트
		public int update(Map data){
			int r =0;
			
			SqlSession sql = null;
			try {
				sql = factory.openSession();
				r = sql.update("mappers.my.update", data);
				System.out.println("update r =" + r);
				if(r==1)
					sql.commit();
				
			}catch(Exception e){
				e.printStackTrace();
			} finally{
				sql.close();
			}
			return r;
		}
		
		
	/*public String getLastetImageURL(String email) {
	String picURL =  null;
	SqlSession sql = null;
	try {
		System.out.println("getIndustries 준비");
		sql = factory.openSession();
		picURL = sql.selectOne("mappers.my.picUrl", email);
	} catch (Exception e) {
		e.printStackTrace();
	} finally{
		sql.close();
	}
	
	return picURL;
}*/

}

	

	

