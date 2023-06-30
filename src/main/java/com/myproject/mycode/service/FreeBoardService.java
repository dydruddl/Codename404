package com.myproject.mycode.service;

import java.util.List;

import com.myproject.mycode.model.freeboard;

public interface FreeBoardService {

	List<freeboard> list(freeboard freeboard);
	
	int insert(freeboard freeboard);

	int getTotal(freeboard freeboard);

	freeboard select(int free_no);

	void updateRe(int free_no);

	int update(freeboard freeboard);
	
	int delete(int free_no);
	
	//댓글 목록
	List<freeboard> relist(int free_no);

	// 신고중복확인
	int getSingoCount(int free_no, int category_no, String nick);

	void updateFreeSingo(int free_no);

	void singoFreeDelete(int free_no, int category_no);


	
	
}
