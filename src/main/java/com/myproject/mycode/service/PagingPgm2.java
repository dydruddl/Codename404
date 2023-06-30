//해결탭 페이징 처리
package com.myproject.mycode.service;

//글목록 파트
public class PagingPgm2 {
	// 기본 변수
	private int total2;          // 총 데이터 개수
	private int rowPerPage2;    // 화면에 출력할 데이터 개수
	private int currentPage2;    // 현재 페이지 번호

	// 파생된 변수
	private int pagePerBlk2 = 10; // 블럭당 페이지 개수 (1개의 블럭당 10개의 페이지)
	private int startPage2;        // 각 블럭의 시작 페이지
	private int endPage2;        // 각 블럭의 끝 페이지
	private int totalPage2;        // 총 페이지 수

	public PagingPgm2(int total2, int rowPerPage2, int currentPage2) {

	   // 기본 변수
	   this.total2 = total2;
	   this.rowPerPage2 = rowPerPage2;
	   this.currentPage2 = currentPage2;

	   // 파생된 변수
	   totalPage2 = (int) Math.ceil((double) total2 / rowPerPage2); // 총 페이지 수
	   startPage2 = currentPage2 - (currentPage2 - 1) % pagePerBlk2; // 1, 11, 21...
	   endPage2 = startPage2 + pagePerBlk2 - 1; // 10, 20, 30...
	   
	   if (endPage2 > totalPage2) // 실제 존재하는 페이지만 존재하게 한다.

	      endPage2 = totalPage2;
	}

	public int getTotal2() {
		return total2;
	}

	public void setTotal2(int total2) {
		this.total2 = total2;
	}

	public int getRowPerPage2() {
		return rowPerPage2;
	}

	public void setRowPerPage2(int rowPerPage2) {
		this.rowPerPage2 = rowPerPage2;
	}

	public int getCurrentPage2() {
		return currentPage2;
	}

	public void setCurrentPage2(int currentPage2) {
		this.currentPage2 = currentPage2;
	}

	public int getPagePerBlk2() {
		return pagePerBlk2;
	}

	public void setPagePerBlk2(int pagePerBlk2) {
		this.pagePerBlk2 = pagePerBlk2;
	}

	public int getStartPage2() {
		return startPage2;
	}

	public void setStartPage2(int startPage2) {
		this.startPage2 = startPage2;
	}

	public int getEndPage2() {
		return endPage2;
	}

	public void setEndPage2(int endPage2) {
		this.endPage2 = endPage2;
	}

	public int getTotalPage2() {
		return totalPage2;
	}

	public void setTotalPage2(int totalPage2) {
		this.totalPage2 = totalPage2;
	}

}
