package com.tj.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tj.dao.ReplyDao;
import com.tj.service.ReplyService;

@Service
public class ReplyServiceImpl implements ReplyService{
	private Logger log = Logger.getLogger(ReplyServiceImpl.class);
	@Autowired ReplyDao rDao;

	@Override
	public int write(HashMap<String, Object> params) {
		// TODO Auto-generated method stub		
		return rDao.write(params);
	}

	@Override
	public ArrayList<HashMap<String, Object>> getReply(int typeSeq, int boardSeq) {
		// TODO Auto-generated method stub
		return rDao.getReply(typeSeq, boardSeq);
	}

	@Override
	public int replyCnt(int typeSeq, int boardSeq) {
		// TODO Auto-generated method stub
		log.debug("show cnt : "+rDao.replyCnt(typeSeq, boardSeq));
		return rDao.replyCnt(typeSeq, boardSeq);
	}

	@Override
	public int delete(int replySeq) {
		// TODO Auto-generated method stub
		return rDao.delete(replySeq);
	}

}
