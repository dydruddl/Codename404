package com.myproject.mycode.model;

import java.util.Date;

public class QnaBoardReply {
	private int qna_rno;
	private int qna_bno;
	private String qna_re_nick;
	private String qna_replytext;
	private Date qna_regdate;
	private int qna_re_sol;
	public int getQna_rno() {
		return qna_rno;
	}
	public void setQna_rno(int qna_rno) {
		this.qna_rno = qna_rno;
	}
	public int getQna_bno() {
		return qna_bno;
	}
	public void setQna_bno(int qna_bno) {
		this.qna_bno = qna_bno;
	}
	public String getQna_re_nick() {
		return qna_re_nick;
	}
	public void setQna_re_nick(String qna_re_nick) {
		this.qna_re_nick = qna_re_nick;
	}
	public String getQna_replytext() {
		return qna_replytext;
	}
	public void setQna_replytext(String qna_replytext) {
		this.qna_replytext = qna_replytext;
	}
	public Date getQna_regdate() {
		return qna_regdate;
	}
	public void setQna_regdate(Date qna_regdate) {
		this.qna_regdate = qna_regdate;
	}
	public int getQna_re_sol() {
		return qna_re_sol;
	}
	public void setQna_re_sol(int qna_re_sol) {
		this.qna_re_sol = qna_re_sol;
	}
	
	
}