package com.kh.myjob.course.controller;


import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
		
		
		
		//날씨 데이터
		List<WeatherShortVO> weatherShortList = WeatherUtil.weatherShort(date);
		List<WeatherLongSkyStatusVO> weatherLongSkyStatusList = WeatherUtil.weatherLongSkyStatus(date);
		List<WeatherLongTempVO> weatherLongList = WeatherUtil.weatherLong(date);
		
		model.addAttribute("weatherLongSkyStatusList", weatherLongSkyStatusList);
		model.addAttribute("weatherShortList", weatherShortList);
		model.addAttribute("weatherLongList", weatherLongList);
		
		//상위 지역 리스트
		model.addAttribute("highLocationList", courseService.selectHighLocationList());
		
		return "course/course_search";
	}
	
	@ResponseBody
	@PostMapping("/lowLocationListAjax")
	public void lowLocationList() {
		
		
		return ;
	}
			
	
			
			
}
