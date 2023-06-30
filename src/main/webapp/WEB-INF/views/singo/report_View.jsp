<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>	
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고사유 상세페이지</title>
<jsp:include page="../bootstrap.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="../navigator.jsp"></jsp:include>
	<div class="container" align="center">
		<h2 class="text-primary">신고사유 상세페이지</h2>

		<table class="table table-bordered">
			<tr>
				<td>신고자</td>
				<td>${reportboard.report_nick }</td>
			</tr>
			<tr>
				<td>카테고리</td>
				<td>
				<c:choose>
				<c:when test="${reportboard.category_no == 1 }">
				자유게시판
				</c:when>
				<c:when test="${reportboard.category_no == 2 }">
				Q&A게시판
				</c:when>
				<c:when test="${reportboard.category_no == 3 }">
				Study게시판
				</c:when>
				</c:choose>
				</td>
			</tr>
			<tr>
				<td>신고사유</td>
				<td>${reportboard.report_reason}</td>
			</tr>
			<tr>
				<td>신고내용</td>
				<td><pre>${reportboard.report_content }</pre></td>
			</tr>
			<tr>
				<td>신고 접수일</td>
				<td><fmt:formatDate value="${reportboard.report_date}"
						pattern="yyyy-MM-dd HH:mm:ss EEE요일" /></td>
			</tr>
		</table>
		<div><input type='button' class="btn btn-success" value=" 창닫기" onClick='window.close()'>
		</div>
	</div>
	<Br>

	<!-- footer -->
	<jsp:include page="../footer.jsp"></jsp:include>

	<script>
		$("#noticeDeleteBtn").on('click',function(e) {
			e.preventDefault();
			self.location = "notice_Delete.notice?notice_no=${noticeboard.notice_no}";
		});
	</script>
</body>
</html>