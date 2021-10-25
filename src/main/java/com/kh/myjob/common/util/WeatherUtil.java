package com.kh.myjob.common.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.kh.myjob.common.vo.TotalWeatherVO;

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
		public static List<TotalWeatherVO> weatherList(String time, String locationLandCode, String locationTempCode) {
			List<TotalWeatherVO> weatherList = new ArrayList<>();
			
			try {
				
				 StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1360000/MidFcstInfoService/getMidLandFcst"); /*URL*/
			     urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=zsiVIlbNLa0CmGU%2B1vLHgsJLlm6mK5D4yDti4V6WoxJoG%2BBTONY2L9D6KxlCxvOlyZrywmoppXYhj2%2FJW%2FYEDA%3D%3D"); /*Service Key*/
			     urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
			     urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
			     urlBuilder.append("&" + URLEncoder.encode("dataType","UTF-8") + "=" + URLEncoder.encode("XML", "UTF-8")); /*요청자료형식(XML/JSON)Default: XML*/
			     urlBuilder.append("&" + URLEncoder.encode("regId","UTF-8") + "=" + URLEncoder.encode(locationLandCode, "UTF-8")); /*11B10101 서울, 11B20201 인천 등 (별첨 파일 참조)*/
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
			     
			     DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
			     DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
			     Document document = dBuilder.parse(urlBuilder.toString());

			     // root tag 
			     document.getDocumentElement().normalize();
			     
			     //루트 엘리먼트 구하기
			     Element root = document.getDocumentElement();
			     
			     //root엘리먼트에서 item태그인 엘리먼트만 추출하기
			     NodeList itemTagList = root.getElementsByTagName("item");
			     
			   //중기기온 받아오기
			     StringBuilder urlBuilder1 = new StringBuilder("http://apis.data.go.kr/1360000/MidFcstInfoService/getMidTa"); /*URL*/
				    urlBuilder1.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=zsiVIlbNLa0CmGU%2B1vLHgsJLlm6mK5D4yDti4V6WoxJoG%2BBTONY2L9D6KxlCxvOlyZrywmoppXYhj2%2FJW%2FYEDA%3D%3D"); /*Service Key*/
				    urlBuilder1.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
				    urlBuilder1.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
				    urlBuilder1.append("&" + URLEncoder.encode("dataType","UTF-8") + "=" + URLEncoder.encode("XML", "UTF-8")); /*요청자료형식(XML/JSON)Default: XML*/
				    urlBuilder1.append("&" + URLEncoder.encode("regId","UTF-8") + "=" + URLEncoder.encode(locationTempCode, "UTF-8")); /*11B10101 서울, 11B20201 인천 등 (별첨 파일 참조)*/
				    urlBuilder1.append("&" + URLEncoder.encode("tmFc","UTF-8") + "=" + URLEncoder.encode(time, "UTF-8")); /*-일 2회(06:00,18:00)회 생성 되며 발표시각을 입력- YYYYMMDD0600(1800) 최근 24시간 자료만 제공*/
				    URL url1 = new URL(urlBuilder1.toString());
				    HttpURLConnection conn1 = (HttpURLConnection) url1.openConnection();
				    conn1.setRequestMethod("GET");
				    conn1.setRequestProperty("Content-type", "application/json");
				    System.out.println("Response code: " + conn1.getResponseCode());
				    BufferedReader rd1;
				    if(conn1.getResponseCode() >= 200 && conn1.getResponseCode() <= 300) {
				        rd1 = new BufferedReader(new InputStreamReader(conn1.getInputStream()));
				    } else {
				        rd1 = new BufferedReader(new InputStreamReader(conn1.getErrorStream()));
				    }
				    StringBuilder sb1 = new StringBuilder();
				    String line1;
				    while ((line1 = rd1.readLine()) != null) {
				        sb1.append(line1);
				    }
				    rd1.close();
				    conn1.disconnect();
				    
				    DocumentBuilderFactory dbFactoty1 = DocumentBuilderFactory.newInstance();
				    DocumentBuilder dBuilder1 = dbFactoty1.newDocumentBuilder();
				    Document document1 = dBuilder1.parse(urlBuilder1.toString());

				    // root tag 
				    document1.getDocumentElement().normalize();
				    
				    //루트 엘리먼트 구하기
				    Element root1 = document1.getDocumentElement();
				    
				    //root엘리먼트에서 item태그인 엘리먼트만 추출하기
				    NodeList itemTagList1 = root1.getElementsByTagName("item");
				    
			  //단기예보
				     StringBuilder urlBuilder2 = new StringBuilder("http://apis.data.go.kr/1360000/VilageFcstMsgService/getLandFcst"); /*URL*/
				     urlBuilder2.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=zsiVIlbNLa0CmGU%2B1vLHgsJLlm6mK5D4yDti4V6WoxJoG%2BBTONY2L9D6KxlCxvOlyZrywmoppXYhj2%2FJW%2FYEDA%3D%3D"); /*Service Key*/
				     urlBuilder2.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
				     urlBuilder2.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
				     urlBuilder2.append("&" + URLEncoder.encode("dataType","UTF-8") + "=" + URLEncoder.encode("XML", "UTF-8")); /*요청자료형식(XML/JSON)Default: XML*/
				     urlBuilder2.append("&" + URLEncoder.encode("regId","UTF-8") + "=" + URLEncoder.encode(locationTempCode, "UTF-8")); /*11B10101 서울, 11B20201 인천 등 (별첨 파일 참조)*/
				     URL url2 = new URL(urlBuilder2.toString());
				     HttpURLConnection conn2 = (HttpURLConnection) url2.openConnection();
				     conn2.setRequestMethod("GET");
				     conn2.setRequestProperty("Content-type", "application/json");
				     BufferedReader rd2;
				     if(conn2.getResponseCode() >= 200 && conn2.getResponseCode() <= 300) {
				         rd2 = new BufferedReader(new InputStreamReader(conn2.getInputStream()));
				     } else {
				         rd2 = new BufferedReader(new InputStreamReader(conn2.getErrorStream()));
				     }
				     StringBuilder sb2 = new StringBuilder();
				     String line2;
				     while ((line2 = rd2.readLine()) != null) {
				         sb2.append(line2);
				     }
				     rd2.close();
				     conn2.disconnect();
				     
				     DocumentBuilderFactory dbFactoty2 = DocumentBuilderFactory.newInstance();
				     DocumentBuilder dBuilder2 = dbFactoty2.newDocumentBuilder();
				     Document document2 = dBuilder2.parse(urlBuilder2.toString());
			
				     // root tag 
				     document2.getDocumentElement().normalize();
				        
				     //루트 엘리먼트 구하기
				     Element root2 = document2.getDocumentElement();
				     
				     //root엘리먼트에서 item태그인 엘리먼트만 추출하기
				     NodeList itemTagList2 = root2.getElementsByTagName("item");
			      
				     for(int i=0;i<itemTagList2.getLength();i++) {
				    	 Node nNode2 = itemTagList2.item(i);
				  		 Element eElement2 = (Element) nNode2;
				  		if(i%2==0&&i<5) {
				  			
				  		TotalWeatherVO totalWeatherVO = new TotalWeatherVO();
				       
				  		totalWeatherVO.setSkyStatus(getTagValue("wf",eElement2));
				  		totalWeatherVO.setTemp(getTagValue("ta",eElement2));
				  		
				        weatherList.add(totalWeatherVO);
				  		}
				     } 
			     
				     for(int i=0;i<itemTagList.getLength();i++) {
				    	 //중기기상
				    	 Node nNode = itemTagList.item(i);
				     	 Element eElement = (Element) nNode;
	                 
				     	 Node nNode1 = itemTagList1.item(i);
				     	 Element eElement1 = (Element) nNode1;
				     	 
				     	 
				     	 int longData =8;
				     	 int longCnt=3;
				     	 
					     for(int a=0; a<longData;a++) {
					    	
					    	 TotalWeatherVO totalWeatherVO = new TotalWeatherVO();
					    
						     if(longCnt<8) {
						    	 totalWeatherVO.setSkyStatusAm(getTagValue("wf"+longCnt+"Am",eElement));
						    	 totalWeatherVO.setSkyStatusPm(getTagValue("wf"+longCnt+"Pm",eElement));
						    	 totalWeatherVO.setMinTemp(getTagValue("taMin"+longCnt,eElement1));
						    	 totalWeatherVO.setMaxTemp(getTagValue("taMax"+longCnt,eElement1));
						    	 
							     longCnt=longCnt+1;
						     }
						     else {//8일부터의 데이터
						    	 totalWeatherVO.setSkyStatusAm(getTagValue("wf"+longCnt,eElement));
						    	 totalWeatherVO.setSkyStatusPm(getTagValue("wf"+longCnt,eElement));
						    	 totalWeatherVO.setMinTemp(getTagValue("taMin"+longCnt,eElement1));
						    	 totalWeatherVO.setMaxTemp(getTagValue("taMax"+longCnt,eElement1));
						    	 
							     longCnt=longCnt+1;
					         }
						     weatherList.add(totalWeatherVO);
				         }
					    
			     }
				 
				 String[] arrDate = todayToTenDays();
				 
				 for(int i = 0; i < arrDate.length; i++) {
					 weatherList.get(i).setDate(arrDate[i]);
				 }
				 
			}catch(Exception e) {
				e.printStackTrace();
				
			}
			
			return weatherList;
		}
		
	//날씨 api 매개변수 date값
	public static String date() {
		//현재 날짜
		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyyMMddHHmm");
		java.util.Date time = new java.util.Date();
		String nowDate =format1.format(time);
		
		int nowHour = Integer.parseInt(nowDate.substring(8, 10));
		String date = "";
		
		if(nowHour < 6) {
			//하루전 날짜 구하기
			Calendar cal = Calendar.getInstance();
			String format = "yyyyMMdd1800";
			SimpleDateFormat sdf = new SimpleDateFormat(format);
			cal.add(cal.DATE, -1); //날짜를 하루 뺀다.
			date = sdf.format(cal.getTime());
		}
		else {
			//오늘 날짜 구하기
			Calendar cal = Calendar.getInstance();
			String format = "yyyyMMdd0600";
			SimpleDateFormat sdf = new SimpleDateFormat(format);
			date = sdf.format(cal.getTime());
		}
		
		return date;
	}
	
	//10-24 은아
	//오늘날짜 ~ 10일후 까지 구하는 함수
	public static String[] todayToTenDays() {
		String date = "";
		String[] arrDate = new String[11];
		
		for(int i=0;i<=10;i++) {
		Calendar cal = Calendar.getInstance();
		String format = "MM/dd";
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		cal.add(cal.DATE, +i); //날짜를 하루 더함.
		date = sdf.format(cal.getTime());
		arrDate[i]=date;
		}
		
		
		
		return arrDate;
	}
	
	
	
	
}
