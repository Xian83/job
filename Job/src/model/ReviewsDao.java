package model;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReviewsDao {

	@Autowired
	SqlSessionFactory factory;

	@Autowired
	MyInfoDao myDao;
	
	public List<HashMap> list() {
		SqlSession session = factory.openSession();
		List<HashMap> list = new ArrayList<>();
		try {
			list = session.selectList("mappers.review.review");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
	
	
	
	public HashMap totalCount() {
		SqlSession session = factory.openSession();
		HashMap map = new HashMap();
		try {
			map = session.selectOne("mappers.review.total");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return map;
	}

	public List<HashMap> review(int start, int end) {
		List<HashMap> list = new ArrayList<>();
		
		HashMap map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		
		SqlSession session = factory.openSession();
		try {
			list = session.selectList("mappers.review.getPage", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	public List<HashMap> rank() {
		SqlSession session = factory.openSession();
		List<HashMap> list = new ArrayList<>();
		try {
			list = session.selectList("mappers.review.rank");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
	
	public int push(String cmpn_nm, String content, String email, int rate) {

		SqlSession session = factory.openSession();
		int a = 0;
		Map map = new HashMap();
		map.put("CMPN_NM", cmpn_nm);
		map.put("CONTENTS", content);
		map.put("EMAIL", email);
		map.put("RATE", rate * 20);
		
		try {
			a = session.insert("mappers.review.push", map);
			System.out.println(a);
		} catch (Exception e) {
			e.printStackTrace();
			return a;
		} finally {
			session.close();
		}
		return a;
	}

	public List<HashMap> List_search(String CName) {
		SqlSession session = factory.openSession();
		List<HashMap> list = new ArrayList<>();
		try {
			list = session.selectList("mappers.review.search", "%" +CName+"%" );
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
	
	public int List_cnt(String CName) {
		SqlSession session = factory.openSession();
		int list_cnt = 0; 
		try {
			list_cnt = session.selectOne("mappers.review.getCount", "%" +CName+"%" );
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list_cnt;
	}
	
	public List<HashMap> searchLogo(String CName) {
		List<HashMap> list = new ArrayList<>();
		
	
		SqlSession session = factory.openSession();
		try {
			list = session.selectList("mappers.review.searchLogo", "%" +CName+"%" );
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
	
//	public List<HashMap> getPicture(List<HashMap> list) {
//		String email = "";
//		String picURL = "";
//
//		for (HashMap obj : list) {
//			email = (String) obj.get("EMAIL");
//			picURL = myDao.getLastetImageURL(email);
//			if (picURL == null || picURL.equals("null"))
//				picURL = "/image/default.jpg";
//			obj.put("pictURL", picURL);
//		}
//
//		return list;
//	}

	//
	// public List<HashedMap> salary() {
	// SqlSession session = factory.openSession();
	// List<HashedMap> list = new ArrayList<>();
	// try{
	// list = session.selectList("mappers.review.r2");
	// return list;
	// }finally{
	// session.close();
	// }
	// }

}
