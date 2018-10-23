package com.tj.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.tj.dto.Board;

public interface BoardDao {
	
	public ArrayList<HashMap<String, Object>> list(HashMap<String, String> params);
	
	public int getTotalArticleCnt(HashMap<String, String> params);

	public int write(HashMap<String, Object> params);
	
	public int updateHits(int typeSeq, int boardSeq);

	public Map<String, Object> getBoard(int typeSeq, int boardSeq);

	public int delete(int typeSeq, int boardSeq);
	
	public int update(HashMap<String, Object> params);

	public int writeMap(HashMap<String, String> params);

	public void attachDeleted(int boardSeq, int typeSeq);
}
