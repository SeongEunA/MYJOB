package com.kh.myjob.course.controller;


import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.myjob.common.util.WeatherUtil;
import com.kh.myjob.common.vo.TotalWeatherVO;
import com.kh.myjob.course.service.CourseService;
import com.kh.myjob.course.vo.CourseRegVO;
import com.kh.myjob.course.vo.CourseVO;
import com.kh.myjob.course.vo.LocationVO;
import com.kh.myjob.course.vo.PlaceVO;

@Controller
@RequestMapping("/course")
public class CourseController {
	
	@Resource(name = "courseService")
	private CourseService courseService;
	
	//코스 검색페이지 이동(메뉴버튼 클릭)
	@GetMapping("/courseSearch")
	public String goCourseSearch(Model model, @RequestParam(required = false, defaultValue = "11B00000") String locationLandCode, @RequestParam(required = false, defaultValue = "11B10101") String locationTempCode) {
		
		String date = WeatherUtil.date();
		
		//날씨정보
		model.addAttribute("weatherList", WeatherUtil.weatherList(date, locationLandCode, locationTempCode));
		
		//상위 지역 리스트
		model.addAttribute("highLocationList", courseService.selectHighLocationList());
		
		return "course/course_search";
	}
	
	//상위지역 선택시 하위지역 value 조회되는 ajax
	@ResponseBody
	@PostMapping("/lowLocationListAjax")
	public List<LocationVO> lowLocationListAjax(LocationVO locationVO) {
		
		return courseService.selectLowLocationList(locationVO);
	}
	
	//검색 버튼 클릭시 장소리스트 select ajax
	@ResponseBody
	@PostMapping("/searchPlaceAjax")
	public List<PlaceVO> searchPlaceAjax(PlaceVO placeVO) {
		
		return courseService.selectPlaceList(placeVO);
	}
	
	//검색 버튼 클릭시 지역에 맞는 날씨 조회 ajax
	@ResponseBody
	@PostMapping("/weatherLoadAjax")
	public List<TotalWeatherVO> weatherLoadAjax(String locationTempCode, String locationLandCode) {
		
		String date = WeatherUtil.date();
		
		//날씨 데이터 리턴
	
		return WeatherUtil.weatherList(date, locationLandCode, locationTempCode);
	}
	//내 코스 페이지로 이동
	@GetMapping("/myCourseList")
	public String goMyCourse() {
	      
	      
	return "course/mycourse_list";
	}
	
	//코스등록하러 가기
	@PostMapping("regCourse")
	public void regCourse(CourseRegVO courseRegVO) {
		
		
		
	}
	//코스네임이 중복인지 검사하는 ajax
	@ResponseBody
	@PostMapping("checkCourseNameAjax")
	public CourseVO checkCourseName(CourseVO courseVO,HttpSession httpSession) {

	
		httpSession.getAttribute("loginInfo");
		return courseService.checkCourseName(courseVO);
	}
		
	//코스코드를 등록하는 ajax
	@ResponseBody
	@PostMapping("insertCourseCodeAjax")
	public int insertCourseCode(CourseVO courseVO,HttpSession httpSession,CourseRegVO courseRegVO) {
		httpSession.getAttribute("loginInfo");
		//코스테이블에 insert CourseCode
		courseService.insertCourseCode(courseVO);
		
		//코스테이블의 courseCode조회하기
		CourseVO course = courseService.selectCourseCode(courseVO);
		courseRegVO.setCourseCode(course.getCourseCode());	
		
		//course_reg_place에 insert하기
		
		return courseService.insertCourseByCourseCode(courseRegVO);
		
	}
	
}
