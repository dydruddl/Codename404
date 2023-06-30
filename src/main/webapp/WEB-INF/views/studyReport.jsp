<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 팝업창</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!-- Bootstrap JS -->
	<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script> -->
</head>
<body>
<!-- 굳이 복합키 안쓰고 카테고리들로 if걸어서 mapper에서 (예를들어 카테고리 1일때 자유게시판테이블에서 지움.) -->
		<!-- 신고버튼을 눌렀을때 컨트롤러에 가서  같은 id로 신고버튼 같은글에 누르면 controller처음에 select -->
		<!-- 신고게시판에서 그 글의 카테고리와 글넘버 가지고 select해서 count가 0보다 크면 이미 신고한 글입니다 출력. -->
		
		<!-- 신고 제출 controller에서 다 처리한다음 다시 글 상세페이지로 돌아간다. ex) redirect:/ 상세페이지 ? 글번호-->
		<!-- 0. 신고 게시판에 카테고리와 글번호 글의 작성자 작성일 신고횟수 +1 을 insert한다. -->
		<!-- 1. 신고 사유 게시판에 아래 값들 가지고 insert -->
		<!-- 2. 회원 singo_count에 +1 -->
		
		<!-- 신고 글삭제할때 -->
		<!-- 같은 카테고리와 글번호를 가지고 그 글 삭제후 댓글 게시판도 그 글번호를 가지고 다 삭제!! -->
		
		<!-- 회원 강퇴 시킬때 닉네임으로 모두 cascade속성걸어 한꺼번에 다 삭제 해야될듯. -->
		<!-- 신고 테이블과 신고사유 테이블도 각각 foriegn키로 닉네임 받아 다같이 삭제 해야될듯. -->
		
		
		<!-- 닉네임을 disabled 속성으로 못바꾸게 하고 글번호와 글 카테고리 넘버값을 hidden으로 넘긴다. -->
		<!-- <input type="text" class="form-control" id="reportContent" placeholder="신고 내용을 입력하세요"> -->
<div class="container mt-5">
		<h1 class="text-center mb-4">신고창</h1>
		
		<form action="studyreportaccess.study" method="post">
			
			<input type="hidden" name="study_no" value="${studyboard.study_no}">
			<input type="hidden" name="category_no" value="${studyboard.category_no}">
			<input type="hidden" name="study_nick" value="${studyboard.study_nick}">
			<input type="hidden" name="study_subject" value="${studyboard.study_subject}">
			<%-- <input type="hidden" name="qna_register" value="${qnaboard.qna_register}"> --%>
		
			<div class="form-group">
				<label for="reportNick">작성자 닉네임</label>
				<input type="text" class="form-control" id="reportNick" name="report_nick" value="${membernick}"
				readonly="readonly">
			</div>
			<div class="form-group">
				<label for="report_reason">신고 이유</label>
				
				<select id="report_reason" class="form-control" name="report_reason">
					<option value="부적절한 내용">부적절한 내용</option>
					<option value="욕설">욕설</option>
					<option value="기타 사유">기타 사유</option>
				</select>
			</div>
			<div class="form-group">
				<label for="report_con">신고 내용</label>
				<textarea style='resize: none;' class="form-control" id="report_con" name="report_content" rows="10" cols="20" placeholder="신고 내용을 입력하세요" required="required"></textarea>
			</div>
			<div align="center">
			<input type="submit" class="btn btn-danger" value="신고제출"/>
			<button id="close-button" class="btn btn-secondary" onclick="window.close()">닫기</button>
			</div><br>
		</form>
	</div>

	

</body>
</html>