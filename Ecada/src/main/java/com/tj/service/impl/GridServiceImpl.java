package com.tj.service.impl;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tj.dao.GridDao;
import com.tj.service.GridService;

@Service
public class GridServiceImpl implements GridService{
@Autowired private GridDao gDao;

@Override
public ArrayList<HashMap<String, Object>> gList(HashMap<String, String> params) {
	// TODO Auto-generated method stub
	return gDao.gList(params);
}

@Override
public int getTotalCount(HashMap<String, String> params) {
	// TODO Auto-generated method stub
	return gDao.getTotalCount(params);
}
}
