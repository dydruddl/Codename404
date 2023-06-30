package com.myproject.mycode.model;

import java.util.Date;

public class freeboardreply {
	
	private int free_rno;
	private int free_no;
	private String free_re_nick;
	private String free_replytext;	
	private Date free_regdate;
	public int getFree_rno() {
		return free_rno;
	}
	public void setFree_rno(int free_rno) {
		this.free_rno = free_rno;
	}
	public int getFree_no() {
		return free_no;
	}
	public void setFree_no(int free_no) {
		this.free_no = free_no;
	}
	public String getFree_re_nick() {
		return free_re_nick;
	}
	public void setFree_re_nick(String free_re_nick) {
		this.free_re_nick = free_re_nick;
	}
	public String getFree_replytext() {
		return free_replytext;
	}
	public void setFree_replytext(String free_replytext) {
		this.free_replytext = free_replytext;
	}
	public Date getFree_regdate() {
		return free_regdate;
	}
	public void setFree_regdate(Date free_regdate) {
		this.free_regdate = free_regdate;
	}

}
