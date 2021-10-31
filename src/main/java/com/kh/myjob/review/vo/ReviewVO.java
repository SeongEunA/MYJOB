package com.kh.myjob.review.vo;

import java.util.List;

import com.kh.myjob.common.vo.PageVO;

public class ReviewVO extends PageVO {

	private String reviewBoardCode;
	private String reviewBoardTitle;
	private String reviewBoardContent;
	private String reviewBoardWriter;
	private String reviewBoardRegDate;
	private int reviewBoardRecommendCnt;
	private int reviewBoardReadCnt;
	private List<ReviewImgVO> reviewImgList;
	

	public String getReviewBoardRegDate() {
		return reviewBoardRegDate;
	}

	public void setReviewBoardRegDate(String reviewBoardRegDate) {
		this.reviewBoardRegDate = reviewBoardRegDate;
	}
	
	public List<ReviewImgVO> getReviewImgList() {
		return reviewImgList;
	}

	public void setReviewImgList(List<ReviewImgVO> reviewImgList) {
		this.reviewImgList = reviewImgList;
	}

	public String getReviewBoardCode() {
		return reviewBoardCode;
	}

	public void setReviewBoardCode(String reviewBoardCode) {
		this.reviewBoardCode = reviewBoardCode;
	}

	public String getReviewBoardTitle() {
		return reviewBoardTitle;
	}

	public void setReviewBoardTitle(String reviewBoardTitle) {
		this.reviewBoardTitle = reviewBoardTitle;
	}

	public String getReviewBoardContent() {
		return reviewBoardContent;
	}

	public void setReviewBoardContent(String reviewBoardContent) {
		this.reviewBoardContent = reviewBoardContent;
	}

	public String getReviewBoardWriter() {
		return reviewBoardWriter;
	}

	public void setReviewBoardWriter(String reviewBoardWriter) {
		this.reviewBoardWriter = reviewBoardWriter;
	}

	public int getReviewBoardRecommendCnt() {
		return reviewBoardRecommendCnt;
	}

	public void setReviewBoardRecommendCnt(int reviewBoardRecommendCnt) {
		this.reviewBoardRecommendCnt = reviewBoardRecommendCnt;
	}

	public int getReviewBoardReadCnt() {
		return reviewBoardReadCnt;
	}

	public void setReviewBoardReadCnt(int reviewBoardReadCnt) {
		this.reviewBoardReadCnt = reviewBoardReadCnt;
	}

}
