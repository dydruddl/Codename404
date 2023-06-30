package com.myproject.mycode.model;

import java.util.Date;

public class StudyBoard {
	private int study_no;
	private String study_nick;
	private int category_no; //관리자
	private String study_subject;
	private String study_content;
	private Date study_register;
	private int study_readcount;
	private int study_singo;
	private int study_renum; // 누적 댓글수
	private int study_del; // 글 삭제 여부
	
	private String study_start_date;
	private String study_end_date;
	private int study_term;
	private int study_mozip;
	
	private int startRow;
	private int endRow;
	
	private String search;
	private String keyword;
	public int getStudy_no() {
		return study_no;
	}
	public void setStudy_no(int study_no) {
		this.study_no = study_no;
	}
	public String getStudy_nick() {
		return study_nick;
	}
	public void setStudy_nick(String study_nick) {
		this.study_nick = study_nick;
	}
	public int getCategory_no() {
		return category_no;
	}
	public void setCategory_no(int category_no) {
		this.category_no = category_no;
	}
	public String getStudy_subject() {
		return study_subject;
	}
	public void setStudy_subject(String study_subject) {
		this.study_subject = study_subject;
	}
	public String getStudy_content() {
		return study_content;
	}
	public void setStudy_content(String study_content) {
		this.study_content = study_content;
	}
	public Date getStudy_register() {
		return study_register;
	}
	public void setStudy_register(Date study_register) {
		this.study_register = study_register;
	}
	public int getStudy_readcount() {
		return study_readcount;
	}
	public void setStudy_readcount(int study_readcount) {
		this.study_readcount = study_readcount;
	}
	public int getStudy_singo() {
		return study_singo;
	}
	public void setStudy_singo(int study_singo) {
		this.study_singo = study_singo;
	}
	public int getStudy_renum() {
		return study_renum;
	}
	public void setStudy_renum(int study_renum) {
		this.study_renum = study_renum;
	}
	public int getStudy_del() {
		return study_del;
	}
	public void setStudy_del(int study_del) {
		this.study_del = study_del;
	}
	public String getStudy_start_date() {
		return study_start_date;
	}
	public void setStudy_start_date(String study_start_date) {
		this.study_start_date = study_start_date;
	}
	public String getStudy_end_date() {
		return study_end_date;
	}
	public void setStudy_end_date(String study_end_date) {
		this.study_end_date = study_end_date;
	}
	public int getStudy_term() {
		return study_term;
	}
	public void setStudy_term(int study_term) {
		this.study_term = study_term;
	}
	public int getStudy_mozip() {
		return study_mozip;
	}
	public void setStudy_mozip(int study_mozip) {
		this.study_mozip = study_mozip;
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
