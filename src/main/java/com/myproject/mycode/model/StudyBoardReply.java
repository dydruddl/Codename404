package com.myproject.mycode.model;

import java.util.Date;

public class StudyBoardReply {
	private int study_rno;
	private int study_no;
	private String study_re_nick;
	private String study_replytext;
	private Date study_regdate;
	
	public int getStudy_rno() {
		return study_rno;
	}
	public void setStudy_rno(int study_rno) {
		this.study_rno = study_rno;
	}
	public int getStudy_no() {
		return study_no;
	}
	public void setStudy_no(int study_no) {
		this.study_no = study_no;
	}
	public String getStudy_re_nick() {
		return study_re_nick;
	}
	public void setStudy_re_nick(String study_re_nick) {
		this.study_re_nick = study_re_nick;
	}
	public String getStudy_replytext() {
		return study_replytext;
	}
	public void setStudy_replytext(String study_replytext) {
		this.study_replytext = study_replytext;
	}
	public Date getStudy_regdate() {
		return study_regdate;
	}
	public void setStudy_regdate(Date study_regdate) {
		this.study_regdate = study_regdate;
	}
}