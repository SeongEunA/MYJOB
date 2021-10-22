package com.kh.myjob.course.service;

import java.util.List;

import com.kh.myjob.course.vo.LocationVO;
import com.kh.myjob.course.vo.PlaceVO;

public interface CourseService {
	//상위 지역명 리스트
	List<LocationVO> selectHighLocationList();
	
	//하위 지역명 리스트
	List<LocationVO> selectLowLocationList(LocationVO locationVO);
	
	//검색조건에 따른 Place 리스트
	List<PlaceVO> selectPlaceList(PlaceVO placeVO);
	
	
}
