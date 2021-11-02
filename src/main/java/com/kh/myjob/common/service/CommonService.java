package com.kh.myjob.common.service;

import java.util.List;

import com.kh.myjob.common.vo.NoticeBoardVO;

public interface CommonService {
	
	//다음에 들어갈 NOTICE_BOARD_CODE 조회
	String nextNoticeBoardCode();
	
	//공지사항 등록
	boolean regNoticeBoard(NoticeBoardVO noticeBoardVO);
	
	//공지사항 수정
	boolean updateNoticeBoard(NoticeBoardVO noticeBoardVO);
	
	//공지사항 삭제
	boolean deleteNoticeBoard(String noticeBoardCode);
	
	//공지사항 전체목록조회
	List<NoticeBoardVO> selectNoticeBoardList(NoticeBoardVO noticeBoardVO);
	
	//공지사항 상세조회
	NoticeBoardVO selectDetailNoticeBoard(String noticeBoardCode);
	
	
	//공지사항 게시글 개수 조회
	int selectNoticeBoardCnt(NoticeBoardVO noticeBoardVO);
}
