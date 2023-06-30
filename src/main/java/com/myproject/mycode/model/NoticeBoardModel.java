package com.myproject.mycode.model;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeBoardModel {
	private int notice_no;
	private String admin_nick;
	private String notice_subject;
	private String notice_content;
	private Date notice_date;
	private int notice_readcount;
	
	// page
	private int startRow;
	private int endRow;
			
	// 검색
	private String search;
	private String keyword;
}
