package com.tj.util;

import java.util.Map;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

public class MailUtil {
	private Logger log = Logger.getLogger(MailUtil.class);
	@Autowired
	AES256Util aes;
	@Autowired private JavaMailSender mailSender;

	public void sendPwEmail(Map<String, String> params) throws Exception {

		MimeMessage msg = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(msg, true);

		msg.setFrom("wizeyelet@gmail.com");
		msg.setRecipient(RecipientType.TO, new InternetAddress(params.get("email")));
		msg.setSubject("potpole.me 에서 보내진 패스워드 변경 메일입니다.");
		msg.setContent(params.get("html"), "text/html; charset=utf-8");

//		helper.setFrom("wizeyelet@gmail.com");
//		helper.setTo(new InternetAddress(params.get("email")));
//		helper.setSubject("To Reset Password (KBH's Portfolio Website)");
//		helper.setText(params.get("html"), true);
		//		helper.setText("<html><body><a href='http://localhost:8080/PortwithDesign/sendConfirm.do' target='_blank'>click</a></body></html>", true);

		log.debug("sendPwEmail \n "+params.get("html"));

		/*
        msg.setFrom(email.getSender());
        msg.setSubject(email.getSubject());
        msg.setText(email.getContent());
        msg.setRecipient(RecipientType.TO , new InternetAddress(email.getReceiver()));
		 */


		mailSender.send(msg);
		log.debug("show send Ok");
	}
}
