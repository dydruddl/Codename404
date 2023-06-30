<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="head.jsp"%>

<!DOCTYPE html>
<html>
<head>
<title>Study 상세</title>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<!-- ajax 를 사용하기 위한 링크  -->

<!-- style.css -->
<link rel="stylesheet" type="text/css" href="./css/free_writestyle.css" />

<!-- free_writestyle.css -->
<link rel="stylesheet" type="text/css"
	href="./css/study/free_writestyle.css" />

<script>
	// 각 게시판의 글번호와 카테고리번호를 가지고 넘어가야될듯.
	$(document)
			.ready(
					function() {
						var popupX = ((window.screen.width - 600) / 2);
						var popupY = ((window.screen.height - 400) / 2);
						$("#singo_popup")
								.on(
										'click',
										function() {
											window
													.open(
															"studyReport.study?study_no=${studyBoard.study_no}&category_no=${studyBoard.category_no}&pageNum=${pageNum}",
															"신고창",
															"resizeable=no, location=0, status=0, width=600, height=650, left="
																	+ popupX
																	+ ", top="
																	+ popupY);
										});
					});
</script>
<script type="text/javascript">
	/*  window.onload=function() {} */
	$(function() {
		$('#study_relist').load('study_relist?study_no=${studyBoard.study_no}') // load -> 화면에 출력하기 위한
		//		$('#list').load('${path}	/list/pageNum/${pageNum}');

		$('#repInsert').click(function() { // 아래에 id="repInsert" ajax 사용하기 위해
			//			alert("출력 확인");  	  // 상자 박스 출력
			//	    	console.log('출력 확인'); // 콘솔창 출력, 구글에 F12 눌러서 확인
			// 아래의 댓글 삽입, id 명과 동일
			if ($('#study_replytext').val() == "") {
				alert('댓글 입력후에 클릭하시오');
				$('#study_replytext').focus();
				return false;
			}
			// 방법1	
			var frmData = $('#frm1').serialize(); // frm: 댓글 폼의 이름 // serialize() '#해당아이디'에 있는 모든 값을 불러오는 편리한 함수
			// 방법2
			//var frmData = 'replyer='+frm.replyer.value+'&bno='+
			//              frm.bno.value+'&replytext='+frm.replytext.value;  

			// 방법3
			/*  
			 var frmData = {
			 "study_replytext": $("#study_replytext").val(),
			 "study_no": $("#study_no").val(),
			 "study_re_nick": $("#study_re_nick").val()
			 } 
			 */
			$.post('repStudyInsert.study', frmData, function(data) {
				$('#study_relist').html(data); // html 파일(실제 보이는 화면)로 data 를 불러온다.
				$('#study_replytext').val(""); // 댓글창을 다시 빈공간으로 초기화 시켜준다.
			});
		});
	});
</script>
</head>

<body>

	<!-- 전체 프레임 -->
	<div id="frame">

		<!------------------------------ 네비게이션 바/부트스트랩 ------------------------------>
		<jsp:include page="../navigator.jsp"></jsp:include>

		<h1 class="headline">Study</h1>

		<%-- 모집완료/삭제 버튼 --%>
		<div class="button-container" align="center">
			<c:if test="${studyBoard.study_nick == memberModel.nick}">
				<%-- 모집완료 버튼 --%>
				<a
					href="studyMozip.study?study_no=${studyBoard.study_no}&pageNum=${pageNum}"
					type="button" class="btn btn-primary"> <svg
						xmlns="http://www.w3.org/2000/svg" width="16" height="16"
						fill="currentColor" class="bi bi-calendar-check"
						viewBox="0 0 16 16">
	    <path
							d="M10.854 7.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L7.5 9.793l2.646-2.647a.5.5 0 0 1 .708 0z"></path>
	    <path
							d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z"></path>
    </svg>&nbsp;모집완료
				</a>&nbsp;
			</c:if>
		</div>
		<%-- 모집완료/삭제 버튼 end --%>

		<form action="studyView.study">

			<%-- hidden 으로 값 넘김 --%>
			<input type=hidden value=${studyBoard.study_no } name=study_no>
			<input type=hidden value=${pageNum } name=pageNum> <br>
			<%-- <li class="list-group-item list-group-item-primary"> --%>
			<ul class="list-group" align="center">
				<li class="list-group-item list-group-item-success">종료일이 지나면
					자동으로 모집완료로 변경됩니다.</li>
			</ul>

			<c:if test="${studyBoard.study_mozip == 1}">
				<div class="alert alert-danger" role="alert">이미 모집완료된 글입니다!</div>
			</c:if>

			<label for=nick>작성자</label>

			<!-- 로그인 추가 -->
			<input type=text value="${studyBoard.study_nick }" name="study_nick"
				readonly>

			<p>
				<label for="title">제목</label> <input type=text
					value=${studyBoard.study_subject } readonly>
			<p>
				<label for="content">내용</label>
				<textarea style='resize: none;' cols="2" rows="10"
					id="study_content" name="study_content" readonly>${studyBoard.study_content}
				</textarea>
				<br>
			<div class="btn-group btn-group-lg" role="group">
				<button type="button" class="btn btn-outline-dark">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 시작일 :
					${studyBoard.study_start_date}
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
			</div>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<div class="btn-group btn-group-lg" role="group">
				<button type="button" class="btn btn-outline-dark">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 종료일 :
					${studyBoard.study_end_date}
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
			</div>

			<%-- 댓글 목록/수정/삭제 버튼 --%>
			<div class="fv-button-container" align="center">

				<%-- 목록 --%>
				<a href="study_list.study?pageNum=${pageNum}" class="fv-btn-list">목록</a>
				&nbsp;&nbsp;&nbsp;

				<%-- 신고 --%>
				<c:if test="${studyBoard.study_nick != memberModel.nick }">
					<button id="singo_popup" class="fv-btn-singo">신고</button>
	&nbsp;&nbsp;&nbsp;
</c:if>

				<!-- 원문 작성자에게 수정, 삭제 버튼 뜨도록! -->
				<c:if test="${studyBoard.study_nick == memberModel.nick}">
					<%-- 수정 --%>
					<a
						href="studyUpdateForm.study?study_no=${studyBoard.study_no}&pageNum=${pageNum}"
						class="fv-btn-update">수정</a>
&nbsp;&nbsp;&nbsp;

<%-- 삭제 --%>
					<%-- studyDeleteForm.study?스터디번호, 페이지 번호 --%>
					<a
						href="studyDeleteForm.study?study_no=${studyBoard.study_no}&pageNum=${pageNum}&category_no=${studyBoard.category_no}"
						class="fv-btn-delete">삭제</a>

				</c:if>
			</div>
			<br> <br> <br>

		</form>
		<p>

			<%-- 값이 잘 넘어왔는지 확인 --%>
			<%-- 
	nick : ${memberModel.nick} <br>
	study_no : ${studyBoard.study_no} <br>
--%>

			<!-- 로그인 안한 경우 댓글 입력 폼 안뜨도록 설정함 -->
			<c:if test="${!empty memberModel.id or !empty adminmodel.admin_id}">
				<%-- 댓글입력창 --%>
				<%-- 아래에 적힌 id는 ajax 에서 # 으로 사용 --%>
				<form id="frm1" name="frm1">
					<label for="reply">댓글</label>
					<textarea style='resize: none;' class="form-control" cols="2"
						rows="5" name="study_replytext" id="study_replytext"
						placeholder="로그인 후 작성 가능합니다."></textarea>
					<input type="hidden" name="study_no" id="study_no"
						value="${studyBoard.study_no}"> <input type="hidden"
						name="study_re_nick" id="study_re_nick"
						value="${memberModel.nick}">
					<!-- value="작성자" -->
					<p>
					<div align="center" class="fv-button-container">
						<button type="button" id="repInsert" class="fv-btn-ok">확인</button>
					</div>
					<br> <br> <br>
				</form>
			</c:if>
			<br> <br> <br>
		<div id="study_relist"></div>

		<!------------------------------ footer ------------------------------>
		<jsp:include page="../footer.jsp"></jsp:include>

	</div>
</body>
</html>