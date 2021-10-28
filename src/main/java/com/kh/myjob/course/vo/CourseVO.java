package com.kh.myjob.course.vo;

import java.util.List;

public class CourseVO {

	private String courseCode;
	private String courseName;
	private String memberId;
	private List<CourseRegVO> coursePlaceList;
	
	
	
	public List<CourseRegVO> getCoursePlaceList() {
		return coursePlaceList;
	}
	public void setCoursePlaceList(List<CourseRegVO> coursePlaceList) {
		this.coursePlaceList = coursePlaceList;
	}
	public String getCourseCode() {
		return courseCode;
	}
	public void setCourseCode(String courseCode) {
		this.courseCode = courseCode;
	}
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	
	
	
	
	
	
}
