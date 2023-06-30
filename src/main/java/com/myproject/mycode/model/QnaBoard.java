package com.myproject.mycode.model;

import java.util.Date;

public class QnaBoard {

	private int qna_no;
	private String qna_nick;
	private int category_no; //관리자
	private String qna_subject;
	private String qna_content;
	private Date qna_register;
	private int qna_readcount;
	private int qna_singo;
	private int qna_renum; // 누적 댓글수
	private int qna_del; // 글 삭제 여부
	private int qna_sol; //채택 여부
	
	private int startRow;
	private int endRow;
	
	private int startRow2;
	private int endRow2;
	
	private int startRow3;
	private int endRow3;
	
	private String search;
	private String keyword;
	public int getStartRow3() {
		return startRow3;
	}
	public void setStartRow3(int startRow3) {
		this.startRow3 = startRow3;
	}
	public int getEndRow3() {
		return endRow3;
	}
	public void setEndRow3(int endRow3) {
		this.endRow3 = endRow3;
	}
	public int getStartRow2() {
		return startRow2;
	}
	public void setStartRow2(int startRow2) {
		this.startRow2 = startRow2;
	}
	public int getEndRow2() {
		return endRow2;
	}
	public void setEndRow2(int endRow2) {
		this.endRow2 = endRow2;
	}
	public int getQna_no() {
		return qna_no;
	}
	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
	}
	public String getQna_nick() {
		return qna_nick;
	}
	public void setQna_nick(String qna_nick) {
		this.qna_nick = qna_nick;
	}
	public int getCategory_no() {
		return category_no;
	}
	public void setCategory_no(int category_no) {
		this.category_no = category_no;
	}
	public String getQna_subject() {
		return qna_subject;
	}
	public void setQna_subject(String qna_subject) {
		this.qna_subject = qna_subject;
	}
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}
	public Date getQna_register() {
		return qna_register;
	}
	public void setQna_register(Date qna_register) {
		this.qna_register = qna_register;
	}
	public int getQna_readcount() {
		return qna_readcount;
	}
	public void setQna_readcount(int qna_readcount) {
		this.qna_readcount = qna_readcount;
	}
	public int getQna_singo() {
		return qna_singo;
	}
	public void setQna_singo(int qna_singo) {
		this.qna_singo = qna_singo;
	}
	public int getQna_renum() {
		return qna_renum;
	}
	public void setQna_renum(int qna_renum) {
		this.qna_renum = qna_renum;
	}
	public int getQna_del() {
		return qna_del;
	}
	public void setQna_del(int qna_del) {
		this.qna_del = qna_del;
	}
	public int getQna_sol() {
		return qna_sol;
	}
	public void setQna_sol(int qna_sol) {
		this.qna_sol = qna_sol;
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	

	
	

	
	
}
