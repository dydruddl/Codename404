<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="free_head.jsp" %>
<!DOCTYPE html>
<html>
<head>
<!-- 반응형 웹 -->
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no">

</head>
<body>

	<!-- 전체 프레임 -->
	<div id="frame">

		<!-- 네비게이션 바/부트스트랩 -->
	<!-- navigator -->
	<jsp:include page="../navigator.jsp"></jsp:include>


			<form action="insert.free" method="post">
				<h1 class="headline">FreeBoard</h1>
				<input type="hidden" id="free_nick" name="free_nick" value="${memberModel.nick }"> 
				<label for="title">제목</label> 
				<input type="text" id="free_subject" name="free_subject"> 
				<label for="content">내용</label>
				<textarea style='resize:none;' id="free_content" name="free_content" rows="10"></textarea>

				<div class="button-container">
					<button type="submit">작성</button>
					<!-- <button id="fw-cancel">취소</button> -->
					<input type="button" id="cancel"
						onClick="history.go(-1)" value="취소">
				</div>
			</form>
		</div>
</html>