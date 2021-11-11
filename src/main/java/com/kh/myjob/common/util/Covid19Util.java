package com.kh.myjob.common.util;

import java.io.BufferedReader;
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

import com.kh.myjob.common.vo.Covid19VO;

import java.io.InputStreamReader;

public class Covid19Util {
	
	// tag값의 정보를 가져오는 메소드
	private static String getTagValue(String tag, Element eElement) {
		NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
		Node nValue = (Node) nlList.item(0);
		if(nValue == null) {
			return null;
		}
		return nValue.getNodeValue();
	}
	
	public static List<Covid19VO> covid19InfoList(String date) {
		//담아서 return 시킬 List
		List<Covid19VO> covid19List = new ArrayList<Covid19VO>();
//		System.out.println("날짜가 이상한가?? 몇일임?? " + date);
		try {
			
			StringBuilder urlBuilder = new StringBuilder("http://openapi.data.go.kr/openapi/service/rest/Covid19/getCovid19SidoInfStateJson"); /*URL*/
			urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=29YGR8xJEDy4v9oHBkw9qMgxXcTE1UklB3cytn0pI2Hft3Wc0NYge0pMmTIuEO9ZHQZ1iLNgt0xUILTPoCAurg%3D%3D"); /*Service Key*/
			urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
			urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
			urlBuilder.append("&" + URLEncoder.encode("startCreateDt","UTF-8") + "=" + URLEncoder.encode(date, "UTF-8")); /*검색할 생성일 범위의 시작*/
			urlBuilder.append("&" + URLEncoder.encode("endCreateDt","UTF-8") + "=" + URLEncoder.encode(date, "UTF-8")); /*검색할 생성일 범위의 종료*/
			URL url = new URL(urlBuilder.toString());
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
			System.out.println("Covid19 Response code: " + conn.getResponseCode());
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
			Document doc = dBuilder.parse(urlBuilder.toString());

			// root tag 
			doc.getDocumentElement().normalize();
			
			Element root = doc.getDocumentElement();
			
			// 파싱할 tag
			NodeList covidItemList = root.getElementsByTagName("item");
			
//			System.out.println("for문을 못들어 온다고?? 왜??");
//			System.out.println("데이터는 몇개 받아오니??" + covidItemList.getLength() + "개 받아옵니다!");
			
			for(int temp = 0; temp < covidItemList.getLength(); temp++){	
//				System.out.println("if문 들어오기전 for문 몇번 도니?" + temp);
				
				Node covidItemNode = covidItemList.item(temp);

				if(covidItemNode.getNodeType() == Node.ELEMENT_NODE){
					Element eElement = (Element) covidItemNode;
					
					Covid19VO covid19VO = new Covid19VO();
					
					covid19VO.setStdDay(getTagValue("stdDay", eElement)); // 기준일시
					covid19VO.setGubun(getTagValue("gubun", eElement)); //지역
					covid19VO.setDefCnt(Integer.parseInt(getTagValue("defCnt", eElement))); // 누적 확진자 수
					covid19VO.setIncDec(Integer.parseInt(getTagValue("incDec", eElement))); // 신규 확진자 수
					
//					System.out.println("기준날짜 = " + covid19VO.getStdDay());
//					System.out.println("지역 = " + covid19VO.getGubun());
//					System.out.println("누적확진자 = " + covid19VO.getDefCnt());
//					System.out.println("신규확진자 = " + covid19VO.getIncDec());
					
					covid19List.add(covid19VO);
				}
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return covid19List;
	}
	
	//코로나용 날짜
	public static String date() {
		//현재 날짜
		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyyMMddHHmm");
		java.util.Date time = new java.util.Date();
		String nowDate =format1.format(time);
		int nowHour = Integer.parseInt(nowDate.substring(8, 10));
		
		String date = "";
		
		if(nowHour < 10) {
			//하루전 날짜 구하기
			Calendar cal = Calendar.getInstance();
			String format = "yyyyMMdd";
			SimpleDateFormat sdf = new SimpleDateFormat(format);
			cal.add(Calendar.DATE, -1); //날짜를 하루 뺀다.
			date = sdf.format(cal.getTime());
		}
		else {
			//오늘 날짜 구하기
			Calendar cal = Calendar.getInstance();
			String format = "yyyyMMdd";
			SimpleDateFormat sdf = new SimpleDateFormat(format);
			date = sdf.format(cal.getTime());
		}
		
		return date;
	}
}
