package com.kh.myjob.common.controller;


import java.util.Calendar;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
	
	//공지사항 등록페이지로 이동
	@GetMapping("/goRegNoticeBoard")
	public String goRegBoticeBoard(Model model) {
		
		//오늘 날짜 세팅
		String nowDate = getNowDateToString();
		model.addAttribute("nowDate", nowDate);
		
		return "common/reg_notice_board";
	}
	
	//공지사항 등록
	@PostMapping("/regNoticeBoard")
	public String regBoticeBoard(NoticeBoardVO noticeBoardVO, Model model) {
		//NOTICE_BOARD_CODE 세팅
		noticeBoardVO.setNoticeBoardCode(commonService.nextNoticeBoardCode());
		
		model.addAttribute("regNoticeBoardResult", commonService.regNoticeBoard(noticeBoardVO));
		return "common/reg_notice_board_result";
	}
	
		
	//오늘날짜 구하는 메소드
	private String getNowDateToString() {
		//YYYY-MM-DD
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;
		int date = cal.get(Calendar.DATE);
		
		String strMonth = String.valueOf(month);
		if(month < 10) {
			strMonth = "0" + strMonth;
		}
		
		String strDate = String.valueOf(date);
		if(date < 10) {
			strDate = "0" + strDate;
		}
		
		return year +  "." + strMonth + "." + strDate;
	}
}


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
