package com.tj.test.app;

import java.util.HashMap;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.tj.dto.Member;
import com.tj.service.BoardService;
import com.tj.service.MemberService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
		//"file:src/main/resources-common/applicationContext-bean.xml",
		//"file:src/main/resources-common/applicationContext-datasource.xml",
		"file:src/main/resources-common/applicationContext*.xml"
})
public class BoardTestApp { // 컨트롤러를 대신한다.

	@Autowired	BoardService bServ;
	@Autowired	MemberService mServ;
	
	@Test
	public void writeTest() { // *.do 에 대응되는 메서드
		// 웹에서 전송될 데이터를 유추해서 파라미터 생성
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("typeSeq", "2");
		params.put("memberId", "darkonyx");
		params.put("memberIdx", "1");
		params.put("memberNick", "hong");
		params.put("title", "test title");
		params.put("content", "test content");
		
		Assert.assertEquals(1, bServ.writeMap(params));
		Member member = null;
		try {	
			member = mServ.login("aa", "bb");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Assert.assertNotNull(member);
	}
}
