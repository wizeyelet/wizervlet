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

import com.tj.service.AttachService;
import com.tj.service.BoardService;
import com.tj.service.ReplyService;
import com.tj.util.FileUtil;

@Controller
public class BoardController {
	@Value("#{config['site.context.path']}")
	private String contextRoot;
	private Logger log = Logger.getLogger(BoardController.class);

	@Autowired BoardService bService;
	@Autowired AttachService aService;
	@Autowired ReplyService rService;
	@Autowired FileUtil fUtil;
	
	/**
	 * 자유게시판 리스트 불러오기
	 * @param 현재 페이지 정보, 
	 * @return 현재 페이지에 해당하는 게시물 테이블
	 */
	@ResponseBody
	@RequestMapping("/free/fList.do")
	public ModelAndView goLogin(@RequestParam HashMap<String, String> params){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/list");
		log.debug("show list"+params);
		
		
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
		
		ArrayList<HashMap<String, Object>> list = bService.list(params);
		
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
	@RequestMapping("/free/goWrite.do")
	public ModelAndView goWrite() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("board/write");
		
		return mv;
	}

	/**
	 * 사용자가 작성한 게시물을 DB에 저장
	 * @param 작성된 게시물의 정보들을 받아온다.
	 * @return 글 목록으로 돌아간다.
	 */
	@ResponseBody
	@RequestMapping("/free/write.do")
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
		
		//RedirectView rv = new RedirectView("/ecada/free/fList.do");
		//mv.setView(rv);
		return bService.write(params, mFiles);
	}


	@RequestMapping("/free/read.do")
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
		Map<String, Object> article = bService.read(typeSeq, boardSeq);
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
			mv.addObject("files", bService.readAttached(typeSeq, boardSeq));
			log.debug("show"+bService.readAttached(typeSeq, boardSeq));
		}
		
		
		String msg = params.get("msg");
		if(msg !=null) {
			mv.addObject("msg", msg);

		}
		//String contents = params.get("content").toString();
		//contents = contents.replaceAll("<br/>", "\r");
		
		
		//댓글
		int cnt=rService.replyCnt(typeSeq, boardSeq);
		mv.addObject("replyCnt", cnt);
		log.debug("show reply ready : "+typeSeq+boardSeq);
		log.debug("show reply ready : "+cnt);
		ArrayList<HashMap<String, Object>> reply=null;
		if(cnt != 0) {
		reply = rService.getReply(typeSeq, boardSeq);
		mv.addObject("comment", reply);				
		log.debug("show reply"+reply.get(0).get("content"));
		}
		mv.addObject("board", article);				
		mv.setViewName("board/read");
		return mv;
	}

	@RequestMapping("/free/deleteOld.do")
	public ModelAndView deleteOld(@RequestParam int typeSeq, @RequestParam int boardSeq, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		if(session.getAttribute("memberId")!=null) {
			RedirectView rv;


			int result = bService.delete(typeSeq, boardSeq);
			String url = "";

			if (result != 1) {
				url = contextRoot+"/free/read.do?boardSeq=";
				url += boardSeq+"&typeSeq="+typeSeq;
				rv = new RedirectView(url);
				mv.setView(rv);
				mv.addObject("msg", "삭제 실패! 관리자에게 따지세요.");
			}else {
				rv = new RedirectView(contextRoot+"/free/fList.do");
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
	@RequestMapping("/free/delete.do")
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
				url = contextRoot+"/free/read.do?boardSeq=";
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
	
	@ResponseBody
	@RequestMapping("/free/goUpdateN.do")
	public ModelAndView goUpdateN() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("board/update");
		
		return mv;
	}
	@RequestMapping("/free/goUpdate.do")
	public ModelAndView goUpdate(@RequestParam int typeSeq, @RequestParam int boardSeq, HttpSession session) {
		log.debug("/free/goUpdate.do params : "+typeSeq);
		log.debug("/free/goUpdate.do params : "+boardSeq);
		ModelAndView mv = new ModelAndView();
		if(session.getAttribute("memberId")!=null) {
			Map<String, Object> article = bService.read(typeSeq, boardSeq);
			String content = article.get("content").toString();
			content = content.replaceAll("<br/>", "");
			article.put("content", content);
			mv.addObject("board", article);
			mv.setViewName("board/update");
			//첨부파일이 1이면
			if(article.get("has_file").equals("1")) {
				mv.addObject("files", bService.readAttached(typeSeq, boardSeq));
				log.debug("show"+bService.readAttached(typeSeq, boardSeq));
			}
		}else {//로그인이 아닐 시,
			mv.addObject("msg", "로그인하세요.");
			mv.addObject("nextLocation", "/index.do");
			mv.setViewName("common/error");
		}
		
		
		return mv;
	}

	@ResponseBody
	@RequestMapping("/free/update.do")
	public int update(@RequestParam HashMap<String, Object> params, HttpSession session, MultipartHttpServletRequest mReq) {
		//ModelAndView mv = new ModelAndView();
		log.debug("show call Update"+params);
		log.debug("show call Update"+mReq);

		//attach File
		//mReq.getMultiFileMap();
		List<MultipartFile> mFiles = null;
		if(!params.get("hasFile").equals(1)) {
			mFiles =mReq.getFiles("attFile");
			for(MultipartFile mf : mFiles) {
				if(!mf.getOriginalFilename().equals("")) {
					params.put("hasFile", "1");
					break;
				} else params.put("hasFile", "0");
				System.out.println("show name : "+mf.getOriginalFilename());
				System.out.println("show type : "+mf.getContentType());
				System.out.println("show size : "+mf.getSize());
			}
		}
		String contents = params.get("contents").toString();
		contents = contents.replaceAll("\r", "<br/>");
		//contents = contents.replaceAll("\n", "<br/>");
		//contents = contents.replaceAll("\\r\\n", "<br/>");
		//params.put("contents", contents);
		params.put("contents", contents);
		
		int result = bService.update(params, mFiles);
		log.debug("show call Update"+result);
		
		//mv.setViewName("");
		//RedirectView rv = new RedirectView(contextRoot+"/free/read.do");

		//mv.addObject("typeSeq", params.get("typeSeq"));
		//mv.addObject("boardSeq", params.get("boardSeq"));
		//mv.setView(rv);
		return result;
	}

	/**
	 * read.jsp에서 fileIdx:file_idx값을 가져오며 실행
	 * 
	 * @param fileIdx
	 * @param resp
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/free/download.do")
	public byte[] download(@RequestParam int fileIdx, HttpServletResponse resp) {
		log.debug("/free/download.do params :" + fileIdx);
		//첨부파일을 가져온다.  //여러개를 가져온다.
		//BoardAttachService/구현체, PK로 select하는 sql.
		Map<String, Object> attach = aService.getAttach(fileIdx);//저장정보를 한 줄 가져왔다. 여러개일 경우 List. 매개변수도 보드 일련번호를 넣어야 한다.
		//현재 쿼리로는 db상의 컬럼명을 키값으로 가져온다. 
		
		byte[] b = null;//바이트 단위로 쪼갠 파일을 넣을 배열 선언
		String encodingName = null;//파일명이 한글일 경우 인코딩해서 넣어줄 이름
		if(attach == null) { //DB에 첨부파일 정보가 없을시엔 null을 반환.
		} else { //파일이 있다면,
			//한글 파일명 인코딩
			try {
				encodingName = java.net.URLEncoder.encode(attach.get("file_name").toString(), "UTF-8" );  //인코딩한 이름
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("show"+encodingName);
			System.out.println("show"+attach.get("file_name").toString());
			System.out.println("show"+String.valueOf(attach.get("file_type")));

			//첨부파일 정보를 토대로 파일을 읽어온다.
			b = fUtil.readFile(attach);//파일은 여기서 이미 불러들였고, 내용이 있는 상태이다.
			// 돌려보내기 위해 정보를 입력
			log.debug("###################### :" + b);
			log.debug("show"+attach.get("file_name").toString());
			log.debug("show"+String.valueOf(attach.get("file_type")));
			
			// 파일 다운로드를 할 수 있는 정보들을 브라우저에 알려주는 역할
			resp.setHeader("Content-Disposition", "attachment; filename=\"" + encodingName + "\"");
			resp.setContentType(String.valueOf(attach.get("file_type")));
			resp.setHeader("Pragma", "no-cache");
			resp.setHeader("Cache_Control","no-cache");
			String tmp = String.valueOf(attach.get("file_size"));
			resp.setContentLength(Integer.parseInt(tmp));
		}
		return b;
	}
	
	@ResponseBody
	@RequestMapping("/free/deleteAttach.do")
	public int deleteAttach(@RequestParam int fileIdx, @RequestParam int boardSeq, @RequestParam int typeSeq) {
		//ModelAndView mv = new ModelAndView();
		//삭제가 되든 안되든 update.do로 리다이렉트
		//RedirectView rv = new RedirectView(contextRoot+"/free/goUpdate.do?boardSeq="+ boardSeq+"&typeSeq=" +typeSeq);
		//mv.setView(rv);
		log.debug("show call delAtt"+fileIdx+boardSeq+typeSeq);
		int result = aService.deleteAttach(fileIdx, boardSeq, typeSeq);
		return result;
	}
}
