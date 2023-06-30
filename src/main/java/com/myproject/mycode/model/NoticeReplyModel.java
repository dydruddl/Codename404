package com.myproject.mycode.model;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeReplyModel {

	private int notice_rno;
	private int notice_no;
	private String notice_renick;
	private String notice_replycontent;
	private Date notice_regdate;
}
