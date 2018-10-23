package com.tj.controller;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.codec.net.URLCodec;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tj.service.MailService;
import com.tj.util.AES256Util;
import com.tj.util.MailUtil;

@Controller
public class MailController {
	@Value("#{config['mail.confirm.url']}")
	private String confirmUrl;
	private Logger log = Logger.getLogger(MailController.class);

	@Autowired private MailUtil mUtil;
	@Autowired private AES256Util aes;
	@Autowired private MailService mService;
	
	@RequestMapping("/mail/goPwChange.do")
	public String goPwChange() {
		return "pwChange";
	}
	
	@RequestMapping("/mail/goEmail.do")
	public String goEmail() {
		return "mail/forgotPw";
	}
	
	
	@RequestMapping("/ckeckEmail.do")
	@ResponseBody
	public HashMap<String, Object> checkEmail(@RequestParam Map<String, String> params){
		log.debug("checkEmail.do params : =====================================" + params );
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/index.do");
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		String email = params.get("email");
		String userId = params.get("userId");
		try {
			log.debug("show try compare");
			mService.compareEmail(email, userId);
		
			
		} catch (Exception e) {

			e.printStackTrace();
			result.put("code", "no");
			result.put("msg", "User id or email does not exist");
			log.debug("show top confirm");
			//mv.addObject("result", result);
			return result;

		}
		
		try {
			log.debug("show try Confirm");
			InputStream is = this.getClass().getResourceAsStream("/html/ConfirmMail.html");  
		    BufferedReader br = new BufferedReader(new InputStreamReader(is)); //eq. scanner
		    StringBuffer sb = new StringBuffer();
		  
		    //email encoding
	
		    //URLCodec codec = new URLCodec();
		    String encEmail = email;//codec.encode(aes.aesEncode(""+email));
		    String encUserId = userId;//codec.encode(aes.aesEncode(""+userId));
		    
		    String line;
		    while ((line = br.readLine()) != null) {
		    	log.debug("show whiles Confirm");
		    		if (line.indexOf("url") != -1) {
		    		log.debug("show if OK!");
		    		line = line.replace("url", 
		    				confirmUrl
		    		+ encEmail+"&userId=" + encUserId + "&resetPw=T");
		    		}log.debug("show else OK!");
//		    		line = line.replace("url", 
//		    				"http://ec2-13-125-225-98.ap-northeast-2.compute.amazonaws.com:8080/PortwithDesign/sendConfirm.do?email="
//		    						+ encEmail+"&userId=" + encUserId);
//		    }
//		    		
		    		sb.append(line);
//		    		System.out.println(line);
		    }
		    log.debug("show close while");
		    br.close();
		    String html = sb.toString();
		    
		    params.put("html", html);
		    
		    
		    mUtil.sendPwEmail(params);
		} catch (Exception e) {
			e.printStackTrace();
			result.put("code", "no");
			result.put("msg", "Sending Message Error");
			log.debug("show mid confirm");
			//mv.addObject("result", result);
			return result;
		}
		result.put("code", "ok");
		result.put("msg", "Please check your email");
		log.debug("show end confirm");
		//mv.addObject("result", result);
		return result;
		
		
	}
	
	
	
	
	
	/**
	 * page, inside of mail, with confirm button
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/sendConfirm.do")
	public ModelAndView checkEmail(@RequestParam HashMap<String, String> params){
		log.debug("show call sendConfirm.do");
		ModelAndView mv = new ModelAndView();
		mv.addObject("userId", params.get("userId"));
		mv.addObject("email", params.get("email"));
		mv.addObject("resetPw", "T");
		//mv.setViewName("mail/resetPw");
		mv.setViewName("index2");
		return mv;
	}
	
	/**
	 * show password after click confirm 
	 * @return
	 */
	@RequestMapping("/resetPassword.do")
	@ResponseBody
	public HashMap<String, String> resetPassword(@RequestParam HashMap<String, String> params) {
		log.debug("resetPassword.do params : =====================================" + params );	
		HashMap<String, String> result = new HashMap<String, String>();
		byte[] b = params.get("memberId").getBytes();
		String t = new String(b);
		log.debug("t1 ---------- " + t);
		
		//change pw
		try {
			  //email decoding
		    URLCodec codec = new URLCodec();
		    log.debug("t2 ---------- " + codec.decode(t));
		    String decUserId = params.get("memberId");//aes.aesDecode(codec.decode(t));
		    log.debug("decode ok ---------- ");
		    params.put("memberId", decUserId);
			
			mService.resetPw(params);
			
		} catch (Exception e) {
			
			e.printStackTrace();
			result.put("code", "no");
			result.put("msg", "Changing password Error");
			return result;
		}
		

		result.put("code", "ok");
		result.put("msg", "Your password has been changed.");
		return result;
		
	}
	
	@ResponseBody
	@RequestMapping("/mail/goResetPw.do")
	public ModelAndView goResetPw(@RequestParam HashMap<String, String> params) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("userId", params.get("userId"));
		mv.addObject("email", params.get("email"));
		mv.addObject("resetPw", params.get("resetPw"));
		mv.setViewName("mail/resetPw");
		return mv;
	}

}
