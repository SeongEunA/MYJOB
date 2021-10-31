package com.kh.myjob.common.vo;

public class NoticeBoardVO extends PageVO{
	private String noticeBoardCode;
	private String boardSubject;
	private String boardContent;
	private String boardWriter;
	private String regDate;
	
	public String getNoticeBoardCode() {
		return noticeBoardCode;
	}
	public void setNoticeBoardCode(String noticeBoardCode) {
		this.noticeBoardCode = noticeBoardCode;
	}
	public String getBoardSubject() {
		return boardSubject;
	}
	public void setBoardSubject(String boardSubject) {
		this.boardSubject = boardSubject;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public String getBoardWriter() {
		return boardWriter;
	}
	public void setBoardWriter(String boardWriter) {
		this.boardWriter = boardWriter;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	
	
}
