package com.myproject.mycode.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myproject.mycode.dao.SingoBoardDao;
import com.myproject.mycode.model.ReportReasonModel;
import com.myproject.mycode.model.SingoModel;

@Service
public class SingoBoardService {
	@Autowired
	private SingoBoardDao dao; 
	
	public List<SingoModel> getSingoList(SingoModel singo){
		return dao.getSingoList(singo);
	}
	
	public int getSingoCount(SingoModel singo) {
		return dao.getSingoCount(singo);
	}
	
	public List<SingoModel> getSingoListAll(SingoModel singo){
		return dao.getSingoListAll(singo);
	}
	
	public int getSingoCountAll(SingoModel singo) {
		return dao.getSingoCountAll(singo);
	}
	
	public SingoModel getSingo(int singo_no) {
		return dao.getSingo(singo_no);
	}
	
	public List<ReportReasonModel> getReportList(ReportReasonModel report){
		return dao.getReportList(report);
	}
	
	public int getReportBoardCount(ReportReasonModel report) {
		return dao.getReportBoardCount(report);
	}
	
	public ReportReasonModel reportView(int singo_no) {
		return dao.reportView(singo_no);
	}
}
