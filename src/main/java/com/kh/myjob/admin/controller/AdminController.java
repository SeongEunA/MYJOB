package com.kh.myjob.admin.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.myjob.admin.service.AdminService;
import com.kh.myjob.common.service.CommonService;
import com.kh.myjob.member.service.MemberService;
import com.kh.myjob.member.vo.MemberVO;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Resource(name = "memberService")
	private MemberService memberService;
	
	@Resource(name = "commonService")
	private CommonService commonService;
	
	
	//관리자 페이지로 이동
	@GetMapping("/adminPage")
	public String goAdminPage() {
		return "admin/admin_page";
	}
	
	//회원관리 페이지로 이동
	@GetMapping("/memberManage")
	public String goMemberManage(Model model) {
		model.addAttribute("simpleMemberList", memberService.selectSimpleMemberList());
		return "admin/member_manage";
	}
	
	//회원 상세조회
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
	
	//리뷰 게시물 관리 페이지로 이동
	@GetMapping("/reviewManage")
	public String goReviewManage() {
		return "admin/review_manage";
		
	}
	
	//댓글 관리 페이지로 이동
	@GetMapping("/replyManage")
	public String goReplyManage() {
		return "admin/reply_manage";
		
	}
	
	//공지사항 관리 페이지로 이동
	@GetMapping("/noticeBoardManage")
	public String goNoticeBoardManage(Model model) {
		model.addAttribute("noticeBoardList", commonService.selectNoticeBoardList());
		return "admin/notice_board_manage";
		
	}
	
	//공지사항 상세관리 페이지로 이동
	@GetMapping("/manageNoticeBoard")
	public String goManageNoticeBoard(String noticeBoardCode, Model model) {
		model.addAttribute("detailNoticeBoard", commonService.selectDetailNoticeBoard(noticeBoardCode));
		return "admin/notice_board_detail_manage";
	}
}









