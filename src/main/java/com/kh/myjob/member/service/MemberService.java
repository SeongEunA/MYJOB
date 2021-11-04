package com.kh.myjob.member.service;

import java.util.List;

import com.kh.myjob.member.vo.MemberVO;

public interface MemberService {
	//ID중복확인
	boolean isJoined(String memberId);
	
	//Email중복확인
	boolean emailCheck(String memberEmail);
	
	//회원가입
	boolean join(MemberVO memberVO);
	
	//로그인체크
	String loginCheck(MemberVO memberVO);
	
	//로그인
	MemberVO login(MemberVO memberVO);
	
	//회원목록 간단조회
	List<MemberVO> selectMemberList(MemberVO memberVO);
	
	//회원목록 상세조회
	MemberVO selectDetailMember(String memberCode);
	
	//회원목록 수정
	boolean updateMyInfo(MemberVO memberVO);
	
	//회원삭제
	boolean deleteMember(String memberCode);
	
	//회원 관리 목록 전체개수조회
	int selectMemberCnt(MemberVO memberVO);
	
}
