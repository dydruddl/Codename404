package com.myproject.mycode.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myproject.mycode.dao.FreeSingoDao;
import com.myproject.mycode.model.ReportReasonModel;
import com.myproject.mycode.model.freeboard;


@Service
public class FreeSingoService {
	
	@Autowired
	private FreeSingoDao freesingodao;

	public int findSameSingo(int category_no, int free_no) {
		// TODO Auto-generated method stub
		return freesingodao.findSameSingo(category_no,free_no);
	}

	public void updateSingoBoardCount(int category_no, int free_no) {
		// TODO Auto-generated method stub
		freesingodao.updateSingoBoardCount(category_no,free_no);
	}

	public void singoBoardInsert(freeboard freedto) {
		// TODO Auto-generated method stub
		freesingodao.singoBoardInsert(freedto);
	}

	public int getSingoNo(int category_no, int free_no) {
		// TODO Auto-generated method stub
		return freesingodao.getSingoNo(category_no,free_no);
	}

	public void reportReasonInsert(freeboard freedto, int free_no, ReportReasonModel reportreasonDto) {
		// TODO Auto-generated method stub
		freesingodao.reportReasonInsert(freedto,free_no,reportreasonDto);
	}

}
