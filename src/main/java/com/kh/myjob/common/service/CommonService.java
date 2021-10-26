package com.kh.myjob.common.service;

import java.util.List;

import com.kh.myjob.common.vo.NoticeBoardVO;

public interface CommonService {
	
	//공지사항 목록조회
	List<NoticeBoardVO> selectNoticeBoardList();
}
