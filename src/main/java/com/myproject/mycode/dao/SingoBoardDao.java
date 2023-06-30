package com.myproject.mycode.dao;

import java.util.List;

import com.myproject.mycode.model.ReportReasonModel;
import com.myproject.mycode.model.SingoModel;

public interface SingoBoardDao {

	List<SingoModel> getSingoList(SingoModel singo);
	
	int getSingoCount(SingoModel singo);
	
	List<SingoModel> getSingoListAll(SingoModel singo);
	
	int getSingoCountAll(SingoModel singo);
	
	SingoModel getSingo(int singo_no);
	
	List<ReportReasonModel> getReportList(ReportReasonModel report);
	
	int getReportBoardCount(ReportReasonModel report);
	
	public ReportReasonModel reportView(int singo_no);
}
