package model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.aggregation.Aggregation;
import org.springframework.data.mongodb.core.aggregation.AggregationOperation;
import org.springframework.data.mongodb.core.aggregation.AggregationResults;
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
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sql.close();
		}

		return list;
	}

	public List getRecommand(Map data) {
		String area = (String)data.get("AREA");
		String industry = (String)data.get("STNDD_BIG_GB");
		int min = Integer.parseInt(String.valueOf(data.get("SALARY_MIN")));
		int max = Integer.parseInt(String.valueOf(data.get("SALARY_MAX")));
		
		 Criteria c = new Criteria().andOperator(
//			 Criteria.where("WKP_ADRS").regex("/^" + area),
//			 Criteria.where("STNDD_BIG_GB").regex("/" + industry+"/"),
			 Criteria.where("SALARY").gte(min).lte(max)
		 );
		 
		 Query query = new Query(c);
		
		 Sort sort = new Sort(Sort.Direction.DESC, "SALARY");
		 query.with(sort);
		 query.limit(5);
		 System.out.println(query.toString());
		 
		List<HashMap> list = template.find(query, HashMap.class, "company");
		System.out.println(list.size());
		for(HashMap map : list){
			System.out.println(map.toString());
		}
		 
//		AggregationOperation a1 = Aggregation.match(Criteria.where("WKP_ADRS").regex((String) data.get("WKP_ADRS")));
//		AggregationOperation a2 = Aggregation
//				.match(Criteria.where("STNDD_BIG_GB").regex((String) data.get("STNDD_BIG_GB")));
//		AggregationOperation a3 = Aggregation
//				.match(Criteria.where("SALARY").gte(data.get("SALARY_MIN")).lte(data.get("SALARY_MAX")));
//		AggregationOperation a4 = Aggregation.sort(Sort.Direction.DESC, "SALARY");
//		AggregationOperation a5 = Aggregation.limit(5);
//
//		Aggregation aggr = Aggregation.newAggregation(a1, a2, a3, a4, a5);
//		System.out.println(aggr.toString());
//		
//		AggregationResults<Map> results = template.aggregate(aggr, "company", Map.class);
//
//		List<Map> list = results.getMappedResults();
//
//		for (Map map : list) {
//			System.out.println(map.toString());
//		}

		return list;
	}
}
