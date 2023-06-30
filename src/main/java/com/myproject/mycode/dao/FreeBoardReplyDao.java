package com.myproject.mycode.dao;

import java.util.List;

import com.myproject.mycode.model.freeboardreply;

public interface FreeBoardReplyDao {
	

	List<freeboardreply> list(int free_no);

	void insert(freeboardreply fbr);

	void update(freeboardreply fbr);

	void delete(int free_no);


}
