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
public class MyPageDao {
	@Autowired
	SqlSessionFactory factory;

	// 더미 데이터 입력
	public boolean insert() {
		// 랜덤 데이터 생성
		String[] email = new String[] { "abc@abc.com", "abcd@abc.com" };
		String[] company = new String[] { "삼성전자", "비덱스포츠", "크레딧잡", "잡코리아", "아이티뱅크" };
		
		List<Map> list = new ArrayList<>();
		for(int i = 0; i < 100 ; i++ ){
			Map data = new HashMap();
			data.put("email", email[(int) (Math.random() * email.length)]);
			data.put("company", company[(int) (Math.random() * company.length)]);
			list.add(data);
		}

		SqlSession sql = null;
		try {
			sql = factory.openSession();
			
			int cnt = 0;
			for(Map m : list){
				cnt = sql.insert("mappers.mypage.addDummy", m);			
			}

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
	
	public List<HashMap> getVisitData(String email) {
		List<HashMap> list = new ArrayList<>();
		SqlSession sql = null;

		try {
			sql = factory.openSession();
			list = sql.selectList("mappers.mypage.getVisited", email);
			System.out.println("visit list =" + list );
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sql.close();
		}
		return list;
	}
	
	public List<HashMap> getScrapData(String email) {
		
		List<HashMap> list = new ArrayList<>();
		SqlSession sql = null;

		try {
			sql = factory.openSession();
			list = sql.selectList("mappers.mypage.getScarpData", email);
			System.out.println("scrap list =" + list );
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sql.close();
		}
		
		return list;
	}
	
	public List<HashMap> getCompareData(String email) {
		
		List<HashMap> list = new ArrayList<>();
		SqlSession sql = null;

		try {
			sql = factory.openSession();
			list = sql.selectList("mappers.mypage.getCompareData", email);
			System.out.println("compare list =" + list );
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sql.close();
		}
		
		return list;
	}
	
	public List getRecommand(Map data) {
		List list = new ArrayList();
		SqlSession sql = null;

		try {
			sql = factory.openSession();
			list = sql.selectList("mappers.mypage.recommand", data);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sql.close();
		}
		return list;
	}
}
