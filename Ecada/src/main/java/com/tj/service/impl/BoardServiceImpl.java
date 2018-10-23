package com.tj.service.impl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.tj.dao.AttachDao;
import com.tj.dao.BoardDao;
import com.tj.dao.ReplyDao;
import com.tj.service.BoardService;
import com.tj.util.FileUtil;

@Service
public class BoardServiceImpl implements BoardService{
	private Logger log = Logger.getLogger(BoardServiceImpl.class);
	@Autowired BoardDao bDao;
	@Autowired AttachDao aDao;
	@Autowired ReplyDao rDao;
	@Autowired FileUtil fUtil;
	
	@Override
	public ArrayList<HashMap<String, Object>> list(HashMap<String, String> params) {
		return bDao.list(params);
	}

	@Override
	public int getTotalArticleCnt(HashMap<String, String> params) {
		return bDao.getTotalArticleCnt(params);
	}

	@Override
	public int write(HashMap<String, Object> params, List<MultipartFile> mFiles) {
		//1. 글 등록
		log.debug("show serv"+params);
		int result = bDao.write(params);
		log.debug("show result"+result);
		System.out.println("show boardSeq : "+params.get("boardSeq"));

		//2. 첨부파일이 있으면 board_attach 테이블에 등록
		for(MultipartFile mf : mFiles) {
			if(!mf.getOriginalFilename().equals("")) {
				//난수를 만들어 가짜 이름으로 사용..
				params.put("fileName", mf.getOriginalFilename());
				String fakeName = UUID.randomUUID().toString().replace("-", "");
				params.put("fakeName", fakeName);
				params.put("fileSize", mf.getSize());
				params.put("fileType", mf.getContentType());
				
				
				try {
					String saveLoc = fUtil.copyFile(mf, fakeName);
					params.put("saveLoc", saveLoc);
					aDao.fileAttach(params);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return result;
	}
	
	@Override
	public int writeMap(HashMap<String, String> params) {
		// TODO Auto-generated method stub
		return bDao.writeMap(params);
		
	}
	
	@Override
	public Map<String, Object> read(int typeSeq, int boardSeq) {
		// TODO Auto-generated method stub
		bDao.updateHits(typeSeq, boardSeq);
		return bDao.getBoard(typeSeq, boardSeq);
	}

	@Override
	public int delete(int typeSeq, int boardSeq) {
		System.out.println("show : " +typeSeq + boardSeq);
		if(aDao.fileSelect(typeSeq, boardSeq)!=null) {
			List<HashMap<String, Object>> fileSelect = aDao.fileSelect(typeSeq, boardSeq);
			for(HashMap<String, Object> file : fileSelect) {
				fUtil.deleteFile(file); //물리적 위치의  파일을 삭제 시긴다. 
			}
			//글번호, 타입으로 첨부파일을 삭제하는 DAO 메서드 호출
			aDao.delete(typeSeq, boardSeq); 
		}
		if(rDao.replyCnt(typeSeq, boardSeq) != 0) {
			rDao.delReply(typeSeq, boardSeq);										
		}
		int del = bDao.delete(typeSeq, boardSeq); 
		return del;
	}

	@Override
	public int update(HashMap<String, Object> params, List<MultipartFile> mFiles) {
		//1. 글 등록
		log.debug("show serv"+params);
		int result = bDao.update(params);
		log.debug("show result"+result);
		System.out.println("show boardSeq : "+params.get("boardSeq"));
		//2. 첨부파일이 있으면 board_attach 테이블에 등록
		
		for(MultipartFile mf : mFiles) {
			if(!mf.getOriginalFilename().equals("")) {
				//난수를 만들어 가짜 이름으로 사용..
				params.put("fileName", mf.getOriginalFilename());
				String fakeName = UUID.randomUUID().toString().replace("-", "");
				params.put("fakeName", fakeName);
				params.put("fileSize", mf.getSize());
				params.put("fileType", mf.getContentType());
				
				
				try {
					String saveLoc = fUtil.copyFile(mf, fakeName);
					params.put("saveLoc", saveLoc);
					aDao.fileAttach(params);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return result;		
		// TODO Auto-generated method stub
		//return bDao.update(params);

	}

	@Override
	public List<Map<String, Object>> readAttached(int typeSeq, int boardSeq) {
		// TODO Auto-generated method stub
		return aDao.readAttached(typeSeq, boardSeq);
	}
}
