package com.kh.myjob.review.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.myjob.review.vo.ReviewReplyVO;
import com.kh.myjob.review.vo.ReviewVO;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService {
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public void insertReview(ReviewVO reviewVO) {
		sqlSession.insert("reviewMapper.insertReview", reviewVO);
	}
	@Override
	public ReviewVO selectReviewDetail(ReviewVO reviewVO) {
		return sqlSession.selectOne("reviewMapper.selectReviewDetail", reviewVO);
	}

	@Override
	public void updateReadCnt(ReviewVO reviewVO) {
		sqlSession.update("reviewMapper.updateReadCnt", reviewVO);
	}

	@Override
	public int regReply(ReviewReplyVO reviewReplyVO) {
		return sqlSession.insert("reviewMapper.regReply", reviewReplyVO);
	}

	@Override
	public List<ReviewVO> selectReviewList() {
		return sqlSession.selectList("reviewMapper.selectReviewList");
	}

	@Override
	public List<ReviewReplyVO> selectReviewReplyList(ReviewReplyVO replyVO) {
		return sqlSession.selectList("reviewMapper.selectReviewReplyList", replyVO );
	}

}
