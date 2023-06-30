package com.myproject.mycode.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myproject.mycode.dao.FreeBoardDao;
import com.myproject.mycode.model.freeboard;

@Service
public class FreeBoardServiceImpl implements FreeBoardService {
	@Autowired
	private FreeBoardDao fbd;			// dao 클래스와 연결

	//자유게시판 리스트
	@Override
	public List<freeboard> list(freeboard freeboard) {
		// TODO Auto-generated method stub
		return fbd.list(freeboard);
	}
	//자유게시판 작성
	@Override
	public int insert(freeboard freeboard) {
		// TODO Auto-generated method stub
		return fbd.insert(freeboard);
	}
	@Override
	public int getTotal(freeboard freeboard) {
		// TODO Auto-generated method stub
		return fbd.getTotal(freeboard);
	}
	@Override
	public freeboard select(int free_no) {
		// TODO Auto-generated method stub
		return fbd.select(free_no);
	}
	@Override
	public void updateRe(int free_no) {
		// TODO Auto-generated method stub
		fbd.updateRe(free_no);
		
	}
	@Override
	public int update(freeboard freeboard) {
		// TODO Auto-generated method stub
		return fbd.update(freeboard);
	}
	
	public int delete(int free_no) {
		// TODO Auto-generated method stub
		return fbd.delete(free_no);
	}
	@Override
	public List<freeboard> relist(int free_no) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public int getSingoCount(int free_no, int category_no, String nick) {
		// TODO Auto-generated method stub
		return fbd.getSingoCount(free_no, category_no, nick);
	}
	
	@Override
	public void updateFreeSingo(int free_no) {
		// TODO Auto-generated method stub
		fbd.updateFreeSingo(free_no);
	}
	
	@Override
	public void singoFreeDelete(int free_no, int category_no) {
		// TODO Auto-generated method stub
		fbd.singoFreeDelete(free_no, category_no);
	}
	
	
	
	
	
	
	
	
}