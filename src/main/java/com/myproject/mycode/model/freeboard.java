package com.myproject.mycode.model;

import java.sql.Date;

public class freeboard {

	private int free_no;
	private String free_nick;
	private int category_no;
	private String free_subject;
	private String free_content;
	private Date free_regdate;
	private int free_readcount;
	private int free_singo;
	private int free_renum;
	private int free_del;

	// page
	private int startRow;
	private int endRow;

	// 검색
	private String search;
	private String keyword;

	public int getFree_no() {
		return free_no;
	}

	public void setFree_no(int free_no) {
		this.free_no = free_no;
	}

	public String getFree_nick() {
		return free_nick;
	}

	public void setFree_nick(String free_nick) {
		this.free_nick = free_nick;
	}

	public int getCategory_no() {
		return category_no;
	}

	public void setCategory_no(int category_no) {
		this.category_no = category_no;
	}

	public String getFree_subject() {
		return free_subject;
	}

	public void setFree_subject(String free_subject) {
		this.free_subject = free_subject;
	}

	public String getFree_content() {
		return free_content;
	}

	public void setFree_content(String free_content) {
		this.free_content = free_content;
	}

	public Date getFree_regdate() {
		return free_regdate;
	}

	public void setFree_regdate(Date free_regdate) {
		this.free_regdate = free_regdate;
	}

	public int getFree_readcount() {
		return free_readcount;
	}

	public void setFree_readcount(int free_readcount) {
		this.free_readcount = free_readcount;
	}

	public int getFree_singo() {
		return free_singo;
	}

	public void setFree_singo(int free_singo) {
		this.free_singo = free_singo;
	}

	public int getFree_renum() {
		return free_renum;
	}

	public void setFree_renum(int free_renum) {
		this.free_renum = free_renum;
	}

	public int getFree_del() {
		return free_del;
	}

	public void setFree_del(int free_del) {
		this.free_del = free_del;
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
