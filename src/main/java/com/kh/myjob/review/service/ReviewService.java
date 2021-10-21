package com.kh.myjob.review.service;

import com.kh.myjob.review.vo.ReviewVO;

public interface ReviewService {
	
	//리뷰등록
	void insertinsertReview(ReviewVO reviewVO);
	
	//조회수증가
	void updateReadCnt(ReviewVO reviewVO);
}
