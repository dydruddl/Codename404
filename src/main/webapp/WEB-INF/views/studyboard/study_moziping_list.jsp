<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="head.jsp" %>

<!DOCTYPE html>
<html>
<head>
	<title>Study 모집 완료</title>
	<meta charset="UTF-8">
</head>
<body>

<!------------------------------ 전체 frame ------------------------------>
<div id="frame">

<!------------------------------ 네비게이션 바/부트스트랩 ------------------------------>
<jsp:include page="../navigator.jsp"></jsp:include> 

<!------------------------------ Study 컨테이너 ------------------------------>
<div class="container">
<h2>Study 게시판</h2>

<!------------------------------ 전체, 모집완료, 모집중 카테고리 네비 ------------------------------>

<!-- 전체, 모집완료, 모집중 카테고리 네비 -->
<ul class="nav nav-tabs">
	<li><a href="study_list.study">전체</a></li>
	<li><a href="study_mozip.study">모집완료</a></li>
	<li class="active"><a href="study_moziping.study">모집중</a></li> 
</ul>

<!------------------------------ content div 시작 / center로 해야 페이지블록이 센터로 옴 ------------------------------>
<div class="tab-content" align="center">
<!-------------------------------- 모집중 눌렀을 때 ------------------------------>
<div id="menu2" class="tab-pane fade in active"> <!-- menu2 -->

<div> <!-- all -->
<h2>게시판 목록</h2>

<%-- 글작성 버튼 --%>
	<!-- 로그인 상태 -->
    <c:if test="${empty sessionScope.id}">
    <%-- <c:if test="${!empty memberModel.id}"> --%>
	    <div align="right">
			<a href="studyInsertForm.study" class="fl-write-btn">글 작성</a>
		</div>
    </c:if>
    <br>
        
<%--        
	<div align="right">
		<a href="studyInsertForm.study" class="btn btn-info">글 입력</a>
	</div>
--%>

<table class="table table-striped">
	<tr>
		<td>번호</td>
		<td>제목</td>
		<td>작성자</td>
		<td>작성일</td>
		<td>조회수</td>
		<td>시작일</td>
		<td>종료일</td>
		<td>D-day</td>
	</tr>
         
	<c:if test="${empty mozipingList}">
		<tr>
			<td colspan="7">데이터가 없습니다</td>
		</tr>
	</c:if>
	       
    <c:if test="${not empty mozipingList}">
	<c:set var="no3" value="${mozipimgNum}"></c:set> <%-- var: 변수 설정, value="${받아온 값}" --%>
	    
	<!-- 컨트롤러에서 정한 화면 출력번호 no를 set태그로 설정 -->
	<c:forEach var="studyBoard" items="${mozipingList}">
	
	<%-- 모집중(0) 만 출력 --%>
	<c:if test="${studyBoard.study_mozip == 0}">
		<tr>
			<td>${no3}</td> <!-- 번호값 -->
			<c:if test="${studyBoard.study_del == 1}"> <%-- test: if의 조건문 --%>
				<!-- del 상태값이 1 인 경우: 글 삭제 -->
				<td colspan="7">삭제된 데이터 입니다</td>
			</c:if>
				
			<c:if test="${studyBoard.study_del != 1}"> <!-- 살아있는 글 제목에 링크걸기 --> <!-- 글 번호값, 페이지번호값 가져가기 -->
				<td><a href="studyView.study?study_no=${studyBoard.study_no}&pageNum=${pp3.currentPage}" 
					   class="btn btn-default">${studyBoard.study_subject}</a>
					<c:if test="${studyBoard.study_readcount >= 20 }"><img width="15" height="20" src="./images/hot.png"></c:if>
					<c:if test="${studyBoard.study_mozip == 1}">
					<button type="button" class="btn btn-outline-danger">
		                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-calendar-check" viewBox="0 0 16 16">
			                <path d="M10.854 7.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L7.5 9.793l2.646-2.647a.5.5 0 0 1 .708 0z"></path>
			                <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z"></path>
		                </svg>&nbsp;모집완료
	                </button>
					</c:if>
				</td>
				<td>${studyBoard.study_nick}</td>
				<td><fmt:formatDate value="${studyBoard.study_register}" pattern="yyyy-MM-dd"/></td>
				<td>${studyBoard.study_readcount}</td>
				<td>${studyBoard.study_start_date}</td>
				<td>${studyBoard.study_end_date}</td>
				<%-- D-day --%>
				<td>
		        <c:choose>
			        <c:when test="${studyBoard.study_term < 0}">
			        [모집기간 종료]
			        </c:when>
			        <c:otherwise>
			        	${studyBoard.study_term}
			        </c:otherwise>
		        </c:choose>
	         	</td>
			</c:if> <%-- <c:if test="${studyBoard.study_del != 1}"> --%>
		</tr>
		<c:set var="no3" value="${no3 - 1}"/> <!-- 순차적으로 번호값 감소 -->
	</c:if> <%-- <c:if test="${studyBoard.study_mozip == 1}"> --%>
	</c:forEach>
	</c:if> <%-- <c:if test="${not empty list}"> --%>

</table>
 
<!-- 검색 기능 폼--> 
<div class="fl-search-container"> 
<form action="study_moziping.study" align="center"> 
	<input type="hidden" name="pageNum" value="1">
	<!-- 페이지(1)와 search, keyword가지고 list로 이동 -->
	<!-- 컨트롤러에서 pageNum값 전달 안 될 경우 1로 설정했기 때문에 여기서 따로 설정 안 해도 됨  -->
	<select  name="search" class="fl-search-select"> 
		<option value="study_subject" <c:if test="${search=='study_subject'}">selected="selected" </c:if>>제목</option>
		<option value="study_content" <c:if test="${search=='study_content'}">selected="selected" </c:if>>내용</option>
		<option value="study_nick" <c:if test="${search=='study_nick'}">selected="selected" </c:if>>작성자</option>
		<option value="study_subcon" <c:if test="${search=='study_subcon'}">selected="selected" </c:if>>제목+내용</option>      
	</select>
	<input type="text" placeholder="검색어를 입력해 주세요!" name="keyword" required> <!-- 사용자가 입력한 검색어(keyword)를 list로 가져감 --> 
	<input type="submit" class="fl-search-btn" value="확인">
</form>
</div>   
<!-- 페이징처리  -->
<ul class="pagination">
	<!-- 검색 했을 경우의 페이징 처리: 글번호,페이지, search, keyword 가져옴 -->
	<c:if test="${not empty keyword}">
		<c:if test="${pp3.startPage > pp3.pagePerBlk}"> <!--컨트롤러에서 갖고온 pp 객체 -->
			<li><a href="study_moziping.study?pageNum=${pp3.startPage - 1}&search=${search}&keyword=${keyword}">이전</a></li>
		</c:if>
		
		<c:forEach var="i" begin="${pp3.startPage}" end="${pp3.endPage}">
			<!-- [1][2][3]..  루프 돌려서 페이지 출력 -->
			<li <c:if test="${pp3.currentPage==i}">class="active"</c:if>>
			<a href="study_moziping.study?pageNum=${i}&search=${search}&keyword=${keyword}">${i}</a></li>
			<!-- pageNum, search, keyword 가져가야됨!!!!!! -->
		</c:forEach>
		<c:if test="${pp3.endPage < pp3.totalPage}">
			<li><a href="study_moziping.study?pageNum=${pp3.endPage + 1}&search=${search}&keyword=${keyword}">다음</a></li>
		</c:if>
	</c:if>
	
	<!-- 전체 목록의 페이징 처리: 글번호, 페이지 -->
	<c:if test="${empty keyword}">
		<c:if test="${pp3.startPage > pp3.pagePerBlk}">
			<!-- startPage(1,11,21...) > pagePerBlk(1개 블록에 10개 페이지) -->
			<li><a href="study_moziping.study?pageNum=${pp3.startPage - 1}">이전</a></li>
		</c:if>
		
		<c:forEach var="i" begin="${pp3.startPage}" end="${pp3.endPage}">
			<!-- [1][2][3].. 10개씩 페이지 출력 -->
			<li <c:if test="${pp3.currentPage == i}">class="active"</c:if>>
			<!-- 현재 페이지: 활성화 상태 -->
			<a href="study_moziping.study?pageNum=${i}">${i}</a></li>
		</c:forEach>
		
		<c:if test="${pp3.endPage < pp3.totalPage}">
		<!-- endPage(10,20,30...) < 총 페이지수 -->
			<li><a href="study_moziping.study?pageNum=${pp3.endPage + 1}">다음</a></li>
		</c:if>
	</c:if>
</ul>

</div> <!-- all end -->

</div> <!-- menu2 end -->
</div> <!-- content div end -->

</div>
<!------------------------------ Study 컨테이너 end ------------------------------>

<!------------------------------ footer ------------------------------>
<jsp:include page="../footer.jsp"></jsp:include>

</div>
<!------------------------------ 전체 frame end ------------------------------>

</body>
</html>
