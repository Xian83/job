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
			for (HashMap map : list) {
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

	// score2 : 방사형 그래프용
	public boolean insert2(List<HashMap> score) {
		boolean res = false;

		// 랜덤 데이터 생성
		List<HashMap> list = new ArrayList<>();
		for (HashMap map : score) {
			HashMap data = new HashMap();
			data.put("CMPN_NM", map.get("CMPN_NM"));
			data.put("LABEL01", (int) (Math.random() * 75) + 25);
			data.put("LABEL02", (int) (Math.random() * 75) + 25);
			data.put("LABEL03", (int) (Math.random() * 75) + 25);
			data.put("LABEL04", (int) (Math.random() * 75) + 25);
			data.put("LABEL05", (int) (Math.random() * 75) + 25);
			data.put("LABEL06", (int) (Math.random() * 75) + 25);
			data.put("LABEL07", (int) (Math.random() * 75) + 25);
			data.put("LABEL08", (int) (Math.random() * 75) + 25);
			data.put("LABEL09", (int) (Math.random() * 75) + 25);

			list.add(data);
		}
		System.out.println("랜덤 데이터 생성 : " + list.size() + "개");

		SqlSession sql = null;
		try {
			sql = factory.openSession();

			int cnt = 0;
			for (HashMap map : list) {
				cnt = sql.insert("mappers.company.inputE", map);
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

	// visit : 방문자 성별 분석. 원형 그래프
	public boolean insertVisit(List<HashMap> score) {
		boolean res = false;
		System.out.println(score.size() + "원본 개수");
		// 랜덤 데이터 생성 (email, cmpn_nm, sysdate)
		List<HashMap> list = new ArrayList<>();
		for (HashMap map : score) {
			HashMap data = new HashMap();
			data.put("CMPN_NM", map.get("CMPN_NM"));

			for (int i = 0; i < (int) (Math.random() * 10) + 1; i++) {
				if (Math.random() * 6 < Math.random() * 3)
					data.put("EMAIL", "dummy101@naver.com");
				else
					data.put("EMAIL", "dummy102@naver.com");
				list.add(data);
			}
		}
		System.out.println("랜덤 데이터 생성 : " + list.size() + "개");

		SqlSession sql = null;
		try {
			sql = factory.openSession();

			int cnt = 0;
			for (HashMap map : list) {
				cnt = sql.insert("mappers.company.inputVisit", map);
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

	// visit : 방문자 성별 분석. 원형 그래프
	public boolean insertReview(List<HashMap> score) {
		boolean res = false;
		System.out.println(score.size() + "원본 개수");
		
		String[] arr = new String[]{
				"회사와 함께 성장 가능합니다! 알려지지 않은 대기업 계열사",
				"즐거운 분위기와 자유로움을 느끼고 싶은 사람에게 추천합니다",
				"사회 초년생이 실무진이기 때문에 일부 부족한 부분이 있을 수 있음, 야근을 가끔씩 함",
				"큰 기업들에 비해서 체계가 잘 잡혀있지 않음 많은 월급은 기대할 수 없음 ",
				"사무실 위치를 찾기가 어려움 사무실 근처에 먹을데가 별로 없음 경력이 많은 시니어가 없음",
				"배움이나 코칭을 원하는 사람보단 스스로 일을 해내는 사람에게 추천하는 회사",
				"사원의 절반이 인턴사원",
				"면접분위기가 너무 압박이 심함",
				"사무실 위치는 접근성이 좋았음"
		};
		String[] email = new String[]{
			"djawlths3@hanmail.net",
			"abc@abc.com",
			"hj1116@naver.com",
			"dummy101@naver.com",
			"dummy102@naver.com",
			"jm@jm.com"
		};
	
		
		// 랜덤 데이터 생성 (cmpn_nm, contents, sysdate, email,  rate)
		List<HashMap> list = new ArrayList<>();
		for (HashMap map : score) {
			String scale = (String) map.get("SCALE");
			
			if(scale.equals("대기업")){
				HashMap data = new HashMap();
				data.put("CMPN_NM", map.get("CMPN_NM"));
				data.put("CONTENTS", arr[(int)(Math.random()*arr.length)]);
				data.put("EMAIL", email[(int)(Math.random()*email.length)]);
				data.put("RATE", (int)(Math.random()*5)*20);
				list.add(data);
			}
			
		}
		System.out.println("랜덤 데이터 생성 : " + list.size() + "개");

		SqlSession sql = null;
		try {
			sql = factory.openSession();

			int cnt = 0;
			for (HashMap map : list) {
				cnt = sql.insert("mappers.company.inputReview", map);
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
