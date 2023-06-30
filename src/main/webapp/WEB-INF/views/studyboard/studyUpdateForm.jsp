<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="head.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
	<title>Study 수정폼</title>
	<meta charset="UTF-8">

</head>
<body>

<!-- 전체 프레임 -->
<div id="frame">

<!------------------------------ 네비게이션 바/부트스트랩 ------------------------------>
<jsp:include page="../navigator.jsp"></jsp:include> 

<h1 class="headline">Study</h1>

<form action ="studyUpdate.study" method="post">
	<input type="hidden" name="study_no" value="${studyBoard.study_no}"> 
	<input type="hidden" name="pageNum" value="${pageNum}"> 
	
	<label for="title">제목</label>
	<input type="text" id="study_subject" name="study_subject" value="${studyBoard.study_subject}" required>
	
	<label for="content">내용</label>
	<textarea id="study_content" style='resize:none;' name="study_content" rows="10" required>${studyBoard.study_content}</textarea>
	<br><br>
	
	<%-- 기간 설정 --%>	
	<button type="button" class="btn btn-outline-dark" align="center">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  		시작일: <input type="date" id="study_start_date" name="study_start_date" value="${studyBoard.study_start_date}" required>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</button>
	<button type="button" class="btn btn-outline-dark" align="center">
  		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  		종료일: <input type="date" id="study_end_date" name="study_end_date" value="${studyBoard.study_end_date}" required>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</button>
	<br><br>
	
	<div class="button-container">
		<button type="submit">수정</button>
		<!-- <button id="cancel">취소</button> -->
		<input type="button" id="cancel" onClick="history.go(-1)" value="취소">
	</div><br><br><br>
</form>

<script>
	$(document).ready(function() {
		$("form").on("submit", function() {
		    var studyStartDate = new Date($("#study_start_date").val());
		    var studyEndDate = new Date($("#study_end_date").val());
		    var sysdate = new Date();

		    if (studyEndDate < studyStartDate) {
		      alert("종료일을 시작일보다 크게 설정해주세요.");
		      $("#study_start_date").focus();
		      return false;
		    }
		    if (studyStartDate <= sysdate) {
		      alert("시작일은 오늘 이후부터만 설정 가능합니다.");
		      return false;
		    }
		  });
		});
</script>
<!------------------------------ footer ------------------------------>
<jsp:include page="../footer.jsp"></jsp:include>

</div>
<!-- 전체 프레임 end -->

</body>
</html>