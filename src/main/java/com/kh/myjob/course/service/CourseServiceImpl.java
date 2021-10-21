package com.kh.myjob.course.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("courseService")
public class CourseServiceImpl implements CourseService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	

}
