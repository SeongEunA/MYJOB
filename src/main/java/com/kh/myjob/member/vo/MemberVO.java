package com.kh.myjob.member.vo;

import java.util.Arrays;

import com.kh.myjob.common.vo.PageVO;

public class MemberVO extends PageVO{
	private String memberCode;
	private String memberId;
	private String memberName;
	private String memberPw;
	private String memberTel;
	private String memberAddr;
	private String memberEmail;
	private String memberIsAdmin;
	private String memberGender;
	private String memberJoinDate;
	private String[] memberTels;
	private String[] memberAddres;
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
	public String getMemberAddr() {
		return memberAddr;
	}
	public void setMemberAddr(String memberAddr) {
		this.memberAddr = memberAddr;
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
	public String[] getMemberAddres() {
		return memberAddres;
	}
	public void setMemberAddres(String[] memberAddres) {
		String memberAddr = memberAddres[0] + " " + memberAddres[1];
		setMemberAddr(memberAddr);
	}
	
	public String[] getMemberEmails() {
		return memberEmails;
	}
	public void setMemberEmails(String[] memberEmails) {
		String memberEmail = memberEmails[0] + "@" + memberEmails[1];
		setMemberEmail(memberEmail);
	}
	@Override
	public String toString() {
		return "MemberVO [memberCode=" + memberCode + ", memberId=" + memberId + ", memberName=" + memberName
				+ ", memberPw=" + memberPw + ", memberTel=" + memberTel + ", memberAddr=" + memberAddr
				+ ", memberEmail=" + memberEmail + ", memberIsAdmin=" + memberIsAdmin + ", memberGender=" + memberGender
				+ ", memberJoinDate=" + memberJoinDate + ", memberTels=" + Arrays.toString(memberTels)
				+ ", memberAddres=" + Arrays.toString(memberAddres) + ", memberEmails=" + Arrays.toString(memberEmails)
				+ "]";
	}
	
	
	
}
