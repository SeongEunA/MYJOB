package com.kh.myjob.review.vo;

import com.kh.myjob.common.vo.PageVO;

public class ReviewReplyVO extends PageVO{
	private String reviewReplyCode;
	private String reviewReplyWriter;
	private String reviewReplyRegDate;
	private String reviewReplyContent;
	private String reviewBoardCode;
	private String memberId;
	
	
	
	
	
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getReviewReplyCode() {
		return reviewReplyCode;
	}
	public void setReviewReplyCode(String reviewReplyCode) {
		this.reviewReplyCode = reviewReplyCode;
	}
	public String getReviewReplyWriter() {
		return reviewReplyWriter;
	}
	public void setReviewReplyWriter(String reviewReplyWriter) {
		this.reviewReplyWriter = reviewReplyWriter;
	}
	public String getReviewReplyRegDate() {
		return reviewReplyRegDate;
	}
	public void setReviewReplyRegDate(String reviewReplyRegDate) {
		this.reviewReplyRegDate = reviewReplyRegDate;
	}
	public String getReviewReplyContent() {
		return reviewReplyContent;
	}
	public void setReviewReplyContent(String reviewReplyContent) {
		this.reviewReplyContent = reviewReplyContent;
	}
	public String getReviewBoardCode() {
		return reviewBoardCode;
	}
	public void setReviewBoardCode(String reviewBoardCode) {
		this.reviewBoardCode = reviewBoardCode;
	}
	
	
	
	
	
}
