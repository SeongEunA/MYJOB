package com.kh.myjob.member.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.myjob.member.service.MemberService;
import com.kh.myjob.member.vo.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Resource(name = "memberService")
	private MemberService memberService;
	
	//회원가입 페이지로 이동
	@GetMapping("/join")
	public String goJoin() {
		return "member/join_page";
	}
	
	//ID 중복 체크
	@ResponseBody
	@PostMapping("/idCheck")
	public boolean idCheck(String memberId) {
		//기가입 : true, 미가입 : false
		return memberService.isJoined(memberId);
	}
	
	//EMAIL 중복 체크
	@ResponseBody
	@PostMapping("/emailCheck")
	public boolean emailCheck(String memberEmail) {
		//기가입 : true, 미가입 : false
		return memberService.emailCheck(memberEmail);
	}
	
	//회원가입
	@PostMapping("/join")
	public String join(MemberVO memberVO, Model model ) {
		
		model.addAttribute("joinResult", memberService.join(memberVO));
		return "member/join_result";
	}
	
	//로그인 페이지로 이동
	@GetMapping("/login")
	public String goLogin(@RequestParam(required = false) String prevRequestUrl, Model model) {
		model.addAttribute("prevRequestUrl", prevRequestUrl);
		
		return "member/login_page";
	}
	
	//로그인
	@PostMapping("/login")
	public String login(MemberVO memberVO, HttpSession httpSession,@RequestParam(required = false) String prevRequestUrl) {
		
		if(memberService.login(memberVO) != null) {
	         httpSession.setAttribute("loginInfo", memberService.login(memberVO));
	         
	         
	         if(prevRequestUrl == null || prevRequestUrl.equals("")) {
	        	 return "redirect:/common/main";
	         }
	         else {
	        	 return "redirect:" + prevRequestUrl;	
	         }
	      }
		
		return "redirect:/member/login";
	}
	
	//로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession httpSession) {
		httpSession.removeAttribute("loginInfo");
		
		return "redirect:/common/main";
	}
	
	//마이페이지로 이동
	@GetMapping("/myPage")
	public String goMyPage(String memberCode, Model model) {
		model.addAttribute("detailMyInfo", memberService.selectDetailMember(memberCode));
		return "member/my_page";
	}
	
	//회원정보 수정
	@ResponseBody
	@PostMapping("/updateMyInfo")
	public boolean updateMyInfo(MemberVO memberVO) {
		return memberService.updateMyInfo(memberVO);
	}
	
	//수정된 회원정보 상세페이지 가져오기
	@ResponseBody
	@PostMapping("/updatedDetailMember")
	public MemberVO updatedDetailMember(String memberCode) {
		return memberService.selectDetailMember(memberCode);
	}
	
	//회원 탈퇴
	@GetMapping("/deleteMember")
	public String deleteMember(String memberCode, Model model) {
		model.addAttribute("deleteMemberResult", memberService.deleteMember(memberCode));
		return "member/delete_member_result";
	}
	
}










