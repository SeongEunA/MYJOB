package com.kh.myjob.review.service;

import java.util.List;

import com.kh.myjob.review.vo.ReviewReplyVO;
import com.kh.myjob.review.vo.ReviewVO;

public interface ReviewService {
	
	//후기등록
	void insertReview(ReviewVO reviewVO);
	
	//후기게시판 리스트 조회
	List<ReviewVO> selectReviewList();
	
	//후기게시판 상세보기
	ReviewVO selectReviewDetail(ReviewVO reviewVO);
	
	//후기게시글 조회수증가
	void updateReadCnt(ReviewVO reviewVO);
	
	//후기에 댓글등록
	int regReply(ReviewReplyVO reviewReplyVO);
	
	//후기게시판에 댓글목록 조회
	List<ReviewReplyVO> selectReviewReplyList(ReviewReplyVO reviewReplyVO);
}
