<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Notice Board</title>

<jsp:include page="../bootstrap.jsp"></jsp:include>
</head>
<body>
<div id="frame">
<jsp:include page="../navigator.jsp"></jsp:include>
	<!------------------------------ 전체 프레임 ------------------------------>
				
<!-- 검색 기능 -->

<div class="container" align="center">
			<form action="notice_list.notice">
				<input type="hidden" name="pageNum">
				<h2>공지사항 게시판</h2>
				<p>회원들이 필독해야될 공지사항!!</p>
			<div class="input-group">
	<select class="form-control" name="search">
		<option value="notice_subject" <c:if test="${search=='notice_subject'}">selected="selected"</c:if>>제목</option>
		<option value="notice_content" <c:if test="${search=='notice_content'}">selected="selected"</c:if>>내용</option>
	</select>
	<input type="text" class="form-control" name="keyword" placeholder="Search">
	<span class="input-group-btn">
		<button class="btn btn-default" type="submit">
			<i class="glyphicon glyphicon-search"></i>
		</button>
	</span>
</div>
</form> <br>
<div align="right">

총 글개수 : ${bp.total} &nbsp;
<a href="notice_list.notice"><button class="btn btn-success">전체글보기</button></a>
<c:if test="${!empty adminmodel.admin_id }">
<a href="notice_InsertForm.notice" class="btn btn-info">글 입력</a>
</c:if>
</div> <br>
      
  <table class="table table-striped">
    <thead>
      <tr>  
	<th>글번호</th>
	<th>제목</th>
	<th>작성자</th>
	<th>작성일</th>
	<th>조회수</th>
      </tr>
    </thead>
    <tbody>
  		<c:if test="${empty noticeList}">
		  <tr>
			<th colspan="5" align="center">데이터가 없습니다</th>
		  </tr>
		</c:if>
		<c:if test="${not empty noticeList}">
			<c:set var="num" value="${num }"></c:set>
				<c:forEach var="noticeli" items="${noticeList}">
					<tr>
					<td><c:out value="${num }"></c:out> <c:set var="num"
									value="${num-1 }"></c:set></td>
							<!-- 제목에 링크 게시물 글번호랑 페이지 가져가야됨. -->
					<td><a href="notice_View.notice?notice_no=${noticeli.notice_no}&pageNum=${bp.currentPage}" 
								class="btn btn-default">${noticeli.notice_subject}</a></td>
					<td>${noticeli.admin_nick }</td>
					<td><fmt:formatDate value="${noticeli.notice_date}"
									pattern="yyyy-MM-dd a HH:mm:ss EEE요일" /></td>
					<td>${noticeli.notice_readcount}</td>
					</tr>
				</c:forEach>
			</c:if>
    	</tbody>					
  	</table>

	<ul class="pagination">
	<!-- 검색 했을 경우의 페이징 처리 -->
			 <c:if test="${not empty keyword}">
			<li><a href="notice_list.notice?pageNum=1&search=${search}&keyword=${keyword}">첫번째 페이지</a></li>
				<c:if test="${bp.currentPage > 1 }">
					<li><a
						href="notice_list.notice?pageNum=${bp.currentPage - 1}&search=${search}&keyword=${keyword}">이전</a></li>
				</c:if>
				<c:forEach var="i" begin="${bp.startPage}" end="${bp.endPage}">
					<li <c:if test="${bp.currentPage==i}">class="active"</c:if>><a
						href="notice_list.notice?pageNum=${i}&search=${search}&keyword=${keyword}">${i}</a></li>
				</c:forEach>
				<c:if test="${bp.currentPage < bp.totalPage}">
					<li><a
						href="notice_list.notice?pageNum=${bp.currentPage + 1}&search=${search}&keyword=${keyword}">다음</a></li>
				</c:if>
				<li><a href="notice_list.notice?pageNum=${bp.totalPage }&search=${search}&keyword=${keyword}">마지막 페이지</a></li>
			</c:if>

	<!-- 전체 목록의 페이징 처리 -->
				<c:if test="${empty keyword}">
					<li><a href="notice_list.notice?pageNum=1">첫번째 페이지</a></li>
					<c:if test="${bp.currentPage > 1 }">
						<li><a
							href="notice_list.notice?pageNum=${bp.currentPage - 1}">이전</a></li>
					</c:if>
					
					<c:forEach var="i" begin="${bp.startPage}" end="${bp.endPage}" step="1">
						<li <c:if test="${bp.currentPage==i}">class="active"</c:if>>
							<a href="notice_list.notice?pageNum=${i}">${i}</a>
						</li>
					</c:forEach>
					
					<c:if test="${bp.currentPage < bp.totalPage }">
						<li><a
							href="notice_list.notice?pageNum=${bp.currentPage + 1}">다음</a></li>
					</c:if>
					<li><a href="notice_list.notice?pageNum=${bp.totalPage }">마지막
							페이지</a></li>
				</c:if>
	</ul>				

	<!-- 스터디 게시판 컨테이너 end -->
	</div>

	<!-- footer -->
	<jsp:include page="../footer.jsp"></jsp:include>

	</div>
	<!------------------------------ 전체 프레임 end ------------------------------>

</body>
</html>