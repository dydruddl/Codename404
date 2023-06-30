package com.myproject.mycode.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myproject.mycode.dao.QnaBoardDao;
import com.myproject.mycode.dao.QnaBoardReplyDao;
import com.myproject.mycode.model.QnaBoardReply;

@Service
public class QnaBoardReplyService {
	
	@Autowired
	private QnaBoardReplyDao dao;	

	public List<QnaBoardReply> list(int qna_no) {
		// TODO Auto-generated method stub
		return dao.list(qna_no);
	}

	public void insert(QnaBoardReply qbr) {
		// TODO Auto-generated method stub
		dao.insert(qbr);
	}

	public void update(QnaBoardReply qbr) {
		// TODO Auto-generated method stub
		dao.update(qbr);
		
	}

	public void delete(int qna_bno) {
		// TODO Auto-generated method stub
		dao.delete(qna_bno);
	}

	public int rsUpdate(int qna_rno) {
		// TODO Auto-generated method stub
		return dao.rsUpdate(qna_rno);
	}

	public int solupdate(int qna_no) {
		// TODO Auto-generated method stub
		return dao.solupdate(qna_no);
	}
	
	public int solcancel(int qna_no) {
		// TODO Auto-generated method stub
		return dao.solcancel(qna_no);
	}

	public void insertRenum(int qna_bno) {
		// TODO Auto-generated method stub
		dao.insertRenum(qna_bno);
	}
	
	public int rsCancel(int qna_rno) {
		// TODO Auto-generated method stub
		return dao.rsCancel(qna_rno);
	}

	public void deleteRenum(int qna_bno) {
		// TODO Auto-generated method stub
		dao.deleteRenum(qna_bno);
	}

}
