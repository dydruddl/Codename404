package com.myproject.mycode.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myproject.mycode.dao.NoticeReplyDao;
import com.myproject.mycode.model.NoticeReplyModel;

@Service
public class NoticeReplyService {

	@Autowired NoticeReplyDao replydao;

	public List<NoticeReplyModel> getReplyList(int notice_no) {
		// TODO Auto-generated method stub
		return replydao.getReplyList(notice_no);
	}
	
	public void noticeRepInsert(NoticeReplyModel noticereplyDto) {
		// TODO Auto-generated method stub
		replydao.noticeRepInsert(noticereplyDto);
	}

	public void noticeRepUpdate(NoticeReplyModel noticereplyDto) {
		// TODO Auto-generated method stub
		replydao.noticeRepUpdate(noticereplyDto);
	}

	public void noticeRepDelete(int notice_rno) {
		// TODO Auto-generated method stub
		replydao.noticeRepDelete(notice_rno);
	}
	
	
}