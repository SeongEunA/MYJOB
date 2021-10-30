package com.kh.myjob.review.service;

import java.util.List;

import com.kh.myjob.review.vo.ReviewImgVO;
import com.kh.myjob.review.vo.ReviewReplyVO;
import com.kh.myjob.review.vo.ReviewVO;

public interface ReviewService {
	
	
	//후기등록게시판 다음 코드조회
	String selectNextReviewBoardCode();
	
	//다음 이미지 코드 조회
	int selectNextReviewNumber();
	
	//후기등록
	void insertReview(ReviewVO reviewVO);
	
	//후기게시판 이미지등록
	void insertReviewImg(ReviewVO reviewVO);
	
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
	
	//후기게시판에 댓글삭제
	int deleteReiviewReply(ReviewReplyVO reviewReplyVO);
	
	//댓글관리게시판에 댓글목록조회
	List<ReviewReplyVO> manageReplyList();
	
	
}
