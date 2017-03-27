package model;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class GoogleMap {
	
	public Map map(String address){
		Map json = new HashMap();
		
		// address blank 처리
		String[] arr = address.split("\\s+");
		address = "";
		for(String str : arr){
			address += str + "+";
		}
		address = address.substring(0, address.length()-1);
		
		String target = "https://maps.googleapis.com/maps/api/geocode/json?address=" + address;
		target += "&key=AIzaSyAdpNCYLer2YLqWD5YoIBaBqmD8SJm8b9k&language=ko";

		try {
			URL url = new URL(target);
			BufferedReader br = new BufferedReader(new InputStreamReader(url.openStream()));
			String outstr = "";
			while (true) {
				String str = br.readLine();
				if (str == null)
					break;
				outstr += str;
			}
			
			br.close();
			
			ObjectMapper mapper = new ObjectMapper();
			json = mapper.readValue(outstr, Map.class);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return json;
	}
}
