package com.kh.myjob.review.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kh.myjob.common.util.FileUploadUtil;
import com.kh.myjob.member.vo.MemberVO;
import com.kh.myjob.review.service.ReviewService;
import com.kh.myjob.review.vo.ReviewImgVO;
import com.kh.myjob.review.vo.ReviewReplyVO;
import com.kh.myjob.review.vo.ReviewVO;

@Controller
@RequestMapping("/review")
public class ReviewController {
	@Resource(name = "reviewService")
	private ReviewService reviewService;

	// 리뷰목록화면
	@RequestMapping("/selectReviewList")
	public String SelectReviewList(Model model, ReviewVO reviewVO) {
		//페이징처리 게시글수 
		int reviewCnt = reviewService.selectReviewCnt(reviewVO);
	
	
		reviewVO.setTotalCnt(reviewCnt);
		 
		 //페이징처리 
		reviewVO.setPageInfo();
	
		
		model.addAttribute("reviewList", reviewService.selectReviewList(reviewVO));
		
		return "review/review_list";
	}

	// 리뷰등록화면으로 이동
	@GetMapping("/regReview")
	public String goRegReview() {
		return "review/reg_review";
	}

	// 리뷰등록
	@PostMapping("/regReview")
	public String regReview(ReviewVO reviewVO, MultipartHttpServletRequest multi, HttpSession session) {
		// name 속성 값으로 첨부파일을 가져온다
		Iterator<String> inpuNames = multi.getFileNames();
		// 첨부할 경로
		String uploadPath = "C:\\Users\\CHOE YUSEUNG\\git\\MYJOB\\src\\main\\webapp\\resources\\images\\";
		// 첨부파일의 정보를 받을 통
		List<ReviewImgVO> imgList = new ArrayList<>();
		// 다음 리뷰코드조회
		String reviewBoardCode = reviewService.selectNextReviewBoardCode();
		// 다음 이미지코드조회
		int nextImgCode = reviewService.selectNextReviewNumber();
		// 반복자로 반복문을 돌린다
		while (inpuNames.hasNext()) {
			String inputName = inpuNames.next();
			// 이제 첨부
			try {
				// 다중첨부
				if (inputName.equals("file2")) {
					List<MultipartFile> filList = multi.getFiles(inputName);
					for (MultipartFile file : filList) {
						String attachedFileName = FileUploadUtil.getNowDateTime() + "_" + file.getOriginalFilename();
						String uploadFile = uploadPath + attachedFileName;
						file.transferTo(new File(uploadFile));

						ReviewImgVO img = new ReviewImgVO();
						img.setReviewImgCode("REVIEW_IMG_" + String.format("%03d", nextImgCode++));
						img.setReviewImgOriginName(file.getOriginalFilename());
						img.setReviewImgAttachedName(attachedFileName);
						img.setReviewBoardCode(reviewBoardCode);
						img.setIsMain("N");

						imgList.add(img);

					}
				}
				// 단일첨부
				else {
					MultipartFile file = multi.getFile(inputName);
					String attachedFileName = FileUploadUtil.getNowDateTime() + "_" + file.getOriginalFilename();
					String uploadFile = uploadPath + attachedFileName;
					file.transferTo(new File(uploadFile));

					ReviewImgVO img = new ReviewImgVO();
					img.setReviewImgCode("REVIEW_IMG_" + String.format("%03d", nextImgCode++));
					img.setReviewImgOriginName(file.getOriginalFilename());
					img.setReviewImgAttachedName(attachedFileName);
					img.setReviewBoardCode(reviewBoardCode);
					img.setIsMain("Y");

					imgList.add(img);
				}

			} catch (IllegalStateException e) { // 비논리적, 문법적 오류를 잡아준다
				e.printStackTrace(); // 원래 처리를 해야하나 그냥 이유만 띄워준다
			} catch (IOException e) {// 입출력관련한 오류를 잡아준다
				e.printStackTrace();
			}

		}
		reviewVO.setReviewBoardCode(reviewBoardCode);
		reviewService.insertReview(reviewVO);

		reviewVO.setReviewImgList(imgList);

		reviewService.insertReviewImg(reviewVO);

		return "redirect:/review/selectReviewList";
	}

	// 해당리뷰 상세보기로 이동
	@GetMapping("/detailReview")
	public String detailReview(ReviewVO reviewVO, Model model) {
		model.addAttribute("review", reviewService.selectReviewDetail(reviewVO));
		reviewService.updateReadCnt(reviewVO);
		return "review/review_detail";
	}

	// 리뷰에 댓글 등록
	@ResponseBody
	@PostMapping("/regRely")
	public int regReply(ReviewReplyVO reviewReplyVO, HttpSession session) {
		reviewReplyVO.setReviewReplyWriter(((MemberVO) session.getAttribute("loginInfo")).getMemberName());
		return reviewService.regReply(reviewReplyVO);
	}

	// 후기게시판에 댓글목록 조회
	@ResponseBody
	@PostMapping("/selectReviewReplyList")
	public List<ReviewReplyVO> selectReviewReplyList(ReviewReplyVO reviewReplyVO) {
	
		return reviewService.selectReviewReplyList(reviewReplyVO);
	}

	// 후기게시판에 댓글목록 삭제
	@ResponseBody
	@PostMapping("/deleteReply")
	public int deleteReply(ReviewReplyVO reviewReplyVO) {
		return reviewService.deleteReiviewReply(reviewReplyVO);
	}

}
