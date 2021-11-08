package com.kh.myjob.course.controller;


import java.util.ArrayList;
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
import com.kh.myjob.course.vo.PlacePageVO;
import com.kh.myjob.course.vo.PlaceVO;
import com.kh.myjob.course.vo.ShortCourseVO;
import com.kh.myjob.course.vo.TempSaveCourseVO;

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
	@RequestMapping("/searchPlaceAjax")
	public PlacePageVO searchPlaceAjax(PlaceVO placeVO, PlacePageVO placePageVO) {
		//totalCnt 갯수 조회 및 세팅
		placeVO.setTotalCnt(courseService.selectTotalCnt(placeVO));
		
		//페이징 처리 세팅
		placeVO.setPageInfo();
		
		placePageVO.setPageVO(placeVO);
		placePageVO.setSelectPlaceList(courseService.selectPlaceList(placeVO));
		
		return placePageVO;
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
	public String goMyCourse(CourseVO courseVO,Model model, TempSaveCourseVO tempSaveCourseVO) {
	    
		model.addAttribute("courseList", courseService.selectCoursePlaceList(courseVO));
		
		model.addAttribute("tempSaveCourseList", courseService.selectTempSaveCourse(tempSaveCourseVO));
		
	return "course/mycourse_list";
	}
	
	//코스네임이 중복인지 검사하는 ajax
	@ResponseBody
	@PostMapping("/checkCourseNameAjax")
	public CourseVO checkCourseName(CourseVO courseVO,HttpSession httpSession) {

		return courseService.checkCourseName(courseVO);
	}
		
	//코스코드를 등록하는 ajax
	@ResponseBody
	@PostMapping("/insertCourseCodeAjax")
	public int insertCourseCode(CourseVO courseVO, CourseRegVO courseRegVO, @RequestParam(value="placeNameArr[]") List<String> name, @RequestParam(value="placeAddrArr[]") List<String> addr, @RequestParam(value="cateCodeArr[]") List<String> cate,@RequestParam(value="placeXArr[]") List<String> placeX,@RequestParam(value="placeYArr[]") List<String> placeY) {
		
		//코스테이블에 insert CourseCode
		courseService.insertCourseCode(courseVO);
		
		//코스테이블의 courseCode조회하기
		CourseVO course = courseService.selectCourseCode(courseVO);
		
		//course_reg_place에 insert하기
		int result = 0;
		
		for(int i = 0; i < name.size(); i++) {

			courseRegVO.setCourseCode(course.getCourseCode());	
			courseRegVO.setPlaceName(name.get(i));
			courseRegVO.setPlaceAddr(addr.get(i));
			courseRegVO.setCateCode(cate.get(i));
			courseRegVO.setX(placeX.get(i));
			courseRegVO.setY(placeY.get(i));
			
			courseService.insertCourseByCourseCode(courseRegVO);
			result = 1;
		}
		
		return result;
		
	}
	
	//mycourse_list에서 코스목록에 있는 X버튼 클릭시 실행 ajax
	@ResponseBody
	@PostMapping("/deletePlaceInCourseAjax")
	public List<CourseVO> deletePlaceInCourse(CourseRegVO courseRegVO, CourseVO courseVO) {
		System.out.println("!!!!cateCode : " + courseRegVO.getCateCode());
		courseService.insertTempSaveCourse(courseRegVO);
		courseService.deletePlaceInCourse(courseRegVO);
		return courseService.selectCoursePlaceList(courseVO);
	}
	
	//코스삭제 버튼 클릭시 실행 ajax
	@ResponseBody
	@PostMapping("/deleteCourseAjax")
	public int deleteCourseAjax(CourseVO courseVO) {
		return courseService.deleteCourse(courseVO);
	}

	
	//삭제된 장소들을 원하는 코스에 다시 insert
	@ResponseBody
	@PostMapping("/insertPlaceByDeleteAjax")
	public List<CourseVO> insertPlaceByDeleteAjax(CourseRegVO courseRegVO, CourseVO courseVO, @RequestParam(value="placeNameArr[]") List<String> name, @RequestParam(value="placeAddrArr[]") List<String> addr,@RequestParam(value="cateCodeArr[]") List<String> cate,@RequestParam(value="xArr[]") List<String> xArr,@RequestParam(value="yArr[]") List<String> yArr) {
	
		for(int i = 0; i < name.size(); i++) {
			courseRegVO.setCourseCode(courseRegVO.getCourseCode());	
			courseRegVO.setPlaceName(name.get(i));
			courseRegVO.setPlaceAddr(addr.get(i));
			courseRegVO.setCateCode(cate.get(i));
			
			courseRegVO.setX(xArr.get(i));
			courseRegVO.setY(yArr.get(i));
			
			courseService.insertCourseByCourseCode(courseRegVO);
			courseService.deleteCheck(courseRegVO);
		}
		
		
		
		return courseService.selectCoursePlaceList(courseVO);
	}
	
	//임시저장 테이블에 있는 체크된 장소들 삭제
	@ResponseBody
	@PostMapping("/deleteCheckCourseAjax")
	public int deleteCheckCourse(CourseRegVO courseRegVO, @RequestParam(value="placeNameArr[]") List<String> name) {

		for(int i = 0; i < name.size(); i++) {
			courseRegVO.setPlaceName(name.get(i));
			
			courseService.deleteCheck(courseRegVO);
		}
		
		return 0;
	}
	
	//최단거리 코스추천
	@PostMapping("/theShortestCourse")
	public String theShortestCourse(Model model, CourseVO courseVO, TempSaveCourseVO tempSaveCourseVO) {
		System.out.println("최단거리 시작!!!!!!!");
		System.out.println("id"+tempSaveCourseVO.getMemberId());
		List<CourseVO> courseList = courseService.selectCoursePlaceListByCourseCode(courseVO);
		List<CourseRegVO> courseRegList = courseList.get(0).getCoursePlaceList();

		List<ShortCourseVO> shortCourseList = new ArrayList<ShortCourseVO>(); //shortCourseList 객체를 담은 리스트
		
		//객체에 x,y 값 좌표 설정
		for(int i = 0; i < courseRegList.size(); i++) {
			ShortCourseVO shortCourseVO = new ShortCourseVO();
			
			if(courseRegList.get(i).getCateCode().equals("CATE_001")) {
				System.out.println(courseRegList.get(i).getX());
				System.out.println(courseRegList.get(i).getY());
				shortCourseVO.setCate(true);
				shortCourseVO.setOriginIndex(i);
				shortCourseVO.setResultIndex(0);
				shortCourseVO.setX(Double.parseDouble(courseRegList.get(i).getX()));
				shortCourseVO.setY(Double.parseDouble(courseRegList.get(i).getY()));
			}
			else {
				shortCourseVO.setOriginIndex(i);
				shortCourseVO.setX(Double.parseDouble(courseRegList.get(i).getX()));
				shortCourseVO.setY(Double.parseDouble(courseRegList.get(i).getY()));
			}
			
			shortCourseList.add(shortCourseVO);
		}
		
		//기준장소 x,y값
		double startX = 0;
		double startY = 0;
		
		//계산된 거리값
		//List<Double> distance = new ArrayList<Double>();
		
		//최종 추천코스가 담길 리스트
		List<String> resultCourse = new ArrayList<String>();
		
		for(int i = 0; i < shortCourseList.size(); i++) {
			if(shortCourseList.get(i).isCate()) {
				startX = shortCourseList.get(i).getX();
				startY = shortCourseList.get(i).getY();
				shortCourseList.get(i).setVisit(true);
				resultCourse.add(courseRegList.get(i).getPlaceName());
			}
		}
		
		shortCourse(shortCourseList,startX,startY,resultCourse,courseRegList);
		
		for(int i=0; i<resultCourse.size();i++) {
			
			System.out.println(resultCourse.get(i));
		}
		
		model.addAttribute("resultCourseList", resultCourse);
		model.addAttribute("courseList", courseService.selectCoursePlaceList(courseVO));
		model.addAttribute("tempSaveCourseList", courseService.selectTempSaveCourse(tempSaveCourseVO));
		
		return "course/mycourse_list";
	}
	
	//추천코스 메소드
	public int shortCourse(List<ShortCourseVO> shortCourseList,double startX,double startY,List<String> resultCourse,List<CourseRegVO> courseRegList) {
		//남은장소 x,y값
		double placeX = 0;
		double placeY = 0;
		
		int visitCnt = 0;
		for(int i = 0;i< shortCourseList.size();i++) {
			
			
			if(shortCourseList.get(i).isVisit()) {
				
				visitCnt++;
			}
			
		}
		
		if(visitCnt==shortCourseList.size()) {
			
			return 0;
		}
		
		
		else {
			System.out.println("!!!!" + visitCnt);
			for(int i = 0; i < shortCourseList.size(); i++) {
				
				if(shortCourseList.get(i).isVisit() == false) {
					System.out.println(i+"번째"+"placeX : "+placeX);
					System.out.println(i+"번째"+"placeY : "+placeY);
					placeX = shortCourseList.get(i).getX();
					placeY = shortCourseList.get(i).getY();
					shortCourseList.get(i).setDistance(((startX-placeX)*(startX-placeX)) + ((startY-placeY)*(startY-placeY)));
					System.out.println("계산된 거리 : " +  shortCourseList.get(i).getDistance());
				}
			}
			
			double minDis = 100;
			
			int originIndex=0;
			
			for(int i =0; i<shortCourseList.size(); i++) {
				
				if(shortCourseList.get(i).isVisit()==false) {
					if(minDis > shortCourseList.get(i).getDistance()) {
						System.out.println("shortCourseList.get(i).getDistance() = " + shortCourseList.get(i).getDistance());
						
						minDis = shortCourseList.get(i).getDistance();
						System.out.println("바뀌기 전 origin index = " + originIndex);
						originIndex = shortCourseList.get(i).getOriginIndex();
						System.out.println("바뀐 후 origin index = " + originIndex);
					}
				
				}
				
				
			}
			
			for(int i =0; i<shortCourseList.size();i++) {
			System.out.println("i = " + i);
			System.out.println("originIndex = " + originIndex + " / shortCourseList.get(i).getOriginIndex() = " + shortCourseList.get(i).getOriginIndex());
				
				if(shortCourseList.get(i).getOriginIndex()==originIndex) {
			
					startX = shortCourseList.get(i).getX();
					startY = shortCourseList.get(i).getY();
					shortCourseList.get(i).setVisit(true);
					resultCourse.add(courseRegList.get(i).getPlaceName());
					
				}
			}
			
			
			
			return shortCourse(shortCourseList,startX,startY,resultCourse,courseRegList);
		}
	}
}







