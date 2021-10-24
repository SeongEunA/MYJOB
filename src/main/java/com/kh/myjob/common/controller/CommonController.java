package com.kh.myjob.common.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.myjob.common.util.WeatherUtil;
import com.kh.myjob.common.vo.WeatherLongSkyStatusVO;
import com.kh.myjob.common.vo.WeatherLongTempVO;
import com.kh.myjob.common.vo.WeatherShortVO;

@Controller
@RequestMapping("/common")
public class CommonController {
	
	@GetMapping("/main")
	public String goMain(Model model, @RequestParam(required = false, defaultValue = "11B00000") String locationLandCode, @RequestParam(required = false, defaultValue = "11B10101") String locationTempCode) {
		
	String date = WeatherUtil.date();
		
		//날씨 데이터
		List<WeatherShortVO> weatherShortList = WeatherUtil.weatherShort(date, locationTempCode);
		List<WeatherLongSkyStatusVO> weatherLongSkyStatusList = WeatherUtil.weatherLongSkyStatus(date, locationLandCode);
		List<WeatherLongTempVO> weatherLongList = WeatherUtil.weatherLong(date, locationTempCode);
		String[] arrDate = WeatherUtil.todayToTenDays();
		
		for(String e:arrDate) {
			System.out.println(e);
		}
		model.addAttribute("arrDate", arrDate);
		model.addAttribute("weatherLongSkyStatusList", weatherLongSkyStatusList);
		model.addAttribute("weatherShortList", weatherShortList);
		model.addAttribute("weatherLongList", weatherLongList);
		return "common/main";
	}
}


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
