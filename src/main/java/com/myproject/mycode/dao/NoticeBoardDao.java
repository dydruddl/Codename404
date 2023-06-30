package com.myproject.mycode.dao;

import java.util.List;
import com.myproject.mycode.model.NoticeBoardModel;


public interface NoticeBoardDao {
	
	public List<NoticeBoardModel> noticeList(NoticeBoardModel noticeBoardDTO) ;

	public int getNoticeBoardCount(NoticeBoardModel noticeBoardDTO);
	
	public void noticeInsert(NoticeBoardModel noticeBoardDTO);
	
	// 조회수증가
	public void updateRe(int notice_no);
	
	// 상세정보
	public NoticeBoardModel noticeView(int notice_no);

	// 수정
	public void noticeUpdate(NoticeBoardModel noticeBoardDTO);
	
	public void noticeDelete(NoticeBoardModel noticeBoardDTO);
}

