package com.tj.service.impl;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tj.dao.VideoDao;
import com.tj.service.VideoService;

@Service
public class VideoServiceImpl implements VideoService{
private Logger log = Logger.getLogger(VideoServiceImpl.class);
	@Autowired VideoDao vDao;
	
	@Override
	public ArrayList<HashMap<String, Object>> list(HashMap<String, String> params) {
		ArrayList<HashMap<String, Object>> list = vDao.list(params);
		
		for(HashMap<String, Object> row : list) {
			String youTube = row.get("linkUrl").toString();
			String playerId = youTube.substring(youTube.lastIndexOf("/")+1);
			row.put("linkUrl", playerId);
			log.debug("show change URL :"+playerId);
			System.out.println("show change URL :"+playerId);
		}
		
		return list;
	}
}
