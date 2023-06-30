<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지게시판 상세페이지</title>
<jsp:include page="../bootstrap.jsp"></jsp:include>
<script>
	$(document).ready(function() {
		$('#hiderepInsert').click(function() {
			$('#demoreply').hide();
		});
		$('#showdemoreply').click(function() {
			$('#demoreply').show();
		});
	});
</script>
<script type="text/javascript">
	$(function() {

		// 기존 댓글 목록 출력 (브라우저에 로딩되자마자 실행됨)
		$('#noticereplist').load(
				'noticereply.notice?notice_no=${noticeboard.notice_no}');
		//		$('#list').load('${path}/list/pageNum/${pageNum}');
		$('#repInsert').click(function() {
			if (!frm.notice_replycontent.value) {
				alert('댓글 입력후에 클릭하시오');
				frm.notice_replycontent.focus();
				return false;
			}
			var frmData = $('#frm').serialize();
			// serialize()함수를 자바스크립트 방식으로 풀어쓰면 아래의 방식이 된다.
			// var frmData = 'replyer='+frm.replyer.value+'&bno='+
			//				  frm.bno.value+'&replytext='+frm.replytext.value;
			// $.post("요청이름", "데이터 전달", "콜백함수");
			$.post('noticereplyinsert.notice', frmData, function(data) {
				$('#noticereplist').html(data);
				frm.notice_replycontent.value = '';
			});
		});
	});
</script>
</head>
<body>
	<jsp:include page="../navigator.jsp"></jsp:include>
	<div class="container" align="center">
		<h2 class="text-primary">게시글 상세정보</h2>

		<table class="table table-bordered">
			<tr>
				<td>작성자 닉네임</td>
				<td>${noticeboard.admin_nick }</td>
			</tr>
			<tr>
				<td>글 제목</td>
				<td>${noticeboard.notice_subject }</td>
			</tr>
			<tr>
				<td>글 내용</td>
				<td><pre>${noticeboard.notice_content }</pre></td>
			</tr>
			<tr>
				<td>작성일</td>
				<td><fmt:formatDate value="${noticeboard.notice_date}"
						pattern="yyyy-MM-dd HH:mm:ss EEE요일" /></td>
			</tr>
			<tr>
				<td>조회수</td>
				<td>${noticeboard.notice_readcount}</td>
			</tr>
		</table>
		<div class="container">
			<a href="notice_list.notice?pageNum=${pageNum}"><button
					class="btn btn-primary">목록</button></a> &nbsp;&nbsp; 
				
				<c:if test="${noticeboard.admin_nick eq adminmodel.admin_nick }">
				<a href="notice_UpdateForm.notice?notice_no=${noticeboard.notice_no}&pageNum=${pageNum}">
				<button class="btn btn-info">수정</button>
			</a> &nbsp;&nbsp;

			<!-- Trigger the modal with a button -->
			<button type="button" class="btn btn-danger" data-toggle="modal"
				data-target="#myModal">삭제</button>
			
				
			<!-- Modal -->
			<div class="modal fade" id="myModal" role="dialog">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">게시글 삭제여부</h4>
						</div>
						<div class="modal-body">
							<p>정말 삭제 하시겠습니까?</p>
						</div>
						<div class="modal-footer">
							<!-- 페이지 갖고 가야되는데 아직 안함. -->

							<button type="submit" class="btn btn-danger" id="noticeDeleteBtn">확인</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">취소</button>
						</div>
					</div>
				</div>
			</div>
				
			&nbsp;&nbsp;
			</c:if>
			
			<c:choose>
			<c:when test="${!empty memberModel}">
			<button type="button" class="btn btn-success" id="showdemoreply"
				data-toggle="collapse" data-target="#demoreply"
				aria-expanded="false" aria-controls="demoreply">댓글</button>
			&nbsp;&nbsp;
			<button type="button" id="hiderepInsert" class="btn btn-warning">댓글창
				숨기기</button>
			</c:when>
			<c:when test="${!empty adminmodel}">
			<button type="button" class="btn btn-success" id="showdemoreply"
				data-toggle="collapse" data-target="#demoreply"
				aria-expanded="false" aria-controls="demoreply">댓글</button>
			&nbsp;&nbsp;
			<button type="button" id="hiderepInsert" class="btn btn-warning">댓글창
				숨기기</button>
			</c:when>
			</c:choose>
			


			<div id="demoreply" class="collapse" aria-expanded="false">
				<br>
				<form name="frm" id="frm" class="form-inline">
					<div class="form-group">
					
						<!-- 일반회원이 로그인 했을때 -->
                     <c:if test="${!empty memberModel.nick }">
                     <input type="hidden" name="notice_renick"
                     value="${memberModel.nick}">
                     </c:if>
                     <!-- 관리자가 로그인했을때 -->
                      <c:if test="${!empty adminmodel.admin_nick }">
                     <input type="hidden" name="notice_renick"
                     value="${adminmodel.admin_nick}">
                     </c:if> 
							
							<input type="hidden" name="notice_no" value="${noticeboard.notice_no}"> <label
							for="notice_replycontent">댓글 :</label>
						<textarea style='resize: none;' class="form-control" rows="3"
							cols="50" name="notice_replycontent"></textarea>
					</div>
					<button type="button" class="btn btn-primary" id="repInsert">확인</button>
				</form>
			</div>
		</div>
		<br>

		<div id="noticereplist"></div>
	</div>
	<Br>

	<!-- footer -->
	<jsp:include page="../footer.jsp"></jsp:include>

	<script>
		$("#noticeDeleteBtn")
				.on(
						'click',
						function(e) {
							e.preventDefault();
							self.location = "notice_Delete.notice?notice_no=${noticeboard.notice_no}";
						});
	</script>
</body>
</html>