<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
  <head>
    <!-- 반응형 웹 -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
</head>
<body>

<!-- 전체 프레임 -->
<div id="frame">
    
<!-- 네비게이션 바/부트스트랩 --> 
<jsp:include page="../navigator.jsp"></jsp:include> 



<!-- 헤더 밑 이름 -->
<h1 class="headline">Q&amp;A</h1>
  <body>
     
    <form action ="qnaInsert.qna" method="post">
    <input type="hidden" id="qna_nick" name="qna_nick" value="${memberModel.nick}"> 
      <label for="title">제목</label>
      	<input type="text" id="qna_subject" name="qna_subject" required>
      <label for="content">내용</label>
      	<textarea style='resize:none;'class="form-control" cols="2" rows="10" id="qna_content" name="qna_content"  required></textarea>
      
      <div class="button-container">
      	<button type="submit">작성</button>
      	<!-- <button id="cancel">취소</button> -->
        <input type="button" id="cancel" onClick="history.go(-1)" value="취소">
	<p>
	<p>
    </div>

    </form>
  </body>
  
  
  </div>
</html>