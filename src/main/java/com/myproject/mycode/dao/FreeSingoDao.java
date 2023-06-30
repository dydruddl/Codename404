package com.myproject.mycode.dao;

import com.myproject.mycode.model.ReportReasonModel;
import com.myproject.mycode.model.freeboard;


public interface FreeSingoDao {

	public int findSameSingo(int category_no, int free_no);

	public void updateSingoBoardCount(int category_no, int free_no);

	public void singoBoardInsert(freeboard freedto);

	public int getSingoNo(int category_no, int free_no);

	public void reportReasonInsert(freeboard freedto, int singo_no, ReportReasonModel reportreasonDto);

}
