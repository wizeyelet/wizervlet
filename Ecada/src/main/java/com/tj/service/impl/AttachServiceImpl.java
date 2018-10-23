package com.tj.service.impl;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tj.dao.AttachDao;
import com.tj.dao.BoardDao;
import com.tj.service.AttachService;

@Service
public class AttachServiceImpl implements AttachService{
	@Autowired AttachDao baDao;
	@Autowired BoardDao bDao;
	
	@Value("#{config['project.file.upload.location']}")//ini에서 지정했다.
	private String saveLocation;
	
	@Override
	public Map<String, Object> getAttach(int fileIdx) {
		// TODO Auto-generated method stub
		return baDao.getAttach(fileIdx);
	}

	@Override
	public int deleteAttach(int fileIdx, int boardSeq, int typeSeq) {
		// TODO Auto-generated method stub
		bDao.attachDeleted(boardSeq, typeSeq);
		return baDao.deleteAttach(fileIdx);
	}

	@Override
	public int updateUnlinkedInfo2() {
		// TODO Auto-generated method stub
		//1.첨부파일 정보 다 가져오기
		ArrayList<HashMap<String, Object>> targets = baDao.allSelect();
		//2.파일 유무 확인
		ArrayList<Integer> fileIdxs = new ArrayList<Integer>();
		for(HashMap<String, Object> target : targets) {
			String fakeFilename = String.valueOf(target.get("fake_filename"));
			File f = new File(saveLocation, fakeFilename);
		
		//2-1 없으면 컬럼(linked) 값 수정
			if(!f.exists()) {
				int fileIdx = Integer.parseInt(String.valueOf(target.get("file_idx")));
				fileIdxs.add(fileIdx);
				//1건씩
//				aDao.unlinkedCheck(target);
			}
		}
		//한꺼번에 업데이트
		int result = 0;
		if(fileIdxs.size() > 0)
			result = baDao.unlinkedCheckPower(fileIdxs);
		return result;
	}
	
	@Override
	@Transactional(rollbackFor= {Exception.class})
	public int updateUnlinkedInfo() {
		ArrayList<HashMap<String, Object>> targets = null;
		try {
			targets = baDao.findUnlinkedAttach();
			
			HashMap<String, Object> p = new HashMap<String, Object>();
			p.put("seqs", targets);
			if(targets.size() > 0) {
				baDao.updateHasFileInfo(p);
				baDao.insertBatchResult(targets.size());
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return targets==null?0:targets.size();
	}

}
