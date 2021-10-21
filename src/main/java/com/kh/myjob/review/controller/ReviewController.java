package com.kh.myjob.review.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kh.myjob.review.service.ReviewService;
import com.kh.myjob.review.vo.ReviewVO;


//샘플입니다. 프로젝트 진행 시 해당 클래스는 삭제하시면 됩니다.
@Controller
@RequestMapping("/review")
public class ReviewController {
	@Resource(name = "reviewService")
	private ReviewService reviewService;
	
	@GetMapping("/sampleJsp")
	public String goSampleJsp() {
		return  "sample/sample";
	}
	
	@GetMapping("/selectReviewList")
	public String SelectReviewList() {
		return  "review/review_list";
	}
	@GetMapping("/regReview")
	public String goRegReview() {
		//비로그인상태면
	//	if(비로그인상태) {
	//		로그인창으로 이동후 로그인유도
	//	}
	//	else {
	//		로그인상태에서는 정상적으로 후기작성페이지로 이동		
	//		return "review/reg_review";
	//	}
		return "review/reg_review";
	}
	@PostMapping("/regReview")
	public String regReview(ReviewVO reviewVO, MultipartHttpServletRequest multi) {
		reviewVO.setReviewBoardWriter("java");
		reviewService.insertinsertReview(reviewVO);
		return "redirect:/review/selectReviewList";
	}
	@GetMapping("/detailReview")
	public String detailReview() {
		return "review/review_detail";
	}
	
	
	
	
	
}

