package com.tj.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public interface MemberDao {
	
	public ArrayList<HashMap<String, Object>> memberList(HashMap<String, Object> params);

	public int join(HashMap<String, String> params);
	
	public int checkId(HashMap<String, String> params);
	
	public HashMap<String, Object> getMemberById(HashMap<String, String> params);
	
	public String makeCipherText(HashMap<String, String> params);
	
	
	public ArrayList<HashMap<String, Object>> mList(Map<String, String> params);

	public int totalMember(Map<String, String> params);

	public int delMember(HashMap<String, String> params);

	public HashMap<String, Object> getMemberData(String memberId);

	public int modifyMemberData(HashMap<String, Object> params);

	public void resetPw(HashMap<String, String> params);
}
