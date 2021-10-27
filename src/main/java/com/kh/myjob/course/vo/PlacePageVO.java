package com.kh.myjob.course.vo;

import java.util.List;

import com.kh.myjob.common.vo.PageVO;

public class PlacePageVO {
	private List<PlaceVO> selectPlaceList;
	private PageVO pageVO;
	
	public List<PlaceVO> getSelectPlaceList() {
		return selectPlaceList;
	}
	public void setSelectPlaceList(List<PlaceVO> selectPlaceList) {
		this.selectPlaceList = selectPlaceList;
	}
	public PageVO getPageVO() {
		return pageVO;
	}
	public void setPageVO(PageVO pageVO) {
		this.pageVO = pageVO;
	}
	
	
}
