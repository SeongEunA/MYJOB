package com.kh.myjob.course.service;

import java.util.List;

import com.kh.myjob.course.vo.CourseRegVO;
import com.kh.myjob.course.vo.CourseVO;
import com.kh.myjob.course.vo.LocationVO;
import com.kh.myjob.course.vo.PlaceVO;
import com.kh.myjob.course.vo.TempSaveCourseVO;

public interface CourseService {
	//상위 지역명 리스트
	List<LocationVO> selectHighLocationList();
	
	//하위 지역명 리스트
	List<LocationVO> selectLowLocationList(LocationVO locationVO);
	
	//검색조건에 따른 Place 리스트
	List<PlaceVO> selectPlaceList(PlaceVO placeVO);
	
	//검색조건에 따른 Place 갯수
	int selectTotalCnt(PlaceVO placeVO);
	
	//코스등록시 코스이름 중복확인
	CourseVO checkCourseName(CourseVO courseVO);
	
	//코스코드 등록하는 쿼리
	void insertCourseCode(CourseVO courseVO);
	
	//코스코드 조회하는 쿼리
	CourseVO selectCourseCode(CourseVO courseVO);
	
	//코스 등록하는 쿼리
	int insertCourseByCourseCode(CourseRegVO courseRegVO);
	
	//내코스 조회하는 쿼리
	List<CourseVO> selectCoursePlaceList(CourseVO courseVO);
	
	//코스코드로 코스정보 조회하는 쿼리
	List<CourseVO> selectCoursePlaceListByCourseCode(CourseVO courseVO); 
	
	//코스에 등록된 장소 삭제
	int deletePlaceInCourse(CourseRegVO courseRegVO);
	
	//임시저장코스 테이블 등록
	void insertTempSaveCourse(CourseRegVO courseRegVO);
	
	//아이디로 임시저장코스 테이블 조회
	List<TempSaveCourseVO> selectTempSaveCourse(TempSaveCourseVO tempSaveCourseVO);
}
