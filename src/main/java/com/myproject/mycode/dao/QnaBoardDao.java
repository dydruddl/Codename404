package com.myproject.mycode.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.myproject.mycode.model.QnaBoard;

@Mapper
public interface QnaBoardDao {

	QnaBoard select(int qna_no);

	int insert(QnaBoard qnaBoard);

	int getCount(QnaBoard qnaBoard);

	void updateRe(int qna_no);

	int update(QnaBoard qnaBoard);

	List<QnaBoard> list(QnaBoard qnaBoard);

	int delete(int qna_no);

	int unsolnum(QnaBoard qnaBoard);

	int solnum(QnaBoard qnaBoard);

	List<QnaBoard> solist(QnaBoard qnaBoard);

	List<QnaBoard> unsolist(QnaBoard qnaBoard);

	public int getSingoCount(int qna_no, int category_no, String member_nick);

	public void updateQnaSingo(int qna_no);

	void singoQnadelete(int qna_no, int category_no);
	
	
}
