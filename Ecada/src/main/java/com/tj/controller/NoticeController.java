package com.tj.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.servlet.view.RedirectView;

import com.tj.dto.Board;
import com.tj.service.AttachService;
import com.tj.service.BoardService;
import com.tj.service.NoticeService;
import com.tj.util.FileUtil;

@Controller
public class NoticeController {
	@Value("#{config['site.context.path']}")
	private String contextRoot;
	private Logger log = Logger.getLogger(NoticeController.class);

	@Autowired NoticeService nService;
	@Autowired AttachService aService;
	@Autowired FileUtil fUtil;
	
	/**
	 * 자유게시판 리스트 불러오기
	 * @param 현재 페이지 정보, 
	 * @return 현재 페이지에 해당하는 게시물 테이블
	 */
	@ResponseBody
	@RequestMapping("/notice/nList.do")
	public ModelAndView goLogin(@RequestParam HashMap<String, String> params){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("notice/list");
		log.debug("show list"+params);
		
		
		// 현재 페이지
		int currentPage = Integer.parseInt(params.containsKey("page")?params.get("page"):"1");
		// 페이지에 보여줄 게시글 수
		int rows = Integer.parseInt(params.containsKey("rows")?params.get("rows"):"10");
		// 총 게시글 수 
		int total = nService.getTotalArticleCnt(params);
		// 총 페이지 수 계산
		int totalPage =  (int) Math.ceil((double) total / rows);
		
		// 시작 게시글 번호
		//int start = ((currentPage - 1) * rows) + 1;
		int start = Math.abs((currentPage-1) * rows);
		
		params.put("start", String.valueOf(start));
		params.put("rows", String.valueOf(rows));
		params.put("sidx", "board_seq");
		params.put("sord", "desc");
		
		ArrayList<HashMap<String, Object>> list = nService.list(params);
		
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
	
	/**
	 * write.jsp 페이지로 이동
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/notice/goWrite.do")
	public ModelAndView goWrite() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("notice/write");
		
		return mv;
	}

	/**
	 * 사용자가 작성한 게시물을 DB에 저장
	 * @param 작성된 게시물의 정보들을 받아온다.
	 * @return 글 목록으로 돌아간다.
	 */
	@ResponseBody
	@RequestMapping("/notice/write.do")
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
		
		//RedirectView rv = new RedirectView("/ecada/notice/fList.do");
		//mv.setView(rv);
		return nService.write(params, mFiles);
	}


	@RequestMapping("/notice/read.do")
	public ModelAndView goRead(@RequestParam HashMap<String, String> params) {
/*		ModelAndView mv = new ModelAndView();

		Map<String, Object> article = bService.read(Integer.parseInt(params.get("typeSeq")), Integer.parseInt(params.get("boardSeq")));

		String msg = params.get("msg");
		if(msg !=null) {
			mv.addObject("msg", msg);

		}
		log.debug("output current : " + params.get("currentPage"));
		mv.addObject("searchType", params.get("searchType"));
		mv.addObject("searchText", params.get("searchText"));
		mv.addObject("currentPage", params.get("currentPage"));

		mv.addObject("board", article);				
		mv.setViewName("board/read");
		return mv;*/
		ModelAndView mv = new ModelAndView();
		int typeSeq = Integer.parseInt(params.get("typeSeq"));
		int boardSeq = Integer.parseInt(params.get("boardSeq"));
		Map<String, Object> article = nService.read(typeSeq, boardSeq);
		/*
		mv.addObject("title", article.get("title"));
		mv.addObject("memberNick", article.get("member_nick"));
		mv.addObject("createDate", article.get("create_date"));
		mv.addObject("hits", article.get("hits"));
		mv.addObject("contents", article.get("content"));				
		mv.setViewName("board/read");
		return mv;
		 */
		//int boardSeq = Integer.parseInt(params.get("boardSeq"));
		//int typeSeq = Integer.parseInt(params.get("typeSeq"));

		//첨부파일이 1이면
		if(article.get("has_file").equals("1")) {
			mv.addObject("files", nService.readAttached(typeSeq, boardSeq));
			log.debug("show"+nService.readAttached(typeSeq, boardSeq));
		}
		
		
		String msg = params.get("msg");
		if(msg !=null) {
			mv.addObject("msg", msg);

		}
		mv.addObject("board", article);				
		mv.setViewName("notice/read");
		return mv;
	}

	@RequestMapping("/notice/deleteOld.do")
	public ModelAndView deleteOld(@RequestParam int typeSeq, @RequestParam int boardSeq, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		if(session.getAttribute("memberId")!=null) {
			RedirectView rv;


			int result = nService.delete(typeSeq, boardSeq);
			String url = "";

			if (result != 1) {
				url = contextRoot+"/notice/read.do?boardSeq=";
				url += boardSeq+"&typeSeq="+typeSeq;
				rv = new RedirectView(url);
				mv.setView(rv);
				mv.addObject("msg", "삭제 실패! 관리자에게 따지세요.");
			}else {
				rv = new RedirectView(contextRoot+"/notice/nList.do");
				mv.addObject("msg", "삭제되었슴당.");
				mv.setView(rv);

			}

		}else {
			mv.addObject("msg", "로그인하세요.");
			mv.addObject("nextLocation", "/index.do");
			mv.setViewName("common/error");

		}
		return mv;
	}
	@ResponseBody
	@RequestMapping("/notice/delete.do")
	public int delete(@RequestParam int typeSeq, @RequestParam int boardSeq, HttpSession session) {
		//@RequestParam int typeSeq, @RequestParam int boardSeq, 
		//@RequestParam HashMap<String, Object> params,
		//int typeSeq = (int)params.get("typeSeq");
		//int boardSeq = (int)params.get("boardSeq");
		log.debug("show call delete:"+typeSeq+boardSeq);
		int result=0;
		if(session.getAttribute("memberId")!=null) {
			result = nService.delete(typeSeq, boardSeq);
			String url = "";

			if (result != 1) {
				url = contextRoot+"/notice/read.do?boardSeq=";
				url += boardSeq+"&typeSeq="+typeSeq;
				//rv = new RedirectView(url);
				//mv.setView(rv);
				//mv.addObject("msg", "삭제 실패! 관리자에게 따지세요.");
			}else {
				//rv = new RedirectView(contextRoot+"/notice/fList.do");
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
	
	@ResponseBody
	@RequestMapping("/notice/goUpdateN.do")
	public ModelAndView goUpdateN() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("board/update");
		
		return mv;
	}
	@RequestMapping("/notice/goUpdate.do")
	public ModelAndView goUpdate(@RequestParam int typeSeq, @RequestParam int boardSeq, HttpSession session) {
		log.debug("/notice/goUpdate.do params : "+typeSeq);
		log.debug("/notice/goUpdate.do params : "+boardSeq);
		ModelAndView mv = new ModelAndView();
		if(session.getAttribute("memberId")!=null) {
			Map<String, Object> article = nService.read(typeSeq, boardSeq);
			mv.addObject("board", article);
			mv.setViewName("notice/update");
			//첨부파일이 1이면
			if(article.get("has_file").equals("1")) {
				mv.addObject("files", nService.readAttached(typeSeq, boardSeq));
				log.debug("show"+nService.readAttached(typeSeq, boardSeq));
			}
		}else {//로그인이 아닐 시,
			mv.addObject("msg", "로그인하세요.");
			mv.addObject("nextLocation", "/index.do");
			mv.setViewName("common/error");
		}
		
		
		return mv;
	}

	@ResponseBody
	@RequestMapping("/notice/update.do")
	public int update(@RequestParam HashMap<String, Object> params, HttpSession session, MultipartHttpServletRequest mReq) {
		//ModelAndView mv = new ModelAndView();
		log.debug("show call Update"+params);
		log.debug("show call Update"+mReq);

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
		
		int result = nService.update(params, mFiles);
		log.debug("show call Update"+result);
		
		//mv.setViewName("");
		//RedirectView rv = new RedirectView(contextRoot+"/notice/read.do");

		//mv.addObject("typeSeq", params.get("typeSeq"));
		//mv.addObject("boardSeq", params.get("boardSeq"));
		//mv.setView(rv);
		return result;
	}

	@ResponseBody
	@RequestMapping("/notice/download.do")
	public byte[] download(@RequestParam int fileIdx, HttpServletResponse resp) {
		log.debug("/notice/download.do params :" + fileIdx);
		//첨부파일을 가져온다.  //여러개를 가져온다.
		//BoardAttachService/구현체, PK로 select하는 sql.
		Map<String, Object> attach = aService.getAttach(fileIdx);
		byte[] b = null;
		String encodingName = null;
		if(attach == null) { //지워짐
		} else { 
			//한글 파일명 인코딩
			try {
				encodingName = java.net.URLEncoder.encode(attach.get("file_name").toString(), "UTF-8" );  //인코딩한 이름
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}System.out.println("show"+encodingName);
			System.out.println("show"+attach.get("file_name").toString());
			//첨부파일 정보를 토대로 파일을 읽어온다.
			b = fUtil.readFile(attach);
			// 돌려보내기 위해 정보를 입력
			log.debug("###################### :" + b);
			// 파일 다운로드를 할 수 있는 정보들을 브라우저에 알려주는 역할
			resp.setHeader("Content-Disposition", "attachment; file_name=\"" + encodingName + "\"");
			resp.setContentType(String.valueOf(attach.get("file_type")));
			resp.setHeader("Pragma", "no-cache");
			resp.setHeader("Cache_Control","no-cache");
			String tmp = String.valueOf(attach.get("file_size"));
			resp.setContentLength(Integer.parseInt(tmp));
		}
		return b;
	}
	
	@ResponseBody
	@RequestMapping("/notice/deleteAttach.do")
	public int deleteAttach(@RequestParam int fileIdx, @RequestParam int boardSeq, @RequestParam int typeSeq) {
		//ModelAndView mv = new ModelAndView();
		//삭제가 되든 안되든 update.do로 리다이렉트
		//RedirectView rv = new RedirectView(contextRoot+"/notice/goUpdate.do?boardSeq="+ boardSeq+"&typeSeq=" +typeSeq);
		//mv.setView(rv);
		log.debug("show call delAtt"+fileIdx+boardSeq+typeSeq);
		int result = aService.deleteAttach(fileIdx, boardSeq, typeSeq);
		return result;
	}
}
