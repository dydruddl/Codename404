package com.myproject.mycode.model;

import java.sql.Timestamp;
import java.util.Date;

import lombok.Data;

@Data
public class MemberModel {

	private String id;
	private String nick;
	private String passwd;
	private Timestamp register;
	private String profile;
	private String intro;
	private String tool;
	private String grade;
	private String prize;
	private String projectfile;
	private int singo_count;
	private int state;
	
	// page
	private int startRow;
	private int endRow;
		
	// 검색
	private String search;
	private String keyword;
}
