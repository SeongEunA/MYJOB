package com.kh.myjob.member.vo;

import com.kh.myjob.common.vo.PageVO;

public class MemberVO extends PageVO{
	private String memberCode;
	private String memberId;
	private String memberName;
	private String memberPw;
	private String memberTel;
	private String memberAddr1;
	private String memberAddr2;
	//private String[] memberAddress;
	private String memberEmail;
	private String memberIsAdmin;
	private String memberGender;
	private String memberJoinDate;
	private String[] memberTels;
	private String[] memberEmails;
	
	
	public String getMemberCode() {
		return memberCode;
	}
	public void setMemberCode(String memberCode) {
		this.memberCode = memberCode;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberPw() {
		return memberPw;
	}
	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}
	public String getMemberTel() {
		return memberTel;
	}
	public void setMemberTel(String memberTel) {
		this.memberTel = memberTel;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public String getMemberIsAdmin() {
		return memberIsAdmin;
	}
	public void setMemberIsAdmin(String memberIsAdmin) {
		this.memberIsAdmin = memberIsAdmin;
	}
	public String getMemberGender() {
		return memberGender;
	}
	public void setMemberGender(String memberGender) {
		this.memberGender = memberGender;
	}
	public String getMemberJoinDate() {
		return memberJoinDate;
	}
	public void setMemberJoinDate(String memberJoinDate) {
		this.memberJoinDate = memberJoinDate;
	}
	public String[] getMemberTels() {
		return memberTels;
	}
	public void setMemberTels(String[] memberTels) {
		String memberTel = memberTels[0] + "-" + memberTels[1] + "-" + memberTels[2];
		setMemberTel(memberTel);
	}
	public String getMemberAddr1() {
		return memberAddr1;
	}
	public void setMemberAddr1(String memberAddr1) {
		this.memberAddr1 = memberAddr1;
	}
	public String getMemberAddr2() {
		return memberAddr2;
	}
	public void setMemberAddr2(String memberAddr2) {
		this.memberAddr2 = memberAddr2;
	}
//	public String[] getMemberAddress() {
//		return memberAddress;
//	}
//	public void setMemberAddress(String[] memberAddress) {
//		String memberAddr = memberAddress[0] + " " + memberAddress[1];
//		setMemberAddr(memberAddr);
//	}
//	
	public String[] getMemberEmails() {
		return memberEmails;
	}
	public void setMemberEmails(String[] memberEmails) {
		String memberEmail = memberEmails[0] + "@" + memberEmails[1];
		setMemberEmail(memberEmail);
	}
	
	
	
	
}
