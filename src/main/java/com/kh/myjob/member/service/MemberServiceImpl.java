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
	public void join(MemberVO memberVO) {
		sqlsession.insert("memberMapper.join", memberVO);
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

}
