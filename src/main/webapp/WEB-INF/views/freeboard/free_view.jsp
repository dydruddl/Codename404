<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="free_head.jsp" %>
<!DOCTYPE html>
<html>
<head>
<!-- 반응형 웹 -->
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no">

<script>
// 각 게시판의 글번호와 카테고리번호를 가지고 넘어가야될듯.
 $(document).ready(function() {
 			var popupX = ((window.screen.width-600)/2);
           var popupY = ((window.screen.height-400)/2);
            $("#singo_popup").on('click', function(){
                window.open("report.free?free_no=${freeboard.free_no}&category_no=${freeboard.category_no}&pageNum=${pageNum}", "신고창", "resizeable=no, location=0, status=0, width=600, height=650, left="+popupX+", top="+popupY);
            });
}); 
</script>

<script type="text/javascript">
	$(function() {
		$('#free_relist').load('free_relist.free?free_no=${freeboard.free_no}')

		$('#reinsert').click(function() {

			if ($("#free_replytext").val() == "") {
				alert("댓글 입력 후 클릭하시오");
				$("#free_replytext").focus();
				return false;
			}

			var frmData = $('#myform').serialize();
			// var frmData = 'replyer='+frm.replyer.value+'&bno='+
			//				  frm.bno.value+'&replytext='+frm.replytext.value;				  
			$.post('reinsert.free', frmData, function(data) {
				$('#free_relist').html(data);
				$("#free_replytext").val("");
			});
		});
	});
</script>


<script type="text/javascript">
	$(function() {
		$('#free_list').load('free_list.free?pageNum=${pageNum}');
	});

	function del(free_no, pageNum) {
		var result = confirm("삭제 하시겠습니까?");
		if (result) {
			location.href = "redelete.free?free_no=" + free_no + "&pageNum="
					+ pageNum;
		}
	}
</script>
<!-- style.css -->
<link rel="stylesheet" type="text/css" href="./css/free_style.css" />

</head>
<body>

	<!-- 전체 프레임 -->
	<div id="frame">
		
		<!-- navigator -->
		<jsp:include page="../navigator.jsp"></jsp:include>



		<!-- 헤더 밑 이름 -->
		<h1 class="headline">FreeBoard</h1>

			<form>
				<input type=hidden value=${freeboard.free_no } name=free_no>
				<input type=hidden value=${pageNum } name=pageNum>
		
				<label for=nick>작성자</label> <input type=text
					value=${freeboard.free_nick } readonly>
				<p>
					<label for="title">제목</label> <input type=text
						value=${freeboard.free_subject } readonly>
				<p>
					<label for="content">내용</label>
					<textarea style='resize: none;' cols="2" rows="10"
						id="free_content" name="free_content" readonly>${freeboard.free_content }</textarea>
				<div class="fv-button-container">
					<a href="free_list.free?pageNum=${pageNum}" class="fv-btn-list">목록</a>

					<!-- 작성자 및 관리자 아닐 시 신고버튼  -->
					<c:if test="${freeboard.free_nick != memberModel.nick and empty adminmodel.admin_nick}">
						<button id="singo_popup" class="fv-btn-singo" >신고</button>
					&nbsp;&nbsp;&nbsp;
					</c:if>

					<!-- 원문 작성자에게만 수정, 삭제 버튼 보이게 -->
					<c:if test="${freeboard.free_nick == memberModel.nick or !empty adminmodel.admin_nick}">
					<a href="free_update.free?free_no=${freeboard.free_no}&pageNum=${pageNum}"
						class="fv-btn-update">수정</a> 
					<a href="free_delete.free?free_no=${freeboard.free_no}&pageNum=${pageNum}&category_no=${freeboard.category_no}"
						class="fv-btn-delete">삭제</a>
					</c:if>
				</div>
				<p>
			</form>
			<!-- 로그인 안한 경우 댓글 입력 폼 안뜨도록 설정-->
			<c:if test="${!empty memberModel.id}" >
			<form id="myform">
				<!-- 댓글입력창 -->
				<label for="reply">댓글</label>
				<textarea style='resize: none;' class="fv-form-control" cols="2"
					rows="5" name="free_replytext" id="free_replytext"></textarea>
				<input type="hidden" name="free_no" value="${freeboard.free_no}">
				<input type="hidden" name="free_re_nick" value="${memberModel.nick}">
				<p>
				<div align=center>
					<button type="button" id="reinsert" class="fv-btn-ok">확인</button>
				</div>
			</form>
			</c:if>
			<br><br><br>

			<div id="free_relist"></div>
</div>
		</body>
</html>