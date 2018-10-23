package com.tj.service.impl;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tj.dao.MemberDao;
import com.tj.service.MailService;

@Service
public class MailServiceImpl implements MailService{

	@Autowired MemberDao mDao;
	
	@Override
	public void compareEmail(String email, String userId) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void resetPw(HashMap<String, String> params) {
		// TODO Auto-generated method stub
		mDao.resetPw(params);
	}

}
