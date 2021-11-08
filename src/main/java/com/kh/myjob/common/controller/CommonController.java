package com.kh.myjob.common.controller;


import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.myjob.common.service.CommonService;
import com.kh.myjob.common.vo.NoticeBoardVO;


@Controller
@RequestMapping("/common")
public class CommonController {
	@Resource(name = "commonService")
	private CommonService commonService;
	
	//메인페이지로 이동
	@GetMapping("/main")
	public String goMain(Model model, NoticeBoardVO noticeBoardVO) {
		
		//전체 데이터 수
		int dataCnt = commonService.selectNoticeBoardCnt(noticeBoardVO);
		noticeBoardVO.setTotalCnt(dataCnt);
			
		//페이징 처리
		noticeBoardVO.setPageInfo();
		
		
		model.addAttribute("noticeBoardList", commonService.selectNoticeBoardList(noticeBoardVO));
		
		return "common/main_page";
	}
	
	//공지사항 페이지로 이동
	@RequestMapping("/noticeBoard")
	public String goNoticeBoard(Model model, NoticeBoardVO noticeBoardVO) {
		
		//전체 데이터 수
		int dataCnt = commonService.selectNoticeBoardCnt(noticeBoardVO);
		noticeBoardVO.setTotalCnt(dataCnt);
			
		//페이징 처리
		noticeBoardVO.setPageInfo();
		
		
		model.addAttribute("noticeBoardList", commonService.selectNoticeBoardList(noticeBoardVO));
		return "common/notice_board";
	}
	
	//공지사항 상세페이지로 이동
	@GetMapping("/detailNoticeBoard")
	public String goDetailNoticeBoard(String noticeBoardCode, Model model) {
		model.addAttribute("detailNoticeBoard", commonService.selectDetailNoticeBoard(noticeBoardCode));
		return "common/notice_board_detail";
	}
}


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
