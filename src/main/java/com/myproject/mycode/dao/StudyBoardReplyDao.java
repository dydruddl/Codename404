package com.myproject.mycode.dao;

import java.util.List;

import com.myproject.mycode.model.StudyBoardReply;

public interface StudyBoardReplyDao {

	List<StudyBoardReply> studyList(int study_no);

	void repStudyInsert(StudyBoardReply sbr);

	void studyUpdate(StudyBoardReply sbr);

	void studyDelete(int study_no);

}
