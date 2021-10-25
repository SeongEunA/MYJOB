package com.kh.myjob.review.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kh.myjob.member.vo.MemberVO;
import com.kh.myjob.review.service.ReviewService;
import com.kh.myjob.review.vo.ReviewReplyVO;
import com.kh.myjob.review.vo.ReviewVO;


@Controller
@RequestMapping("/review")
public class ReviewController {
	@Resource(name = "reviewService")
	private ReviewService reviewService;
	
	
	//리뷰목록화면
	@GetMapping("/selectReviewList")
	public String SelectReviewList(Model model) {
		model.addAttribute("reviewList", reviewService.selectReviewList());
		return  "review/review_list";
	}
	
	//리뷰등록화면으로 이동
	@GetMapping("/regReview")
	public String goRegReview() {
		return "review/reg_review";
	}
	//리뷰등록
	@PostMapping("/regReview")
	public String regReview(ReviewVO reviewVO, HttpSession session) {
		reviewService.insertReview(reviewVO);
		return "redirect:/review/selectReviewList";
	}
	//해당리뷰 상세보기로 이동
	@GetMapping("/detailReview")
	public String detailReview(ReviewVO reviewVO, Model model) {
		 model.addAttribute("review", reviewService.selectReviewDetail(reviewVO));
		 reviewService.updateReadCnt(reviewVO);
		return "review/review_detail";
	}
	
	//리뷰에 댓글 등록 
	@ResponseBody
	@PostMapping("/regRely")
	public int regReply(ReviewReplyVO reviewReplyVO) {
		return reviewService.regReply(reviewReplyVO);
	}
	//후기게시판에 댓글목록 조회
	@ResponseBody
	@PostMapping("/selectReviewReplyList")
	public List<ReviewReplyVO> selectReviewReplyList(ReviewReplyVO reviewReplyVO) {
		return reviewService.selectReviewReplyList(reviewReplyVO);
	}
	//후기게시판에 댓글목록 삭제
	@ResponseBody
	@PostMapping("/deleteReply")
	public int deleteReply(ReviewReplyVO reviewReplyVO) {
		return reviewService.deleteReiviewReply(reviewReplyVO);
	}
	
	
}

