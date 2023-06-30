package com.myproject.mycode.service;

public class adminPaging {

		private int total;				// 데이터 갯수
		private int pageDataCount;		// 화면에 출력할 데이터 갯수
		private int BlockPage = 5;      // 블럭당 페이지 갯수 (1개의 블럭당 5개의 페이지)
		private int currentPage;		// 현재 페이지 번호
		private int startPage;			// 각 블럭의 시작 페이지
		private int endPage;            // 각 블럭의 끝 페이지
		private int totalPage;			// 총 페이지 수

		public adminPaging(int total, int pageDataCount, int currentPage) {
			this.total = total;
			this.pageDataCount = pageDataCount;
			this.currentPage = currentPage;
			
			totalPage = (int) Math.ceil((double) total / pageDataCount);
			
			startPage = 1;
			endPage = totalPage;
			
			if(currentPage <= 3 && totalPage > 5) { 
				
				startPage = 1;
				endPage = startPage + 4;
			}else if(currentPage > 3 && currentPage+2 <= totalPage) {
				
				startPage = currentPage -2;
				endPage = currentPage +2;
			}else if(currentPage+3 > totalPage && totalPage>5){
				
				startPage = totalPage - 4;
				endPage = totalPage;
			}
			
			
			
//			startPage = currentPage - 2;
//			endPage = currentPage + 2;
//			
//			if(currentPage <= 3) { 
//				startPage = 1;
//				endPage = startPage + 4;
//		
//			}else if(currentPage+3 > totalPage){
//				startPage = totalPage - 4;
//				endPage = totalPage;
//			}
			
		}

		public int getTotal() {
			return total;
		}

		public void setTotal(int total) {
			this.total = total;
		}

		public int getPageDataCount() {
			return pageDataCount;
		}

		public void setPageDataCount(int pageDataCount) {
			this.pageDataCount = pageDataCount;
		}

		public int getBlockPage() {
			return BlockPage;
		}

		public void setBlockPage(int blockPage) {
			BlockPage = blockPage;
		}

		public int getCurrentPage() {
			return currentPage;
		}

		public void setCurrentPage(int currentPage) {
			this.currentPage = currentPage;
		}

		public int getStartPage() {
			return startPage;
		}

		public void setStartPage(int startPage) {
			this.startPage = startPage;
		}

		public int getEndPage() {
			return endPage;
		}

		public void setEndPage(int endPage) {
			this.endPage = endPage;
		}

		public int getTotalPage() {
			return totalPage;
		}

		public void setTotalPage(int totalPage) {
			this.totalPage = totalPage;
		}

		}

