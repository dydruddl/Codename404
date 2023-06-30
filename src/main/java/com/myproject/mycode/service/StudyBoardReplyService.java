package com.myproject.mycode.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myproject.mycode.dao.StudyBoardDao;
import com.myproject.mycode.dao.StudyBoardReplyDao;
import com.myproject.mycode.model.StudyBoardReply;

@Service
public class StudyBoardReplyService {
	
	@Autowired
	private StudyBoardReplyDao dao;	

	public List<StudyBoardReply> studyList(int study_no) {
		// TODO Auto-generated method stub
		return dao.studyList(study_no);
	}

	public void repStudyInsert(StudyBoardReply sbr) {
		// TODO Auto-generated method stub
		dao.repStudyInsert(sbr);
	}

	public void studyUpdate(StudyBoardReply sbr) {
		// TODO Auto-generated method stub
		dao.studyUpdate(sbr);
		
	}

	public void studyDelete(int study_no) {
		// TODO Auto-generated method stub
		dao.studyDelete(study_no);
	}

}
