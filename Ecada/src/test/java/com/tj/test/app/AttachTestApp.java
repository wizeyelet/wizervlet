package com.tj.test.app;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.tj.service.AttachService;

/**
 * 스프링은 WAS에서 구동하지만 테스트 환경에서는 WAS를 경유하지 않고 이 클래스가 컨트롤러를 대신한다.
 * @author user
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
		"file:src/main/resources/applicationContext.xml"
})
public class AttachTestApp {

	@Autowired
	AttachService baService;

	@Test
	public void test01() {
		baService.updateUnlinkedInfo();
	}
}
