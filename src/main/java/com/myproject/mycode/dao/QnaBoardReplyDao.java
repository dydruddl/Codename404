package com.myproject.mycode.dao;

import java.util.List;

import com.myproject.mycode.model.QnaBoardReply;

public interface QnaBoardReplyDao {

	List<QnaBoardReply> list(int qna_no);

	void insert(QnaBoardReply qbr);

	void update(QnaBoardReply qbr);

	void delete(int qna_bno);

	int rsUpdate(int qna_rno);
	
	int rsCancel(int qna_rno);

	int solupdate(int qna_no);
	
	int solcancel(int qna_no);

	void insertRenum(int qna_no);

	void deleteRenum(int qna_bno);

	

	

}
