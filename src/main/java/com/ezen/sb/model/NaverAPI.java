package com.ezen.sb.model;
import java.net.*;
import java.io.*;

	public class NaverAPI {

	 public static String search(String apiURL) {
		 
	 
	        String clientId = "9yU38FYd3UvYhDFlNgrP";
	        String clientSecret = "RS3g7eDXG9";
	        try {
	            
	            //String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text; // 
	            URL url = new URL(apiURL);
	            HttpURLConnection con = (HttpURLConnection)url.openConnection();
	            con.setRequestMethod("GET");
	            con.setRequestProperty("X-Naver-Client-Id", clientId);
	            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
	            int responseCode = con.getResponseCode();
	            BufferedReader br;
	            if(responseCode==200) { 
	                br = new BufferedReader(new InputStreamReader(con.getInputStream(),"UTF-8"));
	            } else {  
	                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	            }
	            String inputLine;
	            StringBuffer response = new StringBuffer();
	            while ((inputLine = br.readLine()) != null) {
	                response.append(inputLine);
	            }
	            br.close();
	            System.out.println(response.toString());
	            return response.toString();
	        } catch (Exception e) {
	            System.out.println(e);
	            return e.toString();
	        }
}
}