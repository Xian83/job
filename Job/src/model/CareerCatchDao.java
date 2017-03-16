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
		int cnt =0;
		for(int i=0; i<image.size(); i++){
			cnt++;
			int t = i*4 ;
			String[] ar;
			ar = new String[2];
			String a = (String) li.get(t+1);
			ar = a.split("\\s");
			if(ar.length==1){
				String m = ar[0];
				ar=new String[]{m, "0점"};
			}
			a = ar[1].replace("점", " ");
			
			String[] br;
			br = new String[2];
			String b = (String) li.get(t+2);
			br = b.split("\\s");
			if(br.length==1){
				String m = br[0];
				br=new String[]{m, "0점"};
			}
			b = br[1].replace("점", "");
			System.out.println(image.get(i));
			System.out.println(li.get(t));
			System.out.println(b);
			System.out.println(a);
			map.put("CMPN_NM", li.get(t));
			map.put("FINANCE_SCORE", a);			
			map.put("SLAVE_SCORE", b);	
			map.put("LOGO", image.get(i));

//			try{
//					sql = factory.openSession();
//					int r = sql.insert("mappers.career.input",map);
//					sql.commit();
//					
//				
//			}catch(Exception e){
//				e.printStackTrace();
//			}finally{
//				sql.close();
//			}
//			
		}
		System.out.println(cnt);
		
		
	}
	
	
}
