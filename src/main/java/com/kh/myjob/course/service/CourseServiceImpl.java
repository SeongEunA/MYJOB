package com.kh.myjob.course.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.myjob.course.vo.LocationVO;
import com.kh.myjob.course.vo.PlaceVO;

@Service("courseService")
public class CourseServiceImpl implements CourseService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<LocationVO> selectHighLocationList() {
		return sqlSession.selectList("courseMapper.selectHighLocationList");
	}

	@Override
	public List<LocationVO> selectLowLocationList(LocationVO locationVO) {
		return sqlSession.selectList("courseMapper.selectLowLocationList",locationVO);
	}

	@Override
	public List<PlaceVO> selectPlaceList(PlaceVO placeVO) {
		return sqlSession.selectList("courseMapper.selectPlaceList", placeVO);
	}
	
	

}
