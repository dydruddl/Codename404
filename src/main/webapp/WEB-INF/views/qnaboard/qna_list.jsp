<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>Q&amp;A</title>
<meta charset="UTF-8">

<!-- 반응형 웹 -->
<meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<body>
	<!-- 전체 프레임 -->
	<div id="frame">

		<!-- 네비게이션 바/부트스트랩 -->
		<jsp:include page="../navigator.jsp"></jsp:include>

		<!--  q&a 컨테이너 -->
		<div class="container">
			<h2>Q&amp;A게시판</h2>

			
			<!-- 전체, 해결, 미해결 카테고리 네비 -->
			<ul class="nav nav-tabs" role="tablist">
    			<li class="active"><a href="qna_list.qna">전체</a></li>
   			    <li><a href="qna_sol.qna?qna_sol=1">해결</a></li>
    			<li><a href="qna_unsol.qna">미해결</a></li>
  			</ul>


			<!-- content div시작, center로 해야 페이지블록이 센터로 옴-->
			<div class="tab-content" align=center>

				<!-- 전체 눌렀을 때 -->
				<div id="home" class="tab-pane fade in active">
					<div class="all">
						<h2>게시판 목록</h2>

						<!-- 글 작성 버튼 -->
						<c:if test="${empty adminmodel.admin_id }">
							<div align="right">
								<a href="qnaInsertForm.qna" class="fl-write-btn">글 작성</a>
							<p>
							</div>
						</c:if>

							<!-- 글 목록 출력 -->
						<table class="table table-striped">
							<tr>
								<td>번호</td>
								<td>제목</td>
								<td>작성자</td>
								<td>작성일</td>
								<td>조회수</td>
							</tr>

							<c:if test="${empty list}">
								<tr>
									<td colspan="5">데이터가 없습니다</td>
								</tr>
							</c:if>

							<c:if test="${not empty list}">
								<c:set var="no1" value="${no }"></c:set>
								<!-- 컨트롤러에서 정한 화면 출력번호no를 set태그로 설정 -->
								<c:forEach var="qnaBoard" items="${list }">
									<tr>
										<td>${no1}</td>
										<!-- 번호값 -->
										<%-- <c:if test="${qnaBoard.qna_del ==1 }">
											<!-- del 상태값이 1인 경우: 글 삭제 -->
											<td colspan="4">삭제된 데이터 입니다</td>
										</c:if>  --%>
										<c:if test="${qnaBoard.qna_del !=1 }">
											<!-- 살아있는 글 제목에 링크걸기 -->
											<td><a
												href="qnaView.qna?qna_no=${qnaBoard.qna_no}&pageNum=${pp.currentPage}"
												class="btn btn-default"> ${qnaBoard.qna_subject}</a> <!-- 글 번호값, 페이지번호값 가져가기 -->

												<span class=badge>${qnaBoard.qna_renum }</span>
												<c:if test="${qnaBoard.qna_sol == 1 }">
													<img width="20" height="20" src="./images/check.png">
												</c:if>
												</td>
											<td>${qnaBoard.qna_nick}</td>
											<td><fmt:formatDate value="${qnaBoard.qna_register }"
													pattern="yyyy-MM-dd" /></td>
											<td>${qnaBoard.qna_readcount}</td>
										</c:if>
									</tr>
									<c:set var="no1" value="${no1 - 1}" />
									<!-- 순차적으로 번호값 감소 -->
								</c:forEach>
							</c:if>
						</table>

					<div class="fl-search-container">
						<form action="qna_list.qna" align="center">
							<!-- 검색 기능 폼-->
							<input type="hidden" name="pageNum" value="1">
							<!-- 페이지(1)와 search, keyword가지고 list로 이동 -->
							<!-- 컨트롤러에서 pageNum값 전달 안 될 경우 1로 설정했기 때문 여기서 따로 설정 안 해도 됨  -->
							<select name="search" class="fl-search-select">
								<option value="qna_subject"
									<c:if test="${search=='qna_subject'}">selected="selected" </c:if>>제목</option>
								<option value="qna_content"
									<c:if test="${search=='qna_content'}">selected="selected" </c:if>>내용</option>
								<option value="qna_nick"
									<c:if test="${search=='qna_nick'}">selected="selected" </c:if>>작성자</option>
								<option value="qna_subcon"
									<c:if test="${search=='qna_subcon'}">selected="selected" </c:if>>제목+내용</option>

							</select> <input type="text" placeholder="검색어를 입력해 주세요!" name="keyword"
								required>
							<!-- 사용자가 입력한 검색어(keyword)를 list로 가져감 -->
							<input type="submit" class="fl-search-btn" value="확인">
						</form>
					</div>

						<!-- 페이징처리  -->
						<ul class="pagination">
							<!-- 검색 했을 경우의 페이징 처리: 글번호,페이지, search, keyword 가져옴 -->
							<c:if test="${not empty keyword}">
								<c:if test="${pp.startPage > pp.pagePerBlk }">
									<!--컨트롤러에서 갖고온 pp 객체 -->
									<li><a
										href="qna_list.qna?pageNum=${pp.startPage - 1}&search=${search}&keyword=${keyword}">이전</a></li>
								</c:if>
								<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
									<!-- [1][2][3]..  루프 돌려서 페이지 출력 -->
									<li <c:if test="${pp.currentPage==i}">class="active"</c:if>><a
										href="qna_list.qna?pageNum=${i}&search=${search}&keyword=${keyword}">${i}</a></li>
									<!-- pageNum, search, keyword 가져가야됨!!!!!! -->
								</c:forEach>
								<c:if test="${pp.endPage < pp.totalPage}">
									<li><a
										href="qna_list.qna?pageNum=${pp.endPage + 1}&search=${search}&keyword=${keyword}">다음</a></li>
								</c:if>
							</c:if>




							<!-- 전체 목록의 페이징 처리: 글번호, 페이지 -->
							<c:if test="${empty keyword}">
								<c:if test="${pp.startPage > pp.pagePerBlk }">
									<!-- startPage(1,11,21...) > pagePerBlk(1개 블록에 10개 페이지) -->
									<li><a href="qna_list.qna?pageNum=${pp.startPage - 1}">이전</a></li>
								</c:if>
								<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
									<!-- [1][2][3].. 10개씩 페이지 출력 -->
									<li <c:if test="${pp.currentPage==i}">class="active"</c:if>>
										<!-- 현재 페이지: 활성화 상태 --> <a href="qna_list.qna?pageNum=${i}">${i}</a>
									</li>
								</c:forEach>
								<c:if test="${pp.endPage < pp.totalPage}">
									<!-- endPage(10,20,30...) < 총 페이지수 -->
									<li><a href="qna_list.qna?pageNum=${pp.endPage + 1}">다음</a></li>
								</c:if>
							</c:if>
						</ul>

					</div>
				</div>
			</div>	<!-- content  -->
			
		
		</div><!-- qna container -->
		
		<!-- footer -->
		<jsp:include page="../footer.jsp"></jsp:include>
	
	</div>
	<!-- 전체 frame -->
</body>
</html>