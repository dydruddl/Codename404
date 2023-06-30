//미해결탭 페이징 처리
package com.myproject.mycode.service;

//글목록파트
public class PagingPgm3 {
	// 기본 변수
	private int total3;          // 총 데이터 개수
	private int rowPerPage3;    // 화면에 출력할 데이터 개수
	private int currentPage3;    // 현재 페이지 번호

	// 파생된 변수
	private int pagePerBlk3 = 10; // 블럭당 페이지 개수 (1개의 블럭당 10개의 페이지)
	private int startPage3;        // 각 블럭의 시작 페이지
	private int endPage3;        // 각 블럭의 끝 페이지
	private int totalPage3;        // 총 페이지 수

	public PagingPgm3(int total3, int rowPerPage3, int currentPage3) {

	   // 기본 변수
	   this.total3 = total3;
	   this.rowPerPage3 = rowPerPage3;
	   this.currentPage3 = currentPage3;

	   // 파생된 변수
	   totalPage3 = (int) Math.ceil((double) total3 / rowPerPage3); // 총 페이지 수
	   startPage3 = currentPage3 - (currentPage3 - 1) % pagePerBlk3; // 1, 11, 21...
	   endPage3 = startPage3 + pagePerBlk3 - 1; // 10, 20, 30...
	   
	   if (endPage3 > totalPage3) // 실제 존재하는 페이지만 존재하게 한다.

	      endPage3 = totalPage3;
	}

	public int getTotal3() {
		return total3;
	}

	public void setTotal3(int total3) {
		this.total3 = total3;
	}

	public int getRowPerPage3() {
		return rowPerPage3;
	}

	public void setRowPerPage3(int rowPerPage3) {
		this.rowPerPage3 = rowPerPage3;
	}

	public int getCurrentPage3() {
		return currentPage3;
	}

	public void setCurrentPage3(int currentPage3) {
		this.currentPage3 = currentPage3;
	}

	public int getPagePerBlk3() {
		return pagePerBlk3;
	}

	public void setPagePerBlk3(int pagePerBlk3) {
		this.pagePerBlk3 = pagePerBlk3;
	}

	public int getStartPage3() {
		return startPage3;
	}

	public void setStartPage3(int startPage3) {
		this.startPage3 = startPage3;
	}

	public int getEndPage3() {
		return endPage3;
	}

	public void setEndPage3(int endPage3) {
		this.endPage3 = endPage3;
	}

	public int getTotalPage3() {
		return totalPage3;
	}

	public void setTotalPage3(int totalPage3) {
		this.totalPage3 = totalPage3;
	}
	
	

}
