package com.tj.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface AttachDao {

	public void fileAttach(HashMap<String, Object> params);
	
	public List<Map<String, Object>> readAttached(int typeSeq, int boardSeq);
	

	//public void insert(HashMap<String, Object> params);
	
	public int deleteAttach(int fileIdx);
	
	//public void del(int fileIdx);
	
	public Map<String, Object> getAttach(int fileIdx);

	public List<HashMap<String, Object>> fileSelect(int typeSeq, int boardSeq);

	public void delete(int typeSeq, int boardSeq);

	public ArrayList<HashMap<String, Object>> allSelect();

	public void unlinkedCheck(HashMap<String, Object> target);

	public int unlinkedCheckPower(ArrayList<Integer> fileIdx);

	public ArrayList<HashMap<String, Object>> findUnlinkedAttach();

	public void updateHasFileInfo(HashMap<String, Object> p);

	public void insertBatchResult(int size);


}
