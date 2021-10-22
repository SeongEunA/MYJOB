package com.kh.myjob.course.service;

import java.util.List;

import com.kh.myjob.course.vo.LocationVO;

public interface CourseService {
	//상위 지역명 리스트
	List<LocationVO> selectHighLocationList();
	
	
	//하위 지역명 리스트
	List<LocationVO> selectLowLocationList(LocationVO locationVO);
	
	
	
}
