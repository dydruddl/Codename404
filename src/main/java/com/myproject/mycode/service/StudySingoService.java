package com.myproject.mycode.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myproject.mycode.dao.StudySingoDao;
import com.myproject.mycode.model.ReportReasonModel;
import com.myproject.mycode.model.StudyBoard;


@Service
public class StudySingoService {
 
	@Autowired
	private StudySingoDao singodao;
	
	public int findSameSingo(int category_no, int study_no) {
		// TODO Auto-generated method stub
		return singodao.findSameSingo(category_no,study_no);
	}

	public void updateSingoBoardCount(int category_no, int study_no) {
		// TODO Auto-generated method stub
		singodao.updateSingoBoardCount(category_no,study_no);
	}

	public void singoBoardInsert(StudyBoard studydto) {
		// TODO Auto-generated method stub
		singodao.singoBoardInsert(studydto);
	}

	public int getSingoNo(int category_no, int study_no) {
		// TODO Auto-generated method stub
		return singodao.getSingoNo(category_no,study_no);
	}

	public void reportReasonInsert(StudyBoard studydto, int singo_no, ReportReasonModel reportreasonDto) {
		// TODO Auto-generated method stub
		singodao.reportReasonInsert(studydto,singo_no,reportreasonDto);
	}


}
