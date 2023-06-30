<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리 게시판</title>
<jsp:include page="../bootstrap.jsp"></jsp:include>

</head>
<body>
	<div id="frame">
		<jsp:include page="../navigator.jsp"></jsp:include>

		<!-- 검색 기능 -->

			<div class="container" align="center">
			<div>
			<c:if test="${state == 0 }">
			<form action="adminusers.manager">
				<input type="hidden" name="pageNum" value="${ap.currentPage }">
				<h2>회원관리 테이블</h2>
				<p>회원 상세정보 보기 및 회원 신고글 보기 및 강퇴!</p>
			<div class="input-group">
	<select class="form-control" name="search">
		<option value="id" <c:if test="${search=='id'}">selected="selected"</c:if>>ID</option>
		<option value="nick" <c:if test="${search=='nick'}">selected="selected"</c:if>>닉네임</option>
		<option value="register" <c:if test="${search=='register'}">selected="selected"</c:if>>가입일</option>
	</select>
	<input type="text" class="form-control" name="keyword" placeholder="Search">
	<span class="input-group-btn">
		<button class="btn btn-default" type="submit">
			<i class="glyphicon glyphicon-search"></i>
		</button>
	</span>
	
</div>
</form> <br>
</c:if>
</div>

<div>
<c:if test="${state == 1 }">
			<form action="adminusers.manager">
				<input type="hidden" name="pageNum" value="${ap.currentPage }">
				<input type="hidden" name="state" value="${state }">
				<h2>회원관리 테이블</h2>
				<p>회원 상세정보 보기 및 회원 신고글 보기 및 강퇴!</p>
			<div class="input-group">
	<select class="form-control" name="search">
		<option value="id" <c:if test="${search=='id'}">selected="selected"</c:if>>ID</option>
		<option value="nick" <c:if test="${search=='nick'}">selected="selected"</c:if>>닉네임</option>
		<option value="register" <c:if test="${search=='register'}">selected="selected"</c:if>>가입일</option>
	</select>
	<input type="text" class="form-control" name="keyword" placeholder="Search">
	<span class="input-group-btn">
		<button class="btn btn-default" type="submit">
			<i class="glyphicon glyphicon-search"></i>
		</button>
	</span>	
</div>
</form> <br>
</c:if>
</div>

<div>
<c:if test="${state == 2 }">
			<form action="adminusers.manager">
				<input type="hidden" name="pageNum" value="${ap.currentPage }">
				<input type="hidden" name="state" value="${state }">
				<h2>회원관리 테이블</h2>
				<p>회원 상세정보 보기 및 회원 신고글 보기 및 강퇴!</p>
			<div class="input-group">
	<select class="form-control" name="search">
		<option value="id" <c:if test="${search=='id'}">selected="selected"</c:if>>ID</option>
		<option value="nick" <c:if test="${search=='nick'}">selected="selected"</c:if>>닉네임</option>
		<option value="register" <c:if test="${search=='register'}">selected="selected"</c:if>>가입일</option>
	</select>
	<input type="text" class="form-control" name="keyword" placeholder="Search">
	<span class="input-group-btn">
		<button class="btn btn-default" type="submit">
			<i class="glyphicon glyphicon-search"></i>
		</button>
	</span>	
</div>
</form> <br>
</c:if>
</div>

<div align="right">

총 유저수 : ${ap.total} &nbsp;

	<!-- 전체, 일반회원, 탈퇴회원 카테고리 네비 -->
			<c:if test="${state == 0 }">
			<ul class="nav nav-tabs" role="tablist">
    			<li class="active"><a href="adminusers.manager" >전체</a></li>
   			    <li><a href="adminusers.manager?state=1">일반회원</a></li>
    			<li><a href="adminusers.manager?state=2">탈퇴회원</a></li>
  			</ul>
  			</c:if>
  			
  			<c:if test="${state == 1 }">
			<ul class="nav nav-tabs" role="tablist">
    			<li><a href="adminusers.manager" >전체</a></li>
   			    <li class="active"><a href="adminusers.manager?state=1">일반회원</a></li>
    			<li><a href="adminusers.manager?state=2">탈퇴회원</a></li>
  			</ul>
  			</c:if>
  			
  			<c:if test="${state == 2 }">
			<ul class="nav nav-tabs" role="tablist">
    			<li><a href="adminusers.manager" >전체</a></li>
   			    <li><a href="adminusers.manager?state=1">일반회원</a></li>
    			<li class="active"><a href="adminusers.manager?state=2">탈퇴회원</a></li>
  			</ul>
  			</c:if>
</div>
			<table class="table table-striped">
				<thead>
					<tr>
						<th>번호</th>
						<th>ID</th>
						<th>닉네임</th>
						<th>가입일</th>
						<th>일반회원·탈퇴회원</th>
						<th>누적신고수</th>
					</tr>
				</thead>
				<tbody>
				<c:if test="${empty memberlist}">
				<tr>
					<th colspan="5" align="center">데이터가 없습니다</th>
				</tr>
				</c:if>
					
					<c:if test="${not empty memberlist}">
					<c:set var="num" value="${num }"></c:set>
					<c:forEach var="member" items="${memberlist}">
						<tr>
							<td><c:out value="${num }"></c:out> <c:set var="num"
									value="${num-1 }"></c:set></td>
							<td><a href="adminuserinfo.manager?id=${member.id }&pageNum=${ap.currentPage}"
								class="btn btn-default">${member.id}</a></td>
							<td>${member.nick }</td>
							<td><fmt:formatDate value="${member.register}"
									pattern="yyyy-MM-dd a HH:mm:ss EEE요일" /></td>
							
							<c:if test="${member.state == 1 }">
							<td>일반회원</td>
							</c:if>
							<c:if test="${member.state == 2 }">
							<td>탈퇴회원</td>
							</c:if>
							<td>${member.singo_count}</td>
						</tr>
					</c:forEach>
					</c:if>
				</tbody>
			</table>

			<ul class="pagination">
			<!-- 검색 했을 경우의 페이징 처리 -->
			 <c:if test="${not empty keyword and state == 0}">
			<li><a href="adminusers.manager?pageNum=1&search=${search}&keyword=${keyword}">첫번째 페이지</a></li>
				<c:if test="${ap.currentPage > 1 }">
					<li><a
						href="adminusers.manager?pageNum=${ap.currentPage - 1}&search=${search}&keyword=${keyword}">이전</a></li>
				</c:if>
				<c:forEach var="i" begin="${ap.startPage}" end="${ap.endPage}">
					<li <c:if test="${ap.currentPage==i}">class="active"</c:if>><a
						href="adminusers.manager?pageNum=${i}&search=${search}&keyword=${keyword}">${i}</a></li>
				</c:forEach>
				<c:if test="${ap.currentPage < ap.totalPage}">
					<li><a
						href="adminusers.manager?pageNum=${ap.currentPage + 1}&search=${search}&keyword=${keyword}">다음</a></li>
				</c:if>
				<li><a href="adminusers.manager?pageNum=${ap.totalPage }&search=${search}&keyword=${keyword}">마지막 페이지</a></li>
			</c:if>
			
				<!-- 전체 목록의 페이징 처리 -->
				<c:if test="${empty keyword and  state == 0}">
					<li><a href="adminusers.manager?pageNum=1">첫번째 페이지</a></li>
					<c:if test="${ap.currentPage > 1 }">
						<li><a
							href="adminusers.manager?pageNum=${ap.currentPage - 1}">이전</a></li>
					</c:if>
					
					<c:forEach var="i" begin="${ap.startPage}" end="${ap.endPage}" step="1">
						<li <c:if test="${ap.currentPage==i}">class="active"</c:if>>
							<a href="adminusers.manager?pageNum=${i}">${i}</a>
						</li>
					</c:forEach>
					
					<c:if test="${ap.currentPage < ap.totalPage }">
						<li><a
							href="adminusers.manager?pageNum=${ap.currentPage + 1}">다음</a></li>
					</c:if>
					<li><a href="adminusers.manager?pageNum=${ap.totalPage }">마지막
							페이지</a></li>
				</c:if>
				
				<!-- state가 1일때 검색 -->
				<c:if test="${not empty keyword and state==1}">
			<li><a href="adminusers.manager?pageNum=1&search=${search}&keyword=${keyword}&state=1">첫번째 페이지</a></li>
				<c:if test="${ap.currentPage > 1 }">
					<li><a
						href="adminusers.manager?pageNum=${ap.currentPage - 1}&search=${search}&keyword=${keyword}&state=1">이전</a></li>
				</c:if>
				<c:forEach var="i" begin="${ap.startPage}" end="${ap.endPage}">
					<li <c:if test="${ap.currentPage==i}">class="active"</c:if>><a
						href="adminusers.manager?pageNum=${i}&search=${search}&keyword=${keyword}&state=1">${i}</a></li>
				</c:forEach>
				<c:if test="${ap.currentPage < ap.totalPage}">
					<li><a
						href="adminusers.manager?pageNum=${ap.currentPage + 1}&search=${search}&keyword=${keyword}&state=1">다음</a></li>
				</c:if>
				<li><a href="adminusers.manager?pageNum=${ap.totalPage }&search=${search}&keyword=${keyword}&state=1">마지막 페이지</a></li>
			</c:if>
			
			<!-- state가 1일때 전체 목록의 페이징 처리 -->
				<c:if test="${empty keyword and state==1}">
					<li><a href="adminusers.manager?pageNum=1&state=1">첫번째 페이지</a></li>
					<c:if test="${ap.currentPage > 1 }">
						<li><a
							href="adminusers.manager?pageNum=${ap.currentPage - 1}&state=1">이전</a></li>
					</c:if>
					
					<c:forEach var="i" begin="${ap.startPage}" end="${ap.endPage}" step="1">
						<li <c:if test="${ap.currentPage==i}">class="active"</c:if>>
							<a href="adminusers.manager?pageNum=${i}&state=1">${i}</a>
						</li>
					</c:forEach>
					
					<c:if test="${ap.currentPage < ap.totalPage }">
						<li><a
							href="adminusers.manager?pageNum=${ap.currentPage + 1}&state=1">다음</a></li>
					</c:if>
					<li><a href="adminusers.manager?pageNum=${ap.totalPage }&state=1">마지막
							페이지</a></li>
				</c:if>
				
				<!-- state가 2일때 검색 -->
				<c:if test="${not empty keyword and state==2}">
			<li><a href="adminusers.manager?pageNum=1&search=${search}&keyword=${keyword}&state=2">첫번째 페이지</a></li>
				<c:if test="${ap.currentPage > 1 }">
					<li><a
						href="adminusers.manager?pageNum=${ap.currentPage - 1}&search=${search}&keyword=${keyword}&state=2">이전</a></li>
				</c:if>
				<c:forEach var="i" begin="${ap.startPage}" end="${ap.endPage}">
					<li <c:if test="${ap.currentPage==i}">class="active"</c:if>><a
						href="adminusers.manager?pageNum=${i}&search=${search}&keyword=${keyword}&state=2">${i}</a></li>
				</c:forEach>
				<c:if test="${ap.currentPage < ap.totalPage}">
					<li><a
						href="adminusers.manager?pageNum=${ap.currentPage + 1}&search=${search}&keyword=${keyword}&state=2">다음</a></li>
				</c:if>
				<li><a href="adminusers.manager?pageNum=${ap.totalPage }&search=${search}&keyword=${keyword}&state=2">마지막 페이지</a></li>
			</c:if>
			
			<!-- state가 2일때 전체 목록의 페이징 처리 -->
				<c:if test="${empty keyword and state==2}">
					<li><a href="adminusers.manager?pageNum=1&state=2">첫번째 페이지</a></li>
					<c:if test="${ap.currentPage > 1 }">
						<li><a
							href="adminusers.manager?pageNum=${ap.currentPage - 1}&state=2">이전</a></li>
					</c:if>
					
					<c:forEach var="i" begin="${ap.startPage}" end="${ap.endPage}" step="1">
						<li <c:if test="${ap.currentPage==i}">class="active"</c:if>>
							<a href="adminusers.manager?pageNum=${i}&state=2">${i}</a>
						</li>
					</c:forEach>
					
					<c:if test="${ap.currentPage < ap.totalPage }">
						<li><a
							href="adminusers.manager?pageNum=${ap.currentPage + 1}&state=2">다음</a></li>
					</c:if>
					<li><a href="adminusers.manager?pageNum=${ap.totalPage }&state=2">마지막
							페이지</a></li>
				</c:if>
			
			</ul>
		</div>





		<jsp:include page="../footer.jsp"></jsp:include>
	</div>

</body>
</html>