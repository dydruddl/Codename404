package com.myproject.mycode.dao;

import java.util.List;

import com.myproject.mycode.model.NoticeReplyModel;

public interface NoticeReplyDao {

	List<NoticeReplyModel> getReplyList(int notice_no);
	
	public void noticeRepInsert(NoticeReplyModel noticereplyDto);

	public void noticeRepUpdate(NoticeReplyModel noticereplyDto);

	public void noticeRepDelete(int notice_rno);
	
	

}
