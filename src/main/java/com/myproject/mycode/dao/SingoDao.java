package com.myproject.mycode.dao;

import com.myproject.mycode.model.QnaBoard;
import com.myproject.mycode.model.ReportReasonModel;


public interface SingoDao {

	public int findSameSingo(int category_no, int qna_no);

	public void updateSingoBoardCount(int category_no, int qna_no);

	public void singoBoardInsert(QnaBoard qnadto);

	public int getSingoNo(int category_no, int qna_no);

	public void reportReasonInsert(QnaBoard qnadto, int singo_no, ReportReasonModel reportreasonDto);

}
