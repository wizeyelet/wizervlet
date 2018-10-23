package com.tj.dao;

import java.util.ArrayList;
import java.util.HashMap;

public interface ReplyDao {

	public int write(HashMap<String, Object> params);

	public ArrayList<HashMap<String, Object>> getReply(int typeSeq, int boardSeq);

	public int replyCnt(int typeSeq, int boardSeq);

	public int delReply(int typeSeq, int boardSeq);

	public int delete(int replySeq);
}
