package com.kh.myjob.common.vo;

import java.util.List;


public class TotalWeatherVO {
	private List<WeatherShortVO> weatherShortList;
	private List<WeatherLongSkyStatusVO> weatherLongSkyStatusList;
	private List<WeatherLongTempVO> weatherLongList;
	private String[] arrDate;
	
	
	
	public String[] getArrDate() {
		return arrDate;
	}
	public void setArrDate(String[] arrDate) {
		this.arrDate = arrDate;
	}
	public List<WeatherShortVO> getWeatherShortList() {
		return weatherShortList;
	}
	public void setWeatherShortList(List<WeatherShortVO> weatherShortList) {
		this.weatherShortList = weatherShortList;
	}
	public List<WeatherLongSkyStatusVO> getWeatherLongSkyStatusList() {
		return weatherLongSkyStatusList;
	}
	public void setWeatherLongSkyStatusList(List<WeatherLongSkyStatusVO> weatherLongSkyStatusList) {
		this.weatherLongSkyStatusList = weatherLongSkyStatusList;
	}
	public List<WeatherLongTempVO> getWeatherLongList() {
		return weatherLongList;
	}
	public void setWeatherLongList(List<WeatherLongTempVO> weatherLongList) {
		this.weatherLongList = weatherLongList;
	}
	
	
	
}
