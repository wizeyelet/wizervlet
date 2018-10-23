package com.tj.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tj.service.GridService;

@Controller
public class GridController {
	@Autowired private GridService gService;
	private Logger logger = Logger.getLogger(GridController.class);

	@Value("#{config['site.context.path']}")
	private String contextRoot;

	@ResponseBody
	@RequestMapping("/grid/goList.do")
	public ModelAndView goGBoard() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("admin/grid");
		return mv;
	}

	@ResponseBody
	@RequestMapping("/gBoard/gList.do")
	public HashMap<String, Object> gList(@RequestParam HashMap<String, String> params) {
		logger.debug("show"+params);
		//한 페이지에 보여줄 게시글 수
		int rows = Integer.parseInt(params.get("rows"));
		
		//현재 페이지
		int currentPage = Integer.parseInt(params.get("page"));
		
		//전체 회원수
		int totalMember = gService.getTotalCount(params);
		
		//DB에 접근하여 게시물 정보를 가져온다.
		int firstIdx = Math.abs((currentPage-1) * rows);		//DB검색에 사용할 현재 블록에 따른 첫번째 게시물 번호 변수
		params.put("startIdx", String.valueOf(firstIdx));
		
		int totalPage = (int)Math.ceil(totalMember/(double)rows);
		
		//DB통신
		ArrayList<HashMap<String, Object>> list = gService.gList(params);
//		List<Map<String, Object>> boardList = bService.viewList(params);
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("page", params.get("page"));//현재페이지
		result.put("total", totalPage);//총페이지수
		result.put("rows", list);//데이터(목록)
		result.put("records", totalMember);//총회원수
		result.put("gb", 3);//gBoard identity
		
		return result;		
	}
	
	@RequestMapping("/gBoard/goWrite.do")
	public ModelAndView goWrite(@RequestParam int gb) {
		ModelAndView mv = new ModelAndView();
		logger.debug("show"+gb);
		if(gb==3)mv.addObject("gb", "3");
		mv.setViewName("board/write");
		return mv;
	}
}
