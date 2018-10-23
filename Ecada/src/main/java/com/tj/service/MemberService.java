package com.tj.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.tj.dto.Member;
import com.tj.exception.PasswordMissMatchException;
import com.tj.exception.UserNotFoundException;

public interface MemberService {

	public ArrayList<HashMap<String, Object>> memberList(HashMap<String, Object> params);

	public int join(HashMap<String, String> params);
	
	public int checkId(HashMap<String, String> params);
	
	public HashMap<String, Object> login(HashMap<String, String> params) throws UserNotFoundException, PasswordMissMatchException;

	public Member login(String string, String string2);
	
	
	public ArrayList<HashMap<String, Object>> mList(Map<String, String> params);
	
	public int totalMember(HashMap<String, String> params);
	
	public int delMember(HashMap<String, String> params);

	public HashMap<String, Object> getMemberData(String memberId);

	public int modify(HashMap<String, Object> params);
	
	
}
