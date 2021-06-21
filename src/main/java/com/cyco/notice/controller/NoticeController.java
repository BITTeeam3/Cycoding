package com.cyco.notice.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.cyco.notice.service.NoticeServiceImpl;

@Controller
@RequestMapping(value="notice")
public class NoticeController {
	@Autowired 
	private NoticeServiceImpl service;
	
	//공지사항 목록화면 요청
	@RequestMapping(value = "list")
	public String list(Model model, HttpSession session) {
		//DB에서 공지 글 목록을 조회해와 목록 화면에 출력
		model.addAttribute("list", service.notice_list());
		
		return "Notice/list";
	}
	
	//신규 공지 글 작성 화면 요청
	@RequestMapping(value = "form")
	public String notice() {
		return "Notice/new";
	}
	
	//신규 공지 글 저장 처리 요청
	@RequestMapping(value = "insert")
	public String insert() {
		//화면에서 입력한 정보를 DB에 저장한 후
		//목록 화면으로 연결
		return "redirect:list";
	}
}