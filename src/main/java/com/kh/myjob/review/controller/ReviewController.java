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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.myjob.common.util.FileUploadUtil;
import com.kh.myjob.course.service.CourseService;
import com.kh.myjob.course.vo.CourseVO;
import com.kh.myjob.review.service.ReviewService;
import com.kh.myjob.review.vo.ReviewImgVO;
import com.kh.myjob.review.vo.ReviewRecomVO;
import com.kh.myjob.review.vo.ReviewReplyVO;
import com.kh.myjob.review.vo.ReviewVO;

@Controller
@RequestMapping("/review")
public class ReviewController {
	@Resource(name = "reviewService")
	private ReviewService reviewService;
	
	@Resource(name = "courseService")
	private CourseService courseService;
	
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
	public String goRegReview(CourseVO courseVO, Model model) {
		
		//아이디별 코스리스트 조회
		model.addAttribute("courseList", courseService.selectCoursePlaceList(courseVO));
		
		//처음 선택된 코스코드로 코스 조회(최초로 코스등록 페이지 진입했을 때)
		String firstCourseCode = (courseService.selectCoursePlaceList(courseVO)).get(0).getCourseCode();
		
		courseVO.setCourseCode(firstCourseCode);
		model.addAttribute("courseListBycourseCode", courseService.selectCoursePlaceListByCourseCode(courseVO));
		
		return "review/reg_review";
	}

	//리뷰등록화면에서 셀렉트값 변경시 출력되는 코스 변경 ajax
	@ResponseBody
	@PostMapping("/changeSelectBoxAjax")
	public List<CourseVO> changeSelectBoxAjax(CourseVO courseVO) {
	
		return courseService.selectCoursePlaceListByCourseCode(courseVO);
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
			/*	if (inputName.equals("file")) {
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
				}*/
				// 단일첨부
		/*		else {*/
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
				/* } */

			} catch (IllegalStateException e) { // 비논리적, 문법적 오류를 잡아준다
				e.printStackTrace(); // 원래 처리를 해야하나 그냥 이유만 띄워준다
			} catch (IOException e) {// 입출력관련한 오류를 잡아준다
				e.printStackTrace();
			}

		}
		
		reviewVO.setReviewBoardCode(reviewBoardCode);
		reviewService.insertReview(reviewVO);
		
		
		for(int i = 0; i < imgList.size(); i++) {
			if(i == (imgList.size()-1) && i != 0) {
				imgList.remove(i);
			}
		}
		reviewVO.setReviewImgList(imgList);
	
		  if(reviewVO.getReviewImgList().get(0).getReviewImgOriginName() != "") {
			  reviewService.insertReviewImg(reviewVO); 
		  }
		
		 
		return "redirect:/review/selectReviewList";
	}

	// 해당리뷰 상세보기로 이동
	@GetMapping("/detailReview")
	public String detailReview(@RequestParam(value="reviewBoardCode")String reviewBoardCode, ReviewReplyVO reviewReplyVO, ReviewVO reviewVO ,Model model, ReviewRecomVO reviewRecomVO) {
		reviewService.updateReadCnt(reviewVO);
		int replyCnt =  reviewService.selectReplyCnt(reviewReplyVO);
		reviewReplyVO.setTotalCnt(replyCnt);
		  
		reviewReplyVO.setPageInfo();
		
		model.addAttribute("reviewRecom", reviewService.selectRecomMember(reviewRecomVO));
		model.addAttribute("review", reviewService.selectReviewDetail(reviewVO));
		return "review/review_detail";
	}

	// 리뷰에 댓글 등록
	@PostMapping("/regRely")
	public String regReply(ReviewReplyVO reviewReplyVO, RedirectAttributes redirect) {
		reviewService.regReply(reviewReplyVO);
		redirect.addAttribute("reviewBoardCode", reviewReplyVO.getReviewBoardCode());
		return "redirect:/review/detailReview";
	}

	
	
	// 후기게시판에 댓글목록 삭제
	@GetMapping("/deleteReply")
	public String deleteReply(ReviewReplyVO reviewReplyVO, RedirectAttributes redirectAttributes) {
		reviewService.deleteReviewReply(reviewReplyVO);
		redirectAttributes.addAttribute("reviewBoardCode", reviewReplyVO.getReviewBoardCode());
		return "redirect:/review/detailReview";
	}
	
	// 추천수증가
	@ResponseBody
	@GetMapping("/updateRecommend")
	public ReviewVO updateRecommend(ReviewVO reviewVO, ReviewRecomVO reviewRecomVO) {
		reviewService.updateRecommendCnt(reviewVO);
		reviewService.insertRecomMember(reviewRecomVO);
		return reviewService.selectReviewDetail(reviewVO);			
	}
	
	
}
