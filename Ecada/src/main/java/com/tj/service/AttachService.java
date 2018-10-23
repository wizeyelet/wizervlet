package com.tj.service;

import java.util.Map;

public interface AttachService {
	
	public Map<String, Object> getAttach(int fileIdx);
	
	public int deleteAttach(int fileIdx, int boardSeq, int typeSeq);

	/**
	 * 첨부파일 테이블에 있는 정보와 물리적 파일간의
	 * 링크가 끊어진 데이터를 찾아서 특정 컬럼에 표시함.
	 * @return
	 */
	public int updateUnlinkedInfo();

	int updateUnlinkedInfo2();
}
