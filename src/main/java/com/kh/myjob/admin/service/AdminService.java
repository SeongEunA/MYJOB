package com.kh.myjob.admin.service;


import java.util.List;

import com.kh.myjob.admin.vo.NoticeBoardVO;

public interface AdminService {
	//공지사항 목록조회
	List<NoticeBoardVO> selectNoticeBoardList();
}
