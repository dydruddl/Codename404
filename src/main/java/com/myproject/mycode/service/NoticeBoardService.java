package com.myproject.mycode.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myproject.mycode.dao.NoticeBoardDao;
import com.myproject.mycode.model.NoticeBoardModel;

@Service
public class NoticeBoardService{
	
	@Autowired
	private NoticeBoardDao boardDao;

	public List<NoticeBoardModel> noticeList(NoticeBoardModel noticeBoardDTO) throws Exception {
		// TODO Auto-generated method stub
		return boardDao.noticeList(noticeBoardDTO);
	}

	public int getNoticeBoardCount(NoticeBoardModel noticeBoardDTO) {
		// TODO Auto-generated method stub
		return boardDao.getNoticeBoardCount(noticeBoardDTO);
	}

	public void noticeInsert(NoticeBoardModel noticeBoardDTO) {
		// TODO Auto-generated method stub
		boardDao.noticeInsert(noticeBoardDTO);;
	}
	
	// 조회수증가
	public void updateRe(int notice_no) {
		// TODO Auto-generated method stub
		boardDao.updateRe(notice_no);
	}
	
	// 상세정보
	public NoticeBoardModel noticeView(int notice_no) {
		NoticeBoardModel noticeBoardDTO = boardDao.noticeView(notice_no);
		
		return noticeBoardDTO;
	}
	
	
	public void noticeUpdate(NoticeBoardModel noticeBoardDTO) {
		// TODO Auto-generated method stub
		boardDao.noticeUpdate(noticeBoardDTO);
		
	}
	
	public void noticeDelete(NoticeBoardModel noticeBoardDTO) {
		boardDao.noticeDelete(noticeBoardDTO);
	}

}
