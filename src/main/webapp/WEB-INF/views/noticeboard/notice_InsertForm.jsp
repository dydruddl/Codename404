<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지게시판 입력폼</title>
</head>
<body>
	<jsp:include page="../navigator.jsp"></jsp:include>
	<div class="container" align="center">
			<h2 class="text-primary">공지 게시글 입력</h2>
			<br>
		<form action="notice_Insert.notice" method="post" class="form-group">
		<table class="table table-bordered">
			<tr>
			<td><h4 class="text-primary">제목</h4></td>
			<td>
			<input type="text" name="notice_subject" class="form-control" required="required">
			</td></tr>
			<tr>
			<td><h4 class="text-primary">내용</h4></td>
			<td>
			<pre><textarea style="resize: none;" rows="10" cols="2" name="notice_content" class="form-control" required="required"></textarea></pre>
			</td></tr>
			</table>
			<div>
			<button type="submit" class="btn btn-success">작성</button>&nbsp;&nbsp;&nbsp; 
			<button class="btn btn-danger" onClick="history.go(-1)">취소</button>
			</div>
		</form>
		</div>
		<!-- footer -->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>