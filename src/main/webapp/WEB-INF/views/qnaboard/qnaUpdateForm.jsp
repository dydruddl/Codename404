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

    <form action ="qnaUpdate.qna" method="post">
    <input type="hidden" name="qna_no" value="${qnaBoard.qna_no}"> 
    <input type="hidden" name="pageNum" value="${pageNum}"> 
      <label for="title">제목</label>
      <input type="text" id="qna_subject" name="qna_subject" value="${qnaBoard.qna_subject}" required>
      <label for="content">내용</label>
      <textarea style='resize:none;' id="qna_content" name="qna_content" rows="10" required>${qnaBoard.qna_content}</textarea>
      <div class="button-container">
      <button type="submit">수정</button>
      <!-- <button id="cancel">취소</button> -->
        <input type="button" id="cancel" onClick="history.go(-1)" value="취소">
    </div>

    </form>
  </body>
</html>