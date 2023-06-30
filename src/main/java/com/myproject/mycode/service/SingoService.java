package com.myproject.mycode.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myproject.mycode.dao.SingoDao;
import com.myproject.mycode.model.QnaBoard;
import com.myproject.mycode.model.ReportReasonModel;


@Service
public class SingoService {
	
	@Autowired
	private SingoDao singodao;

	public int findSameSingo(int category_no, int qna_no) {
		// TODO Auto-generated method stub
		return singodao.findSameSingo(category_no,qna_no);
	}

	public void updateSingoBoardCount(int category_no, int qna_no) {
		// TODO Auto-generated method stub
		singodao.updateSingoBoardCount(category_no,qna_no);
	}

	public void singoBoardInsert(QnaBoard qnadto) {
		// TODO Auto-generated method stub
		singodao.singoBoardInsert(qnadto);
	}

	public int getSingoNo(int category_no, int qna_no) {
		// TODO Auto-generated method stub
		return singodao.getSingoNo(category_no,qna_no);
	}

	public void reportReasonInsert(QnaBoard qnadto, int singo_no, ReportReasonModel reportreasonDto) {
		// TODO Auto-generated method stub
		singodao.reportReasonInsert(qnadto,singo_no,reportreasonDto);
	}

}
