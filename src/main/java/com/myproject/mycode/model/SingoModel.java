package com.myproject.mycode.model;

import java.util.Date;

import lombok.Data;


public class SingoModel {
	private int singo_no;
	private int category_no;
	private int singo_board_no;
	private String singo_subject;
	private String singo_nick;
	private Date singoboard_date;
	private int singo_board_count;
	
		// page
		private int startRow;
		private int endRow;
			
		// 검색
		private String search;
		private String keyword;
		/**
		 * @return the singo_no
		 */
		public int getSingo_no() {
			return singo_no;
		}
		/**
		 * @param singo_no the singo_no to set
		 */
		public void setSingo_no(int singo_no) {
			this.singo_no = singo_no;
		}
		/**
		 * @return the category_no
		 */
		public int getCategory_no() {
			return category_no;
		}
		/**
		 * @param category_no the category_no to set
		 */
		public void setCategory_no(int category_no) {
			this.category_no = category_no;
		}
		/**
		 * @return the singo_board_no
		 */
		public int getSingo_board_no() {
			return singo_board_no;
		}
		/**
		 * @param singo_board_no the singo_board_no to set
		 */
		public void setSingo_board_no(int singo_board_no) {
			this.singo_board_no = singo_board_no;
		}
		/**
		 * @return the singo_subject
		 */
		public String getSingo_subject() {
			return singo_subject;
		}
		/**
		 * @param singo_subject the singo_subject to set
		 */
		public void setSingo_subject(String singo_subject) {
			this.singo_subject = singo_subject;
		}
		/**
		 * @return the singo_nick
		 */
		public String getSingo_nick() {
			return singo_nick;
		}
		/**
		 * @param singo_nick the singo_nick to set
		 */
		public void setSingo_nick(String singo_nick) {
			this.singo_nick = singo_nick;
		}
		/**
		 * @return the singoboard_date
		 */
		public Date getSingoboard_date() {
			return singoboard_date;
		}
		/**
		 * @param singoboard_date the singoboard_date to set
		 */
		public void setSingoboard_date(Date singoboard_date) {
			this.singoboard_date = singoboard_date;
		}
		/**
		 * @return the singo_board_count
		 */
		public int getSingo_board_count() {
			return singo_board_count;
		}
		/**
		 * @param singo_board_count the singo_board_count to set
		 */
		public void setSingo_board_count(int singo_board_count) {
			this.singo_board_count = singo_board_count;
		}
		/**
		 * @return the startRow
		 */
		public int getStartRow() {
			return startRow;
		}
		/**
		 * @param startRow the startRow to set
		 */
		public void setStartRow(int startRow) {
			this.startRow = startRow;
		}
		/**
		 * @return the endRow
		 */
		public int getEndRow() {
			return endRow;
		}
		/**
		 * @param endRow the endRow to set
		 */
		public void setEndRow(int endRow) {
			this.endRow = endRow;
		}
		/**
		 * @return the search
		 */
		public String getSearch() {
			return search;
		}
		/**
		 * @param search the search to set
		 */
		public void setSearch(String search) {
			this.search = search;
		}
		/**
		 * @return the keyword
		 */
		public String getKeyword() {
			return keyword;
		}
		/**
		 * @param keyword the keyword to set
		 */
		public void setKeyword(String keyword) {
			this.keyword = keyword;
		}
		
		
}
