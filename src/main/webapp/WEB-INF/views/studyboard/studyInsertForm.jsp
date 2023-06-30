<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
	<title>Study 입력폼</title>
	<meta charset="UTF-8">
	
	<!-- style.css -->
    <link rel="stylesheet" type="text/css" href="./css/study/study_writestyle.css" />
    
</head>
<body>

<!-- 전체 프레임 -->
<div id="frame">
    
<!------------------------------ 네비게이션 바/부트스트랩 ------------------------------>
<jsp:include page="../navigator.jsp"></jsp:include>     
    
<h1 class="headline">Study</h1>

<form action ="studyInsert.study" method="post">
	<input type="hidden" id="study_nick" name="study_nick" value="${memberModel.nick}">
	
	<label for="title">제목</label>
	<input type="text" id="study_subject" name="study_subject" required>

	<label for="content">내용</label>
	<textarea style='resize:none;'class="form-control" cols="2" rows="10" id="study_content" name="study_content" required></textarea>
	<br><br>
	
	<%-- 기간 설정 --%>
	<button type="button" class="btn btn-outline-dark" align="center">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		시작일: <input type="date" id="study_start_date" name="study_start_date" required>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</button>
	<button type="button" class="btn btn-outline-dark" align="center">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		종료일: <input type="date" id="study_end_date" name="study_end_date" required>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</button>
	<br><br>
<%--
	<label for="startDate">시작일: </label>
  	<input type="date" id="study_start_date" name="study_start_date" required>

  	<label for="endDate">종료일: </label>
  	<input type="date" id="study_end_date" name="study_end_date" required>
--%>  	
	<div class="button-container">
		<button type="submit">작성</button>
		<input type="button" id="cancel" onClick="history.go(-1)" value="취소">
		<%-- <button id="cancel">취소</button> --%>
	</div><br><br><br><br><br>
</form>

<%-- 종료일/시작일 설정 --%>
<%-- 
<c:if test="${study_end_date < study_start_date}">
	<script>
		alert("종료일을 시작일보다 크게 설정해주세요.");
	</script>
</c:if>
--%>

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
</div>
</body>
</html>