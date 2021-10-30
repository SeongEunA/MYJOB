package com.kh.myjob.common.service;

import java.util.List;

import com.kh.myjob.common.vo.NoticeBoardVO;

public interface CommonService {
	
	//공지사항 전체목록조회
	List<NoticeBoardVO> selectNoticeBoardList();
	
	//공지사항 상세조회
	NoticeBoardVO selectDetailNoticeBoard(String noticeBoardCode);
	
	//공지사항 삭제
	boolean deleteNoticeBoard(String noticeBoardCode);
}
