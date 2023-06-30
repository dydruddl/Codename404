<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지게시판 수정페이지</title>
<jsp:include page="../bootstrap.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="../navigator.jsp"></jsp:include>
	<div class="container" align="center">
		<h2 class="text-primary">게시글 수정</h2>
		<br>
		<form
			action="notice_Update.notice?notice_no=${noticeboard.notice_no}&pageNum=${pageNum}"
			method="post" class="form-group">
			<table class="table table-bordered">
				<tr>
					<td align="center"><h4 class="text-primary">글 제목</h4></td>
					<td><input name="notice_subject" id="notice_subject" size="40" 
						class="form-control" value="${noticeboard.notice_subject }"  required="required"/></td>
				</tr>
				<tr>
					<td align="center"><h4 class="text-primary">글 내용</h4></td>
					<td><textarea style="resize: none;" cols="40" rows="10" name="notice_content" class="form-control"
							id="notice_content" required="required">${noticeboard.notice_content }</textarea></td>
				</tr>
				<tr>
					<!-- 페이지 가지고 가야됨 -->
					<td colspan="2" align="center">
					 <!-- Trigger the modal with a button -->
						<button type="button" class="btn btn-warning" data-toggle="modal"
							data-target="#myModal">수정</button> 
						<a href="notice_View.notice?pageNum=${pageNum}&notice_no=${noticeboard.notice_no}">
							<button type="button" class="btn btn-info">뒤로</button></a>	
							<!-- Modal -->
						<div class="modal fade" id="myModal" role="dialog">
							<div class="modal-dialog">
							
								<!-- Modal content-->
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<h4 class="modal-title">게시글 수정여부</h4>
									</div>
									<div class="modal-body">
										<p>정말 수정 하시겠습니까?</p>
									</div>
									<div class="modal-footer">
										<!-- 페이지 갖고 가야되는데 아직 안함. -->

										<button type="submit" class="btn btn-warning">확인</button>
										<button type="button" class="btn btn-default"
											data-dismiss="modal">취소</button>
									</div>
								</div>
								
							</div>
						</div></td>
				</tr>
			</table>
		</form>

	</div>
	<div>
		<jsp:include page="../footer.jsp"></jsp:include>
	</div>
</body>
</html>