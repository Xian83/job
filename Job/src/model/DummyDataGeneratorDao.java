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
public class DummyDataGeneratorDao {
	@Autowired
	SqlSessionFactory factory;

	public boolean insert(List<String> score) {
		boolean res = false;
		
		// 랜덤 데이터 생성
		List<HashMap> list = new ArrayList<>();
		for (int i = 0, n = score.size(); i < n; i++) {
			HashMap data = new HashMap();
			data.put("PK_NM", "DUMMY");
			data.put("CMPN_NM", score.get(i));
			data.put("AVG_SALARY", (int) (Math.random() * 50000000) + 25000000);
			data.put("ROOKIE_SALARY", (int) (Math.random() * 20000000) + 20000000);
			list.add(data);
		}
		System.out.println("랜덤 데이터 생성 : " + list.size() + "개");
		
		SqlSession sql = null;
		try {
			sql = factory.openSession();

			int cnt = 0;
			for(HashMap map : list){
				cnt = sql.insert("mappers.company.inputD", map);				
				if (cnt == 1) {
					sql.commit();
					res = true;
				}				
			}

		} catch (Exception e) {
			res = false;
			e.printStackTrace();
		} finally {
			System.out.println("랜덤 데이터 입력 완료");
			sql.close();
		}
		return res;
	}
}
