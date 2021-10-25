package com.kh.myjob.member.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.myjob.member.vo.MemberVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService{
	@Autowired
	private SqlSessionTemplate sqlsession;
	
	@Override
	public boolean join(MemberVO memberVO) {
		int result = sqlsession.insert("memberMapper.join", memberVO);
		//회원가입 성공 : true, 회원가입 실패 : false
		return result == 1 ? true : false;
	}

	@Override
	public String selectNextMemberCode() {
		return sqlsession.selectOne("memberMapper.selectNextMemberCode");
	}

	@Override
	public MemberVO login(MemberVO memberVO) {
		return sqlsession.selectOne("memberMapper.login", memberVO);
	}

	@Override
	public List<MemberVO> selectSimpleMemberList() {
		return sqlsession.selectList("memberMapper.selectSimpleMemberList");
	}

	@Override
	public MemberVO selectDetailMember(String memberCode) {
		return sqlsession.selectOne("memberMapper.selectDetailMember", memberCode);
	}

	@Override
	public boolean isJoined(String memberId) {
		//기가입 : true, 미가입 : false
		String result = sqlsession.selectOne("memberMapper.isJoined", memberId);
		return result == null ? false : true;
		
	}

	@Override
	public boolean emailCheck(String memberEmail) {
		//이메일 중복 : true, 이메일 미중복 : false
		String result = sqlsession.selectOne("memberMapper.emailCheck", memberEmail);
		return result == null ? false : true;
	}

	@Override
	public boolean deleteMember(String memberCode) {
		//회원삭제 성공 : true, 회원삭제 실패 : false
		int result = sqlsession.delete("memberMapper.deleteMember", memberCode);
		return result == 1 ? true : false;
	}
	
	

}
