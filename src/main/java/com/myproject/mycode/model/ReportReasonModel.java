package com.myproject.mycode.model;

import java.util.Date;

import lombok.Data;

@Data
public class ReportReasonModel {
	private int report_no;
	private int singo_no;
	private int category_no;
	private String report_nick;
	private String report_reason;
	private String report_content;
	private Date report_date;
	private int report_board_no;
	
	// page
	private int startRow;
	private int endRow;
				
	// 검색
	private String search;
	private String keyword;
}
