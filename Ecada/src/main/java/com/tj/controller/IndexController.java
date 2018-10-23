package com.tj.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.tj.service.BoardService;
import com.tj.service.NoticeService;

@Controller
public class IndexController {
	
	@Autowired BoardService bService;
	@Autowired NoticeService nService;

	@RequestMapping("/index.do")
	public ModelAndView index(@RequestParam HashMap<String, String> params) {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("index2");
		return mv;
	}

	@RequestMapping("/ecada.do")
	public ModelAndView ecada(@RequestParam HashMap<String, String> params) {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("index");
		return mv;
	}
	
	@RequestMapping("/home.do")
	public ModelAndView home(@RequestParam HashMap<String, String> params) {
		ModelAndView mv = new ModelAndView();
		
		params.put("start", "0");
		params.put("rows", "5");
		params.put("sidx", "board_seq");
		params.put("sord", "desc");
		mv.setViewName("home");
		// 자유게시판 최신글 5개 
		params.put("typeSeq", "2");
		mv.addObject("freeList", bService.list(params));
		
		// 공지사항 최신글 5개
		params.put("typeSeq", "1");
		mv.addObject("noticeList", nService.list(params));
		return mv;
	}
	
	@RequestMapping("/tables.do")
	public ModelAndView tables(@RequestParam HashMap<String, String> params) {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("index2");
		
		return mv;
	}
	
	@RequestMapping("/goDevNote.do")
	public ModelAndView goDev() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("portfolio/devNote");
		return mv;
	}
}
