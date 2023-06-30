package com.myproject.mycode.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myproject.mycode.dao.FreeBoardReplyDao;

import com.myproject.mycode.model.freeboardreply;

@Service
public class FreeBoardReplyService {
	@Autowired
	private FreeBoardReplyDao fbrd;

	public List<freeboardreply> list(int free_no) {
		// TODO Auto-generated method stub
		return fbrd.list(free_no);
	}

	public void insert(freeboardreply fbr) {
		// TODO Auto-generated method stub
		fbrd.insert(fbr);

	}

	public void update(freeboardreply fbr) {
		// TODO Auto-generated method stub
		fbrd.update(fbr);

	}

	public void delete(int free_no) {
		// TODO Auto-generated method stub
		fbrd.delete(free_no);

	}

}
