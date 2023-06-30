<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="free_head.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>자유게시판 리스트</title>

<!-- 반응형 웹 -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- 전체 프레임 -->
<div id="frame">

	<!-- 네비게이션 바/부트스트랩 -->
	<!-- navigator -->
	<jsp:include page="../navigator.jsp"></jsp:include>


	<div class="container">

		<h2>자유게시판</h2>

		<div class="tab-content" align="center">
			<div id="home" class="tab-pane fade in active">
				<div class="all">
					<h2>게시판 목록</h2>

					<!-- free_write폼으로 넘겨주는 부분 관리자일때는 안보이게 추가-->
					<div align="right">
						<c:if test="${empty adminmodel.admin_nick}">
							<a href="free_write.free" class="fl-write-btn">글 작성</a>
						</c:if>
					</div>
				</div>
			</div>

			<br>
			<!-- 글 목록 출력 -->
			<table class="table table-striped">
				<tr>
					<td>번호</td>
					<td>제목</td>
					<td>작성자</td>
					<td>작성일</td>
					<td>조회수</td>
				</tr>

				<c:if test="${empty free_list }">
					<tr>
						<td colspan="5">데이터가 없습니다</td>
					</tr>
				</c:if>

				<c:if test="${not empty free_list }">
					<!-- 컨트롤러에서 정한 화면 출력번호no를 set태그로 설정 -->
					<c:set var="no" value="${no }" />
					<c:forEach var="freeboard" items="${free_list }">
						<!-- 살아있는 글 제목에 링크걸기 -->
						<tr>
							<td>${no }<c:set var="no" value="${no-1}" />
							</td>

							<c:if test="${freeboard.free_del == '1' }">
								<td colspan="4">삭제된 데이터 입니다.</td>
							</c:if>
							<c:if test="${freeboard.free_del == '0' }">
								<td><a
									href="free_view.free?free_no=${freeboard.free_no}&pageNum=${pp.currentPage}"
									class="btn btn-default"> ${freeboard.free_subject}</a> <!-- 글 번호값, 페이지번호값 가져가기 -->
									<c:if test="${freeboard.free_readcount >= 20 }"><img width="15" height="20" src="./images/hot.png"></c:if>
								</td>
								<td>${freeboard.free_nick}</td>
								<td>${freeboard.free_regdate}</td>
								<td>${freeboard.free_readcount}</td>
							</c:if>
						</tr>
					</c:forEach>
				</c:if>
			</table>

			<div class="fl-search-container" align="center">
				<form action="free_list.free">
					<!-- 검색 기능폼 -->
					<input type="hidden" name="pageNum" value="1"> <select
						name="search" class="fl-search-select">
						<option value="all">전체</option>
						<option value="free_subject">제목</option>
						<option value="free_content">내용</option>
						<option value="free_nick">작성자</option>
					</select> <input type="text" placeholder="검색어를 입력하세요" name="keyword">
					<button class="btn fl-search-btn" type="submit">검색</button>
				</form>
			</div>

			<!-- 페이징 처리 -->
			<div align="center">
				<ul class="pagination">
					<!-- 전체 목록의 페이징 처리 -->
					<c:if test="${empty keyword}">
						<c:if test="${pp.startPage > pp.pagePerBlk }">
							<li><a href="free_list.free?pageNum=${pp.startPage - 1}">이전</a></li>
						</c:if>
						<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
							<li <c:if test="${pp.currentPage==i}">class="active"</c:if>>
								<!-- 현재 페이지: 활성화 상태 --> <a href="free_list.free?pageNum=${i}">${i}</a>
							</li>
						</c:forEach>
						<c:if test="${pp.endPage < pp.totalPage}">
							<li><a href="free_list.free?pageNum=${pp.endPage + 1}">다음</a></li>
						</c:if>
					</c:if>
					<!-- 검색 했을 경우의 페이징 처리 -->
					<c:if test="${not empty keyword}">
						<c:if test="${pp.startPage > pp.pagePerBlk }">
							<li><a
								href="list.free?pageNum=${pp.startPage - 1}&search=${search}&keyword=${keyword}">이전</a></li>
						</c:if>
						<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
							<li <c:if test="${pp.currentPage==i}">class="active"</c:if>><a
								href="list.free?pageNum=${i}&search=${search}&keyword=${keyword}">${i}</a></li>
						</c:forEach>
						<c:if test="${pp.endPage < pp.totalPage}">
							<li><a
								href="free_list.free?pageNum=${pp.endPage + 1}&search=${search}&keyword=${keyword}">다음</a></li>
						</c:if>
					</c:if>

				</ul>
			</div>
		</div>
	</div>
	<!-- footer -->
	
	<jsp:include page="../footer.jsp"></jsp:include>
</div>
</body>

</html>

