package com.kh.myjob.member.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
		return "member/join";
	}
	
	//ID 중복 체크
	@ResponseBody
	@PostMapping("/idCheck")
	public boolean idCheck(String memberId) {
		//기가입 : true, 미가입 : false
		return memberService.isJoined(memberId);
	}
	
	//회원가입
	@PostMapping("/join")
	public String join(MemberVO memberVO) {
		//다음에 들어갈 MEMBER_CODE 조회
		String memberCode = memberService.selectNextMemberCode();
		memberVO.setMemberCode(memberCode);
		
		memberService.join(memberVO);
		return "redirect:/common/main";
	}
	
	//로그인 페이지로 이동
	@GetMapping("/login")
	public String goLogin() {
		return "member/login";
	}
	
	//로그인
	@PostMapping("/login")
	public String login(MemberVO memberVO, HttpSession httpSession) {
		MemberVO loginInfo = memberService.login(memberVO);
		
		if(loginInfo != null) {
			httpSession.setAttribute("loginInfo", loginInfo);
			
			if(loginInfo.getMemberIsAdmin().equals("Y")) {
				return "redirect:/admin/adminPage";
			}
			else {
				return "redirect:/common/main";
			}
		}
		
		return "redirect:/common/main";
	}
	
	//로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession httpSession) {
		httpSession.removeAttribute("loginInfo");
		
		return "redirect:/common/main";
	}
	
	//마이페이지로 이동
	@GetMapping("/myPage")
	public String goMyPage() {
		return "member/my_page";
	}
	
	//EMAIL 중복 체크
	@ResponseBody
	@PostMapping("/emailCheck")
	public boolean emailCheck(String memberEmail) {
		//기가입 : true, 미가입 : false
		return memberService.emailCheck(memberEmail);
	}
	
}










