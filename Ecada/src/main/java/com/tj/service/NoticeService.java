package com.tj.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

public interface NoticeService {

	public ArrayList<HashMap<String, Object>> list(HashMap<String, String> params);
	
	public int getTotalArticleCnt(HashMap<String, String> params);
	
	public int write(HashMap<String, Object> params, List<MultipartFile> mFiles);
	
	public Map<String, Object> read(int typeSeq, int boardSeq);

	public int delete(int typeSeq, int boardSeq);

	public int update(HashMap<String, Object> params, List<MultipartFile> mFiles);

	int writeMap(HashMap<String, String> params);
	
	public List<Map<String, Object>> readAttached(int typeSeq, int boardSeq);

}
