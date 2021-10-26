package com.kh.myjob.common.vo;



public class TotalWeatherVO {
	private String maxTemp;
	private String minTemp;
	private String skyStatusAm;
	private String skyStatusPm;
	
	private String skyStatus;
	private String temp;
	
	private String date;
	
	
	
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getSkyStatus() {
		return skyStatus;
	}
	public void setSkyStatus(String skyStatus) {
		this.skyStatus = skyStatus;
	}
	public String getTemp() {
		return temp;
	}
	public void setTemp(String temp) {
		this.temp = temp;
	}
	
	
	
	public String getSkyStatusAm() {
		return skyStatusAm;
	}
	public void setSkyStatusAm(String skyStatusAm) {
		this.skyStatusAm = skyStatusAm;
	}
	public String getSkyStatusPm() {
		return skyStatusPm;
	}
	public void setSkyStatusPm(String skyStatusPm) {
		this.skyStatusPm = skyStatusPm;
	}
	public String getMaxTemp() {
		return maxTemp;
	}
	public void setMaxTemp(String maxTemp) {
		this.maxTemp = maxTemp;
	}
	public String getMinTemp() {
		return minTemp;
	}
	public void setMinTemp(String minTemp) {
		this.minTemp = minTemp;
	}
	
	
}
//private List<WeatherShortVO> weatherShortList;
//private List<WeatherLongVO> weatherLongList;
//private String[] arrDate;
//
//
//
//public String[] getArrDate() {
//	return arrDate;
//}
//public void setArrDate(String[] arrDate) {
//	this.arrDate = arrDate;
//}
//public List<WeatherShortVO> getWeatherShortList() {
//	return weatherShortList;
//}
//public void setWeatherShortList(List<WeatherShortVO> weatherShortList) {
//	this.weatherShortList = weatherShortList;
//}
//
//public List<WeatherLongVO> getWeatherLongList() {
//	return weatherLongList;
//}
//public void setWeatherLongList(List<WeatherLongVO> weatherLongList) {
//	this.weatherLongList = weatherLongList;
//}
//
//public void aaa() {
//	for(int i = 0; i < getWeatherLongList().size(); i++) {
//		getWeatherLongList().get(i).getMinTemp();
//		getWeatherLongList().get(i).getMaxTemp();
//		getWeatherLongList().get(i).getSkyStatusAm();
//		getWeatherLongList().get(i).getSkyStatusPm();
//		
//		
//	}
//}
