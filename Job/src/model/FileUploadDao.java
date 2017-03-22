package model;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class FileUploadDao {
	@Autowired
	SqlSessionFactory factory;
	
	@Autowired
	ServletContext application;

	public Map execute(MultipartFile file) throws Exception {
		long size = file.getSize();
		String orgName = file.getOriginalFilename();
		String saveName = System.currentTimeMillis() + "_" + orgName;
		String path = application.getRealPath("/share");
		File dir = new File(path);
		if (!dir.exists())
			dir.mkdirs();

		// 업로드 처리
		File dest = new File(path, saveName);
		file.transferTo(dest);

		// 파일 정보 저장
		Map result = new HashMap<>();
		result.put("filesize", size); // 파일 크기
		result.put("filename", orgName); // 원본 이름
		result.put("fileaddress", dest.getPath()); // 실제 directory
		result.put("filelink", "/share/" + saveName); // 웹상의 주소
		return result;
	}
	
	public boolean insert(String email , String url){
		System.out.println(email);
		
		HashMap<String, String> data = new HashMap<>();
		data.put("email", email);
		data.put("url", url);
		
		SqlSession sql = null;
		try {
			sql = factory.openSession();
			int cnt = sql.insert("mappers.my.addPic", data);
			
			if(cnt == 1){
				sql.commit();				
				return true;
			} else
				return false;			
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally{
			sql.close();
		}
	}
}