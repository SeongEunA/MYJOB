package com.kh.myjob.course.service;

import java.util.List;

import com.kh.myjob.course.vo.CourseRegVO;
import com.kh.myjob.course.vo.CourseVO;
import com.kh.myjob.course.vo.LocationVO;
import com.kh.myjob.course.vo.PlaceVO;

public interface CourseService {
	//상위 지역명 리스트
	List<LocationVO> selectHighLocationList();
	
	//하위 지역명 리스트
	List<LocationVO> selectLowLocationList(LocationVO locationVO);
	
	//검색조건에 따른 Place 리스트
	List<PlaceVO> selectPlaceList(PlaceVO placeVO);
	
	//코스등록시 코스이름 중복확인
	CourseVO checkCourseName(CourseVO courseVO);
	
	//코스코드 등록하는 쿼리
	void insertCourseCode(CourseVO courseVO);
	
	//코스코드 조회하는 쿼리
	CourseVO selectCourseCode(CourseVO courseVO);
	
	//코스 등록하는 쿼리
	int insertCourseByCourseCode(CourseRegVO courseRegVO);
}
