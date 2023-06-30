package com.myproject.mycode.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myproject.mycode.dao.QnaBoardDao;
import com.myproject.mycode.model.QnaBoard;

@Service
public class QnaBoardService {

	@Autowired
	private QnaBoardDao qbd;


	public QnaBoard select(int qna_no) {
		// TODO Auto-generated method stub
		return qbd.select(qna_no);
	}



	public int insert(QnaBoard qnaBoard) {
		// TODO Auto-generated method stub
		return qbd.insert(qnaBoard);
	}



	public int getCount(QnaBoard qnaBoard) {
		// TODO Auto-generated method stub
		return qbd.getCount(qnaBoard);
	}



	public void updateRe(int qna_no) {
		// TODO Auto-generated method stub
		qbd.updateRe(qna_no);
	}



	public int update(QnaBoard qnaBoard) {
		// TODO Auto-generated method stub
		return qbd.update(qnaBoard);
	}





	// 전체 목록
	public List<QnaBoard> list(QnaBoard qnaBoard) {
		// TODO Auto-generated method stub
		return qbd.list(qnaBoard);
	}
	
	// 해결 목록
	public List<QnaBoard> solist(QnaBoard qnaBoard){
		return qbd.solist(qnaBoard);
	}
	
	// 미해결 목록


	public int delete(int qna_no) {
		// TODO Auto-generated method stub
		return qbd.delete(qna_no);
	}



	public int solnum(QnaBoard qnaBoard) {
		// TODO Auto-generated method stub
		return qbd.solnum(qnaBoard);
	}



	public int unsolnum(QnaBoard qnaBoard) {
		// TODO Auto-generated method stub
		return qbd.unsolnum(qnaBoard);
	}



	public List<QnaBoard> unsolist(QnaBoard qnaBoard) {
		// TODO Auto-generated method stub
		return qbd.unsolist(qnaBoard);
	}



	public int getSingoCount(int qna_no, int category_no, String member_nick) {
		// TODO Auto-generated method stub
		return qbd.getSingoCount(qna_no, category_no, member_nick);
	}



	public void updateQnaSingo(int qna_no) {
		// TODO Auto-generated method stub
		qbd.updateQnaSingo(qna_no);
	}



	public void singoQnadelete(int qna_no, int category_no) {
		// TODO Auto-generated method stub
		qbd.singoQnadelete(qna_no, category_no);
	}



	


}
