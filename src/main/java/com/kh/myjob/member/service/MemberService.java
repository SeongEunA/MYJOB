package com.kh.myjob.member.service;

import java.util.List;

import com.kh.myjob.member.vo.MemberVO;

public interface MemberService {
	//ID중복확인
	boolean isJoined(String memberId);
	
	//회원가입
	void join(MemberVO memberVO);
	
	//다음에 들어갈 MEMBER_CODE 조회
	String selectNextMemberCode();
	
	//로그인
	MemberVO login(MemberVO memberVO);
	
	//회원목록 간단조회
	List<MemberVO> selectSimpleMemberList();
	
	//회원목록 상세조회
	MemberVO selectDetailMember(String memberCode);
	
	
	
	
}
