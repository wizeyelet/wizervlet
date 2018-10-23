package com.tj.test.app;

import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;

import org.apache.log4j.Logger;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.tj.service.BoardService;
import com.tj.service.MemberService;
import com.tj.util.AES256Util;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
		//"file:src/main/resources-common/applicationContext-bean.xml",
		//"file:src/main/resources-common/applicationContext-datasource.xml",
		"file:src/main/resources-common/applicationContext*.xml"
})
public class EncodingTestApp { // 컨트롤러를 대신한다.
	private Logger log = Logger.getLogger(EncodingTestApp.class);
	@Autowired	BoardService bServ;
	@Autowired	MemberService mServ;
	@Autowired	AES256Util aes;	
	
	@Test
	public void Encoding() throws InvalidKeyException, UnsupportedEncodingException, NoSuchAlgorithmException, NoSuchPaddingException, InvalidAlgorithmParameterException, IllegalBlockSizeException, BadPaddingException {
		String str = "darkonyx";
		String encode = aes.aesEncode(str);
		String decode = aes.aesDecode(encode);
		log.debug(encode);
		log.debug(decode);
		Assert.assertEquals(str, decode);
	}

}