package com.tj.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.tj.service.AttachService;
import com.tj.service.BoardService;
import com.tj.service.VideoService;

@Controller
public class VideoController {
	@Value("#{config['site.context.path']}")
	private String contextRoot;
	private Logger log = Logger.getLogger(BoardController.class);

	@Autowired BoardService bService;
	@Autowired VideoService vService;
	@Autowired AttachService aService;
	
	@RequestMapping("/video/goNlp.do")
	public ModelAndView goNlp(@RequestParam HashMap<String, String> params) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("video/list");
		
		// 현재 페이지
		int currentPage = Integer.parseInt(params.containsKey("page")?params.get("page"):"1");
		// 페이지에 보여줄 게시글 수
		int rows = Integer.parseInt(params.containsKey("rows")?params.get("rows"):"10");
		// 총 게시글 수 
		int total = bService.getTotalArticleCnt(params);
		// 총 페이지 수 계산
		int totalPage =  (int) Math.ceil((double) total / rows);
		
		// 시작 게시글 번호
		//int start = ((currentPage - 1) * rows) + 1;
		int start = Math.abs((currentPage-1) * rows);
		
		params.put("start", String.valueOf(start));
		params.put("rows", String.valueOf(rows));
		params.put("sidx", "board_seq");
		params.put("sord", "desc");
		
		ArrayList<HashMap<String, Object>> list = vService.list(params);

		// 기본 블럭 수 10
		int blockSize = Integer.parseInt(params.containsKey("blockSize")?params.get("blockSize"):"10");;
		int startBlockNo = (currentPage - 1) / blockSize * blockSize + 1;
		int endBlockNo = (currentPage - 1) / blockSize * blockSize + blockSize;
		endBlockNo = (endBlockNo >= totalPage)?totalPage:endBlockNo;
		
		mv.addObject("searchType", params.get("searchType"));  
		mv.addObject("searchText", params.get("searchText"));
		//
		mv.addObject("test", "t");
		mv.addObject("totalPage", totalPage);
		mv.addObject("currentPage", currentPage);
		mv.addObject("blockSize", blockSize);
		mv.addObject("startBlockNo", startBlockNo);
		mv.addObject("endBlockNo", endBlockNo);
		mv.addObject("list", list);
		
		return mv;
	}

	@ResponseBody
	@RequestMapping("/video/goWrite.do")
	public ModelAndView goWrite() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("video/write");
		
		return mv;
	}
	
	@ResponseBody
	@RequestMapping("/video/write.do")
	public int write(@RequestParam HashMap<String, Object> params, MultipartHttpServletRequest mReq) {
		//ModelAndView mv = new ModelAndView();
		log.debug("show!!"+params);
		
		//attach File
		//mReq.getMultiFileMap();
		List<MultipartFile> mFiles = mReq.getFiles("attFile");
		
		for(MultipartFile mf : mFiles) {
			if(!mf.getOriginalFilename().equals("")) {
				params.put("hasFile", "1");
				break;
			} else params.put("hasFile", "0");
			System.out.println("show name : "+mf.getOriginalFilename());
			System.out.println("show type : "+mf.getContentType());
			System.out.println("show size : "+mf.getSize());
		}
		
		String contents = params.get("contents").toString();
		contents = contents.replaceAll("\r", "<br/>");
		//contents = contents.replaceAll("\n", "<br/>");
		//contents = contents.replaceAll("\\r\\n", "<br/>");
		//params.put("contents", contents);
		params.put("contents", contents);
		
		return bService.write(params, mFiles);
	}

	@ResponseBody
	@RequestMapping("/video/delete.do")
	public int delete(@RequestParam int typeSeq, @RequestParam int boardSeq, HttpSession session) {
		//@RequestParam int typeSeq, @RequestParam int boardSeq, 
		//@RequestParam HashMap<String, Object> params,
		//int typeSeq = (int)params.get("typeSeq");
		//int boardSeq = (int)params.get("boardSeq");
		log.debug("show call delete:"+typeSeq+boardSeq);
		int result=0;
		if(session.getAttribute("memberId")!=null) {
			result = bService.delete(typeSeq, boardSeq);
			String url = "";

			if (result != 1) {
				url = contextRoot+"/video/read.do?boardSeq=";
				url += boardSeq+"&typeSeq="+typeSeq;
				//rv = new RedirectView(url);
				//mv.setView(rv);
				//mv.addObject("msg", "삭제 실패! 관리자에게 따지세요.");
			}else {
				//rv = new RedirectView(contextRoot+"/free/fList.do");
				//mv.addObject("msg", "삭제되었슴당.");
				//mv.setView(rv);

			}

		}else {
			//mv.addObject("msg", "로그인하세요.");
			//mv.addObject("nextLocation", "/index.do");
			//mv.setViewName("common/error");

		}
		
		return result;
	}
}
