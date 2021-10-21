package com.kh.myjob.course.controller;

import java.io.BufferedReader;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.annotation.Resource;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.myjob.common.util.WeatherUtil;
import com.kh.myjob.common.vo.WeatherLongSkyStatusVO;
import com.kh.myjob.common.vo.WeatherLongTempVO;
import com.kh.myjob.common.vo.WeatherShortVO;
import com.kh.myjob.course.service.CourseService;

@Controller
@RequestMapping("/course")





public class CourseController {

	 
	
		
	  
	
	
	@Resource(name = "courseService")
	private CourseService courseService;
	
	@GetMapping("/courseSearch")
	public String goCourseSearch(Model model) {
		
		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyyMMdd0600");
		java.util.Date time = new java.util.Date();
		String nowDate =format1.format(time);
		
		List<WeatherShortVO> weatherShortList = WeatherUtil.weatherShort(nowDate);
		List<WeatherLongSkyStatusVO> weatherLongSkyStatusList = WeatherUtil.weatherLongSkyStatus(nowDate);
		List<WeatherLongTempVO> weatherLongList = WeatherUtil.weatherLong(nowDate);
	
		
		model.addAttribute("weatherLongSkyStatusList", weatherLongSkyStatusList);
		model.addAttribute("weatherShortList", weatherShortList);
		  model.addAttribute("weatherLongList", weatherLongList);
		
		return "course/course_search";
	}
	

	@PostMapping("/courseSearch")
	public String resultCourseSearch() {
		
		
		
		
		
		return "";
	}
			
	
			
			
}
