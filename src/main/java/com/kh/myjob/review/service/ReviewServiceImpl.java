package com.kh.myjob.review.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.myjob.review.vo.ReviewVO;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService {
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public void insertinsertReview(ReviewVO reviewVO) {
		sqlSession.insert("reviewMapper.insertReview", reviewVO);
	}

	@Override
	public void updateReadCnt(ReviewVO reviewVO) {
		sqlSession.update("reviewMapper.updateReadCnt", reviewVO);
	}
}
