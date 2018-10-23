package com.tj.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import com.tj.exception.PasswordMissMatchException;
import com.tj.exception.UserNotFoundException;
import com.tj.service.MemberService;

@Controller
public class MemberController {
private Logger log = Logger.getLogger(MemberController.class);
	
	@Autowired
	MemberService mService;
	
	@Value("#{config['site.context.path']}")
	String ctx;
	
	Logger logger = Logger.getLogger(MemberController.class);
	
	@RequestMapping("/member/goLoginPage.do")
	public String goLogin() {
		return "member/login";
	}
	
	@RequestMapping("/member/goRegisterPage.do")
	public String goRegisterPage() {
		return "member/register";
	}
	
	@RequestMapping("/member/checkId.do")
	@ResponseBody
	public HashMap<String, Object> checkId(@RequestParam HashMap<String, String> params){
		logger.debug("/member/checkId.do params : " + params);
		
		int cnt = mService.checkId(params);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("cnt", cnt);
		map.put("msg", cnt==1?"중복된 ID 입니다.":"");
		
		return map;
	}
	
	@RequestMapping("/member/join.do")
	@ResponseBody
	public HashMap<String, Object> join(@RequestParam HashMap<String, String> params){
		logger.debug("/member/join.do params : " + params);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		int cnt = mService.join(params);
		map.put("cnt", cnt);
		map.put("msg", cnt==1?"회원 가입 완료!":"회원 가입 실패!");
		map.put("nextPage", cnt==1?"/member/goLoginPage.do" : "/member/goRegisterPage.do");
		return map;
	}
	
	@RequestMapping("/member/logout.do")
	public ModelAndView logout(HttpSession session){
		session.invalidate();
		ModelAndView mv = new ModelAndView();
		//RedirectView rv = new RedirectView(ctx+"/index.do");
		mv.setViewName("index2");
		
		return mv;
	}
	
	@RequestMapping("/member/login.do")
	@ResponseBody
	public HashMap<String, Object> login(@RequestParam HashMap<String, String> params, HttpSession session){
		logger.debug("/member/login.do params : " + params);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		try {
			HashMap<String, Object> member = mService.login(params);
			session.setAttribute("memberId", member.get("memberId"));
			session.setAttribute("memberNick", member.get("memberNick"));
			session.setAttribute("memberName", member.get("memberName"));
			session.setAttribute("memberType", member.get("typeSeq"));
			session.setAttribute("memberIdx", member.get("memberIdx"));
			
			map.put("nextPage", "/index.do");
		} catch (UserNotFoundException | PasswordMissMatchException e) {
			e.printStackTrace();
			logger.error(e);
			map.put("nextPage", "/index.do");
			map.put("msg", e.getMessage());
		}
		return map;
	}

	@ResponseBody
	@RequestMapping("/member/mList.do")
	public HashMap<String, Object> mList(@RequestParam HashMap<String, String> params){
		logger.debug("show"+params);
		//한 페이지에 보여줄 게시글 수
		int rows = Integer.parseInt(params.get("rows"));
		
		//현재 페이지
		int currentPage = Integer.parseInt(params.get("page"));
		
		//전체 회원수
		int totalMember = mService.totalMember(params);
		
		//DB에 접근하여 게시물 정보를 가져온다.
		int firstIdx = Math.abs((currentPage-1) * rows);		//DB검색에 사용할 현재 블록에 따른 첫번째 게시물 번호 변수
		params.put("startIdx", String.valueOf(firstIdx));
		
		int totalPage = (int)Math.ceil(totalMember/(double)rows);
		
		//DB통신
		ArrayList<HashMap<String, Object>> list = mService.mList(params);
//		List<Map<String, Object>> boardList = bService.viewList(params);
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("page", params.get("page"));//현재페이지
		result.put("total", totalPage);//총페이지수
		result.put("rows", list);//데이터(목록)
		result.put("records", totalMember);//총회원수
		
		return result;		
	}
	
	@ResponseBody
	@RequestMapping("/member/delMember.do")
	public HashMap<String, String> delMember(@RequestParam HashMap<String, String> params) {
		logger.debug("show"+params);
		HashMap<String, String> map = new HashMap<String, String>();
		int cnt=mService.delMember(params);
		map.put("msg", (cnt==1)?"삭제되었습니다.":"삭제 실패!");
		map.put("result", String.valueOf(cnt));
		return map;
	}
	
	@RequestMapping("/member/goModify.do")
	public ModelAndView goModify(HttpSession session) {
		log.debug("/member/goModify.do params : "+session);
		log.debug("/member/goModify.do params : "+session.getAttribute("memberId").toString());
		
		ModelAndView mv = new ModelAndView();
		if(session.getAttribute("memberId")!=null) {
			HashMap<String, Object> member = mService.getMemberData(session.getAttribute("memberId").toString());
			log.debug("show my name : "+member.get("member_seq"));
			mv.addObject("member", member);
			mv.setViewName("member/modify");
										
		}else {//로그인이 아닐 시,
			log.debug("hello? plz login");
			mv.addObject("msg", "로그인하세요.");
			mv.addObject("nextLocation", "/index.do");
			mv.setViewName("common/error");
		}
		
		
		return mv;
	}
	
	@ResponseBody
	@RequestMapping("/member/modify.do")
	public int update(@RequestParam HashMap<String, Object> params, HttpSession session) {
		//ModelAndView mv = new ModelAndView();
		log.debug("show call Mod"+params);
		//log.debug("show call Mod"+mReq);

		int result = mService.modify(params);
		log.debug("show call Mod result"+result);
		
		//mv.setViewName("");
		//RedirectView rv = new RedirectView(contextRoot+"/free/read.do");

		//mv.addObject("typeSeq", params.get("typeSeq"));
		//mv.addObject("boardSeq", params.get("boardSeq"));
		//mv.setView(rv);
		return result;
	}
}
