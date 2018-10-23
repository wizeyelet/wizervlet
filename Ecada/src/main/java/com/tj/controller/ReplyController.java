package com.tj.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tj.service.ReplyService;

@Controller
public class ReplyController {
	@Value("#{config['site.context.path']}")
	private String contextRoot;
	private Logger log = Logger.getLogger(ReplyController.class);

	@Autowired ReplyService rService;
	
	@ResponseBody
	@RequestMapping("/comment/write.do")
	public int write(@RequestParam HashMap<String, Object> params, HttpSession session) {
		log.debug("show!!"+params);
		log.debug("show Idx : "+session.getAttribute("memberIdx"));
		log.debug("show Idx : "+session.getAttribute("memberId"));
		log.debug("show Idx : "+session.getAttribute("memberNick"));
		
		params.put("memberIdx",session.getAttribute("memberIdx"));
		params.put("memberId",session.getAttribute("memberId"));
		params.put("memberNick",session.getAttribute("memberNick"));
		
		
		String content = params.get("content").toString();
		content = content.replaceAll("\r", "<br/>");
		//contents = contents.replaceAll("\n", "<br/>");
		//contents = contents.replaceAll("\\r\\n", "<br/>");
		//params.put("contents", contents);
		params.put("content", content);
		
		//RedirectView rv = new RedirectView("/ecada/free/fList.do");
		//mv.setView(rv);
		return rService.write(params);
	}
	
	@ResponseBody
	@RequestMapping("/comment/delete.do")
	public int delete(@RequestParam int typeSeq, @RequestParam int boardSeq, @RequestParam int replySeq, HttpSession session) {
		//@RequestParam int typeSeq, @RequestParam int boardSeq, 
		//@RequestParam HashMap<String, Object> params,
		//int typeSeq = (int)params.get("typeSeq");
		//int boardSeq = (int)params.get("boardSeq");
		//log.debug("show call delete:"+typeSeq+boardSeq);
		int result=0;
		if(session.getAttribute("memberId")!=null) {
			result = rService.delete(replySeq);
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
}
