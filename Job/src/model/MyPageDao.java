package model;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;

@Service
public class MyPageDao {
	@Autowired
	SqlSessionFactory factory;

	@Autowired
	MongoTemplate template;

	// 더미 데이터 입력
	public boolean insert() {
		// 랜덤 데이터 생성
		String[] email = new String[] { "abc@abc.com", "abcd@abc.com" };
		String[] company = new String[] { "삼성전자", "비덱스포츠", "크레딧잡", "잡코리아", "아이티뱅크" };

		List<Map> list = new ArrayList<>();
		for (int i = 0; i < 100; i++) {
			Map data = new HashMap();
			data.put("email", email[(int) (Math.random() * email.length)]);
			data.put("company", company[(int) (Math.random() * company.length)]);
			list.add(data);
		}

		SqlSession sql = null;
		try {
			sql = factory.openSession();

			int cnt = 0;
			for (Map m : list) {
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
			//System.out.println("visit list =" + list);
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
			//System.out.println("scrap list =" + list);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sql.close();
		}

		return list;
	}

	
	// 스크랩한 기업 삭제
	public boolean deleteScrap(String email, String CMPN_NM) {
		HashMap<String, Object> data = new HashMap<>();
		data.put("email", email);
		data.put("CMPN_NM", CMPN_NM);

		SqlSession sql = null;
		try {
			sql = factory.openSession();
			int cnt = sql.delete("mappers.mypage.deleteScrap", data);

			if (cnt == 1) {
				sql.commit();
				//System.out.println("스크랩 목록 삭제");
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
	
	public List<HashMap> getCompareData(String email) {

		List<HashMap> list = new ArrayList<>();
		SqlSession sql = null;

		try {
			sql = factory.openSession();
			list = sql.selectList("mappers.mypage.getCompareData", email);
			//System.out.println("compare list =" + list);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sql.close();
		}

		return list;
	}

	// public List getRecommand(Map data) {
	// List list = new ArrayList();
	// SqlSession sql = null;
	//
	// try {
	// sql = factory.openSession();
	// list = sql.selectList("mappers.mypage.recommand", data);
	// } catch (Exception e) {
	// e.printStackTrace();
	// } finally {
	// sql.close();
	// }
	// return list;
	// }

	public List getRecommand(Map data) {
		String area = (String) data.get("AREA");
		String industry = (String) data.get("STNDD_BIG_GB");
		int min = Integer.parseInt(String.valueOf(data.get("SALARY_MIN")));
		int max = Integer.parseInt(String.valueOf(data.get("SALARY_MAX")));

		Criteria c = new Criteria().andOperator(
				Criteria.where("WKP_ADRS").regex("^" + area),
				Criteria.where("STNDD_BIG_GB").regex(industry)
//				Criteria.where("SALARY").gte(min).lte(max)		
		);
		Query query = new Query(c);

//		Sort sort = new Sort(Sort.Direction.DESC, "SALARY");
//		query.with(sort);
		query.limit(50);
		
		List<HashMap> list = template.find(query, HashMap.class, "company");
		//System.out.println("mongoDB에서 불러온 데이터 : " + list.size());
		
		return list;
	}
	
	public List<HashMap> getRecommand02(List data) {
		List<HashMap> result = new ArrayList<>();
		
		// 기업명 기준으로 넘기고, 추천 기업 가져오기
		SqlSession session = factory.openSession();
		try {
			result = session.selectList("mappers.company.getScore03", data);
		} catch(Exception e){
			e.printStackTrace();
		} finally {
			session.close();
		}	
		
		//System.out.println("최종 추천 목록 개수 : " + result.size());
		return result;
	}
}
