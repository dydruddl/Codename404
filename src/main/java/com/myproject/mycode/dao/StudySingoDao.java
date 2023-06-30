package com.myproject.mycode.dao;

import com.myproject.mycode.model.ReportReasonModel;
import com.myproject.mycode.model.StudyBoard;


public interface StudySingoDao {

	public int findSameSingo(int category_no, int study_no);

	public void updateSingoBoardCount(int category_no, int study_no);

	public void singoBoardInsert(StudyBoard studydto);

	public int getSingoNo(int category_no, int study_no);

	public void reportReasonInsert(StudyBoard studydto, int singo_no, ReportReasonModel reportreasonDto);
}
