package com.kh.myjob.common.controller;


import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.myjob.common.service.CommonService;


@Controller
@RequestMapping("/common")
public class CommonController {
	@Resource(name = "commonService")
	private CommonService commonService;
	
	//메인페이지로 이동
	@GetMapping("/main")
	public String goMain() {
		return "common/main";
	}
	
	//공지사항 페이지로 이동
	@GetMapping("/noticeBoard")
	public String goNoticeBoard(Model model) {
		model.addAttribute("selectNoticeBoardList", commonService.selectNoticeBoardList());
		return "common/notice_board";
	}
}


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
