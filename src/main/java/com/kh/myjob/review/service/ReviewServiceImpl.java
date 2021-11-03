package com.kh.myjob.review.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.myjob.review.vo.ReviewImgVO;
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
	public List<ReviewVO> selectReviewList(ReviewVO reviewVO) {
		return sqlSession.selectList("reviewMapper.selectReviewList", reviewVO);
	}

	@Override
	public List<ReviewReplyVO> selectReviewReplyList(ReviewReplyVO reviewReplyVO) {
		return sqlSession.selectList("reviewMapper.selectReviewReplyList", reviewReplyVO);
	}
	
	@Override
	public boolean deleteReviewReply(ReviewReplyVO reviewReplyVO) {
		return sqlSession.delete("reviewMapper.deleteReviewReply", reviewReplyVO) == 1 ? true : false;
	}
	
	@Override
	public String selectNextReviewBoardCode() {
		return sqlSession.selectOne("reviewMapper.selectNextReviewBoardCode");
	}
	
	@Override
	public void insertReviewImg(ReviewVO reviewVO) {
		sqlSession.insert("reviewMapper.insertReviewImg", reviewVO);
	}
	
	@Override
	public int selectNextReviewNumber() {
		return sqlSession.selectOne("reviewMapper.selectNextReviewNumber");
	}
	
	@Override
	public List<ReviewReplyVO> manageReplyList(ReviewReplyVO reviewReplyVO) {
		return sqlSession.selectList("reviewMapper.manageReplyList", reviewReplyVO);
	}
	
	@Override
	public boolean deleteReviewBoard(String reviewBoardCode) {
		//리뷰게시글 삭제 성공 : true, 리뷰게시글 삭제 실패 : false
		return sqlSession.delete("reviewMapper.deleteReviewBoard", reviewBoardCode) == 1 ? true : false;
	}
	@Override
	public ReviewReplyVO manageReplyDetail(String reviewReplyCode) {
		return sqlSession.selectOne("reviewMapper.manageReplyDetail", reviewReplyCode);
	}
	
	@Override
	public int selectReviewCnt(ReviewVO reviewVO) {
		return sqlSession.selectOne("reviewMapper.selectReviewCnt", reviewVO);
	}
	
	@Override
	public int manageReplyCnt(ReviewReplyVO reviewReplyVO) {
		return sqlSession.selectOne("reviewMapper.manageReplyCnt", reviewReplyVO);
	}
	
	
	

}
