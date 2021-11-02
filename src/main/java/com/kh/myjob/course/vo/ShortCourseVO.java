package com.kh.myjob.course.vo;

public class ShortCourseVO {
	private double x;
	private double y;
	private boolean isVisit;
	private int originIndex;
	private int resultIndex;
	private boolean isCate;
	private double distance;
	
	
	public ShortCourseVO() {
		this.isCate = false;
		this.isVisit = false;
	}
	
	public double getDistance() {
		return distance;
	}
	public void setDistance(double distance) {
		this.distance = distance;
	}
	public int getOriginIndex() {
		return originIndex;
	}
	public void setOriginIndex(int originIndex) {
		this.originIndex = originIndex;
	}
	public int getResultIndex() {
		return resultIndex;
	}
	public void setResultIndex(int resultIndex) {
		this.resultIndex = resultIndex;
	}
	public double getX() {
		return x;
	}
	public void setX(double x) {
		this.x = x;
	}
	public double getY() {
		return y;
	}
	public void setY(double y) {
		this.y = y;
	}
	public boolean isVisit() {
		return isVisit;
	}
	public void setVisit(boolean isVisit) {
		this.isVisit = isVisit;
	}
	public boolean isCate() {
		return isCate;
	}
	public void setCate(boolean isCate) {
		this.isCate = isCate;
	}
}
