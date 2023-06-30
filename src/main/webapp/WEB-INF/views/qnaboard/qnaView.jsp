<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<!-- 반응형 웹 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">

<script>
// 각 게시판의 글번호와 카테고리번호를 가지고 넘어가야될듯.
 $(document).ready(function() {
 			var popupX = ((window.screen.width-600)/2);
           var popupY = ((window.screen.height-400)/2);
            $("#singo_popup").on('click', function(){
                window.open("report.do?qna_no=${qnaBoard.qna_no}&category_no=${qnaBoard.category_no}&pageNum=${pageNum}", "신고창", "resizeable=no, location=0, status=0, width=600, height=650, left="+popupX+", top="+popupY);
            });
}); 
</script>

<script type="text/javascript">
	
	$(function() {
		$('#qna_relist').load('qna_relist?qna_no=${qnaBoard.qna_no}&pageNum=${pageNum}')		
		
		$('#repInsert').click(function() {
			if($('#qna_replytext').val()==''){
				alert('내용을 입력하세요');
				$("#qna_replytext").focus();
			}
			
			var frmData = $('#frm').serialize();
			 //serialize: 폼태그 안 변수를 한 번에 구해줌 
			$.post('sInsert', frmData, function(data) {
				$('#qna_relist').html(data);
				$("#qna_replytext").val("");
			});
		});
	});
	

</script>

</head>
<body>
	<!-- 전체 프레임 -->
	<div id="frame">

		<!-- 네비게이션 바/부트스트랩 -->
		<!-- 네비게이션 바/부트스트랩 -->
<jsp:include page="../navigator.jsp"></jsp:include> 



		<!-- 헤더 밑 이름 -->
		<h1 class="headline">Q&amp;A</h1>


			<form action="qnaView.qna">
			<input type=hidden value=${qnaBoard.qna_no } name=qna_no>
			<input type=hidden value=${pageNum } name=pageNum>
				<label for=writer>작성자</label> 
				<input type=text value="${qnaBoard.qna_nick }" name="qna_nick" readonly>
				<p>
					<label for="title">제목</label> 
					<input type=text value="${qnaBoard.qna_subject }" name="qna_subject" readonly>
				<p> 
						<label for="content">내용</label>
					<textarea style='resize:none;'cols="2" rows="10" id="qna_content" name="qna_content" readonly>${qnaBoard.qna_content }</textarea>
				<div class="fv-button-container">
					<a href="qna_list.qna?pageNum=${pageNum}" class="fv-btn-list">목록</a>
					&nbsp;&nbsp;&nbsp; 
				<c:if test="${qnaBoard.qna_nick != memberModel.nick and empty adminmodel.admin_id}"><!-- 신고버튼 관리자도 보이게 -->
					<button id="singo_popup" class="fv-btn-singo">신고</button>
					&nbsp;&nbsp;&nbsp;
					</c:if>
				<!-- 원문 작성자+관리자에게 수정, 삭제 버튼 뜨도록! -->
				<c:if test="${qnaBoard.qna_nick == memberModel.nick or !empty adminmodel.admin_id}">
					<a	href="qnaUpdateForm.qna?qna_no=${qnaBoard.qna_no}&pageNum=${pageNum}"
						class="fv-btn-update">수정</a> &nbsp;&nbsp;&nbsp; 
					<a	href="qnaDeleteForm.qna?qna_no=${qnaBoard.qna_no}&pageNum=${pageNum}&category_no=${qnaBoard.category_no}"
						class="fv-btn-delete">삭제</a>
				</c:if>
				</div>
				</form>	
				<p>
				<!-- 로그인 안한 경우 댓글 입력 폼 안뜨도록 설정 + 관리자에게 입력창 보이게 설정 -->
				<c:if test="${!empty memberModel.id or !empty adminmodel.admin_id}">
				<!-- 댓글입력창 -->
				<form id="frm" name="frm">
					<label for="reply">댓글</label>
					<textarea style='resize:none;' class="form-control" cols="2" rows="5" name="qna_replytext" id="qna_replytext" placeholder="로그인 후 작성 가능합니다." ></textarea> 
						<input type="hidden" name="qna_bno" value="${qnaBoard.qna_no}">
						<input type="hidden" name="qna_re_nick"  value="${memberModel.nick }">
					<div align=center class="fv-button-container">
					<button type="button" id="repInsert" class="fv-btn-ok" >확인</button>
					</div>
				</form>
				</c:if>
				<!-- 댓글 목록 출력 -->
				<br><br><br>
				<div id="qna_relist"></div>
			
			<!-- footer -->
		<jsp:include page="../footer.jsp"></jsp:include>
			</div><!-- 전체 프레임 div -->
		</body>
		
</html>