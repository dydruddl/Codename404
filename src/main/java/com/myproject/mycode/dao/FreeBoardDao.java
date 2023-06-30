package com.myproject.mycode.dao;

import java.util.List;

import com.myproject.mycode.model.freeboard;


public interface FreeBoardDao {

	List<freeboard> list(freeboard freeboard);

	int insert(freeboard freeboard);

	int getTotal(freeboard freeboard);
	
	freeboard select(int free_no);

	void updateRe(int free_no);

	int update(freeboard freeboard); 
	
	int delete(int free_no);

	public int getSingoCount(int free_no, int category_no, String nick);

	public void updateFreeSingo(int free_no);

	void singoFreeDelete(int free_no, int category_no);



	

}
