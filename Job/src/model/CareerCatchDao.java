package model;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class CareerCatchDao {
	
	@Autowired
	SqlSessionFactory factory;
	
	public void addCareer(List image, List li) throws IOException {
		Map<String, Object> map = new HashedMap();
		SqlSession sql = null;	
		System.out.println(image.size());
		System.out.println(li.size());
		for(int i=0; i<=image.size(); i++){
			int t = i*4 ;
			map.put("LOGO", image.get(i));
			map.put("CMPN_NM", li.get(t));
			String[] ar;
			ar = new String[2];
			String a = (String) li.get(t+1);
			ar = a.split("\\s");
			a = ar[1].replace("점", " ");
			System.out.println(a);
			map.put("FINANCE_SCORE", a);			
			String[] br;
			br = new String[2];
			String b = (String) li.get(t+2);
			br = b.split("\\s");
			b = br[1].replace("점", "");
			map.put("SLAVE_SCORE", b);				
		}
		
		//System.out.println(map.toString());
//		try{
//				sql = factory.openSession();
//				int r = sql.insert("mappers.career.input",map);
//				sql.commit();
//				
//			
//		}catch(Exception e){
//			e.printStackTrace();
//		}finally{
//			sql.close();
//		}
	}
	
	
}
