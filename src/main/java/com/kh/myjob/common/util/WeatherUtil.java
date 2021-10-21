package com.kh.myjob.common.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.kh.myjob.common.vo.WeatherLongSkyStatusVO;
import com.kh.myjob.common.vo.WeatherLongTempVO;
import com.kh.myjob.common.vo.WeatherShortVO;

public class WeatherUtil {

	

   
	
	
	//tag값의 정보를 가져오는 메소드
		private static String getTagValue(String tag, Element eElement) {
		    NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();

		    Node nValue = (Node) nlList.item(0);
		    if(nValue == null) {
		        return null;
		    }
		    return nValue.getNodeValue();
		}

	//중기예보 기상 상태(맑음,흐림...)메소드
		
		public static List<WeatherLongSkyStatusVO> weatherLongSkyStatus(String time) {
			 List<WeatherLongSkyStatusVO> weatherList = new ArrayList<>();
			
			
			try {
				
				 StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1360000/MidFcstInfoService/getMidLandFcst"); /*URL*/
			        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=zsiVIlbNLa0CmGU%2B1vLHgsJLlm6mK5D4yDti4V6WoxJoG%2BBTONY2L9D6KxlCxvOlyZrywmoppXYhj2%2FJW%2FYEDA%3D%3D"); /*Service Key*/
			        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
			        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
			        urlBuilder.append("&" + URLEncoder.encode("dataType","UTF-8") + "=" + URLEncoder.encode("XML", "UTF-8")); /*요청자료형식(XML/JSON)Default: XML*/
			        urlBuilder.append("&" + URLEncoder.encode("regId","UTF-8") + "=" + URLEncoder.encode("11B00000", "UTF-8")); /*11B10101 서울, 11B20201 인천 등 (별첨 파일 참조)*/
			        urlBuilder.append("&" + URLEncoder.encode("tmFc","UTF-8") + "=" + URLEncoder.encode(time, "UTF-8")); /*-일 2회(06:00,18:00)회 생성 되며 발표시각을 입력- YYYYMMDD0600(1800) 최근 24시간 자료만 제공*/
			        URL url = new URL(urlBuilder.toString());
			        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			        conn.setRequestMethod("GET");
			        conn.setRequestProperty("Content-type", "application/json");
			        System.out.println("Response code: " + conn.getResponseCode());
			        BufferedReader rd;
			        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			        } else {
			            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
			        }
			        StringBuilder sb = new StringBuilder();
			        String line;
			        while ((line = rd.readLine()) != null) {
			            sb.append(line);
			        }
			        rd.close();
			        conn.disconnect();
			        System.out.println(sb.toString());
			        
			        DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
			        DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
			        Document document = dBuilder.parse(urlBuilder.toString());

			        // root tag 
			        document.getDocumentElement().normalize();
			        
			        System.out.println("Root element: " + document.getDocumentElement().getNodeName()); // Root element: result
			        
			        //루트 엘리먼트 구하기
			        Element root = document.getDocumentElement();
			       
			        //root엘리먼트에서 item태그인 엘리먼트만 추출하기
			        NodeList itemTagList = root.getElementsByTagName("item");
			       
			        System.out.println("item태그의 갯수 : "+itemTagList.getLength());
			      
			        	for(int i=0;i<itemTagList.getLength();i++) {
			        		  Node nNode = itemTagList.item(i);
			  		        Element eElement = (Element) nNode;
			  		        

			        	int skyStatusData =8;
			        	int skyStatusCnt=3;
			        	for(int a=0; a<skyStatusData;a++) {
			        		
			        		
			        		 WeatherLongSkyStatusVO weatherLongSkyStatusVO = new WeatherLongSkyStatusVO();
			        		if(skyStatusCnt<8) {
			        		 weatherLongSkyStatusVO.setSkyStatusAm(getTagValue("wf"+skyStatusCnt+"Am",eElement));
			        		
			        		 System.out.println("flag1");
			        		 System.out.println("wf"+skyStatusCnt+"Am");
			        		 System.out.println(getTagValue("wf"+skyStatusCnt+"Am",eElement));
			        		 
			        		 
			        		 System.out.println("flag2");
			        		 System.out.println("wf3Am");
			        		 System.out.println(getTagValue("wf3Am",eElement));
			        		 
			        		 
			        		 weatherLongSkyStatusVO.setSkyStatusPm(getTagValue("wf"+skyStatusCnt+"Pm",eElement));
			        		 weatherList.add(weatherLongSkyStatusVO);
			        		 skyStatusCnt=skyStatusCnt+1;
			        		}
			        		else {//8일부터의 데이터
			        			weatherLongSkyStatusVO.setSkyStatusAm(getTagValue("wf"+skyStatusCnt,eElement));
				        		weatherLongSkyStatusVO.setSkyStatusPm(getTagValue("wf"+skyStatusCnt,eElement));
				        		weatherList.add(weatherLongSkyStatusVO);
				        		skyStatusCnt=skyStatusCnt+1;
			        		}
			        	}
			      

			        
			        	 
			        	 
		        		 

			        	 
			        	 
			        	 
			        	}//for => i 
			        
			        
			        
			       
			        
			        
			        
			        
			   
			      
			      
			        
			        
			        
			}catch(Exception e) {
				e.printStackTrace();
				
			}
			
			
			return weatherList;
			
			
			
			
		}
		
		
		
		
		
	//중기예보기온 메소드
		public static List<WeatherLongTempVO> weatherLong(String time) {
			 List<WeatherLongTempVO> weatherList = new ArrayList<>();
			
			
			try {
				
				 StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1360000/MidFcstInfoService/getMidTa"); /*URL*/
			        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=zsiVIlbNLa0CmGU%2B1vLHgsJLlm6mK5D4yDti4V6WoxJoG%2BBTONY2L9D6KxlCxvOlyZrywmoppXYhj2%2FJW%2FYEDA%3D%3D"); /*Service Key*/
			        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
			        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
			        urlBuilder.append("&" + URLEncoder.encode("dataType","UTF-8") + "=" + URLEncoder.encode("XML", "UTF-8")); /*요청자료형식(XML/JSON)Default: XML*/
			        urlBuilder.append("&" + URLEncoder.encode("regId","UTF-8") + "=" + URLEncoder.encode("11B20201", "UTF-8")); /*11B10101 서울, 11B20201 인천 등 (별첨 파일 참조)*/
			        urlBuilder.append("&" + URLEncoder.encode("tmFc","UTF-8") + "=" + URLEncoder.encode(time, "UTF-8")); /*-일 2회(06:00,18:00)회 생성 되며 발표시각을 입력- YYYYMMDD0600(1800) 최근 24시간 자료만 제공*/
			        URL url = new URL(urlBuilder.toString());
			        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			        conn.setRequestMethod("GET");
			        conn.setRequestProperty("Content-type", "application/json");
			        System.out.println("Response code: " + conn.getResponseCode());
			        BufferedReader rd;
			        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			        } else {
			            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
			        }
			        StringBuilder sb = new StringBuilder();
			        String line;
			        while ((line = rd.readLine()) != null) {
			            sb.append(line);
			        }
			        rd.close();
			        conn.disconnect();
			        System.out.println(sb.toString());
			        
			        DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
			        DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
			        Document document = dBuilder.parse(urlBuilder.toString());

			        // root tag 
			        document.getDocumentElement().normalize();
			        
			        System.out.println("Root element: " + document.getDocumentElement().getNodeName()); // Root element: result
			        
			        //루트 엘리먼트 구하기
			        Element root = document.getDocumentElement();
			       
			        //root엘리먼트에서 item태그인 엘리먼트만 추출하기
			        NodeList itemTagList = root.getElementsByTagName("item");
			       
			        System.out.println("item태그의 갯수 : "+itemTagList.getLength());
			      
			        	for(int i=0;i<itemTagList.getLength();i++) {
			        		  Node nNode = itemTagList.item(i);
			  		        Element eElement = (Element) nNode;
			  		        
			        	
			        		int tempData =8;
			        		int tempCnt=3;
				        	for(int a=0; a<tempData;a++) {
				        		
				        		
				        		 WeatherLongTempVO weatherLongTempVO = new WeatherLongTempVO();
				        	
				        		 weatherLongTempVO.setMinTemp(getTagValue("taMin"+tempCnt,eElement));
				        		 weatherLongTempVO.setMaxTemp(getTagValue("taMax"+tempCnt,eElement));
				        		
				        		 weatherList.add(weatherLongTempVO);
				      
				        		 
				        		
				        		tempCnt=tempCnt+1;
				        		
				        	
				        	}
			        	 

			        	 
			        	 
			        	 
			        	}
			        
			        
			        
			       
			        
			        
			        
			        
			   
			      
			      
			        
			        
			        
			}catch(Exception e) {
				e.printStackTrace();
				
			}
			
			
			return weatherList;
			
			
			
			
		}
	//단기예보 메소드
	public static List<WeatherShortVO> weatherShort(String time) {
	 List<WeatherShortVO> weatherList = new ArrayList<>();
	try {
		
		 StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1360000/VilageFcstMsgService/getLandFcst"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=zsiVIlbNLa0CmGU%2B1vLHgsJLlm6mK5D4yDti4V6WoxJoG%2BBTONY2L9D6KxlCxvOlyZrywmoppXYhj2%2FJW%2FYEDA%3D%3D"); /*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
	        urlBuilder.append("&" + URLEncoder.encode("dataType","UTF-8") + "=" + URLEncoder.encode("XML", "UTF-8")); /*요청자료형식(XML/JSON)Default: XML*/
	        urlBuilder.append("&" + URLEncoder.encode("regId","UTF-8") + "=" + URLEncoder.encode("11B10101", "UTF-8")); /*11B10101 서울, 11B20201 인천 등 (별첨 파일 참조)*/
	        urlBuilder.append("&" + URLEncoder.encode("tmFc","UTF-8") + "=" + URLEncoder.encode(time, "UTF-8")); /*-일 2회(06:00,18:00)회 생성 되며 발표시각을 입력- YYYYMMDD0600(1800) 최근 24시간 자료만 제공*/
	        URL url = new URL(urlBuilder.toString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
	        System.out.println("Response code: " + conn.getResponseCode());
	        BufferedReader rd;
	        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        } else {
	            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	        }
	        StringBuilder sb = new StringBuilder();
	        String line;
	        while ((line = rd.readLine()) != null) {
	            sb.append(line);
	        }
	        rd.close();
	        conn.disconnect();
	        System.out.println(sb.toString());
	        
	        DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
	        DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
	        Document document = dBuilder.parse(urlBuilder.toString());

	        // root tag 
	        document.getDocumentElement().normalize();
	        
	        System.out.println("Root element: " + document.getDocumentElement().getNodeName()); // Root element: result
	        
	        //루트 엘리먼트 구하기
	        Element root = document.getDocumentElement();
	       
	        //root엘리먼트에서 item태그인 엘리먼트만 추출하기
	        NodeList itemTagList = root.getElementsByTagName("item");
	       
	        System.out.println("item태그의 갯수 : "+itemTagList.getLength());
	      
	        	for(int i=0;i<itemTagList.getLength();i++) {
	        		  Node nNode = itemTagList.item(i);
	  		        Element eElement = (Element) nNode;
	  		        
	        	 WeatherShortVO weatherShortVO = new WeatherShortVO();

	        	
	        	 weatherShortVO.setTime(getTagValue("numEf",eElement));
	        	 weatherShortVO.setSkyStatus(getTagValue("wf",eElement));
	        	 weatherShortVO.setTemp(getTagValue("ta",eElement));
	        	 
	        	 weatherList.add(weatherShortVO);
	        	 
	        	
	        	 
	        	}
	        
	        
	}catch(Exception e) {
		e.printStackTrace();
		
	}
	 return weatherList;	

	}
		
	
	
	
	
}
