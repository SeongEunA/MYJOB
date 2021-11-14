package com.kh.myjob.admin.controller;



import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.myjob.common.service.CommonService;
import com.kh.myjob.common.vo.NoticeBoardVO;
import com.kh.myjob.member.service.MemberService;
import com.kh.myjob.member.vo.MemberVO;
import com.kh.myjob.review.service.ReviewService;
import com.kh.myjob.review.vo.ReviewReplyVO;
import com.kh.myjob.review.vo.ReviewVO;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Resource(name = "memberService")
	private MemberService memberService;
	
	@Resource(name = "commonService")
	private CommonService commonService;
	
	@Resource(name = "reviewService")
	private ReviewService reviewService;
	
	//회원 관리 페이지로 이동
	@RequestMapping("/memberManage")
	public String goMemberManage(Model model, MemberVO memberVO) {
		
		
		//전체 데이터 수
		int dataCnt = memberService.selectMemberCnt(memberVO);
		memberVO.setTotalCnt(dataCnt);
			
		//페이징 처리
		memberVO.setPageInfo();
		
		
		model.addAttribute("memberList", memberService.selectMemberList(memberVO));
		return "admin/member_manage";
	}
	
	//회원 관리 상세페이지로 이동
	@GetMapping("/detailMember")
	public String detailMember(String memberCode, Model model) {
		model.addAttribute("detailMember", memberService.selectDetailMember(memberCode));
		return "admin/member_detail";
	}
	
	//회원 삭제
	@GetMapping("/deleteMember")
	public String deleteMember(String memberCode, Model model) {
		model.addAttribute("deleteMemberResult", memberService.deleteMember(memberCode));
		return "admin/delete_member_result";
	}
	
	
	//댓글 관리 페이지로 이동
	@RequestMapping("/replyManage")
	public String goReplyManage(Model model, ReviewReplyVO reviewReplyVO) {
		
		
		//전체 데이터 수
		int dataCnt = reviewService.manageReplyCnt(reviewReplyVO);
		reviewReplyVO.setTotalCnt(dataCnt);
			
		//페이징 처리
		reviewReplyVO.setPageInfo();
		
		
		model.addAttribute("replyList", reviewService.manageReplyList(reviewReplyVO));
		return "admin/reply_manage";
	}
	
	//댓글 관리 상세페이지로 이동
	@GetMapping("/detailReply")
	public String goDetailReply(Model model, String reviewReplyCode) {
		model.addAttribute("detailReply", reviewService.manageReplyDetail(reviewReplyCode));
		return "admin/reply_detail_manage";
	}
	
	//댓글 삭제
	@GetMapping("/deleteReviewReply")
	public String deleteReply(Model model, ReviewReplyVO reviewReplyVO) {
		model.addAttribute("deleteReplyResult", reviewService.deleteReviewReply(reviewReplyVO));
		return "admin/delete_reply_result";
	}
	
	//공지사항 수정
	@ResponseBody
	@PostMapping("/updateNoticeBoard")
	public boolean updateNoticeBoard(NoticeBoardVO noticeBoardVO) {
		return commonService.updateNoticeBoard(noticeBoardVO);
	}
	
	//수정된 공지사항 상세페이지 가져오기
	@ResponseBody
	@PostMapping("/updatedDetailNoticeBoard")
	public NoticeBoardVO selectDetailNoticeBoard(String noticeBoardCode) {
		return commonService.selectDetailNoticeBoard(noticeBoardCode);
	}
	
	//공지사항 삭제
	@GetMapping("/deleteNoticeBoard")
	public String deleteNoticeBoard(String noticeBoardCode, Model model) {
		model.addAttribute("deleteNoticeBoardResult", commonService.deleteNoticeBoard(noticeBoardCode));
		return "common/delete_notice_board_result";
	}
	
	
	
	
	
}









