package model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RankDao {

	
	@Autowired
	SqlSessionFactory factory;
	
	
	// �뵒�뤃�듃 �룊洹좎뿰遊� �궡由쇱감�닚
	public List avgsalary() {
		SqlSession sql = null;
		List list = new ArrayList();
		try {
			sql = factory.openSession();
			list = sql.selectList("mappers.rank.avgsalary");
			//System.out.println(list);
		} catch (Exception e) {
			e.printStackTrace();			
		} finally{
			sql.close();
		}	
		return list;
	}
	
	
	
	// �떊�엯�뿰遊�
	public List rookeysalary() {
		SqlSession sql = null;
		List list = new ArrayList();
		try {
			sql = factory.openSession();
			list = sql.selectList("mappers.rank.rookeysalary");
			
		} catch (Exception e) {
			e.printStackTrace();			
		} finally{
			sql.close();
		}	
		return list;
	}
	
	// �룊洹좎뿰遊� 濡쒓퀬源뚯�
	public List search(List<Map> list) {
		SqlSession sql = null;
		List list2 = new ArrayList();
		try {
			sql = factory.openSession();
			
			for(int i=0; i<list.size(); i++) {
				String s =  (String)list.get(i).get("CMPN_NM");
				Map map = sql.selectOne("mappers.rank.search", s);
				list2.add(map);
			}
			//System.out.println(list2.toString());
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			sql.close();
		}
		return list2;
	}
	
	
}
