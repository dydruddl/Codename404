<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>singo Board</title>

<jsp:include page="../bootstrap.jsp"></jsp:include>

</head>
<body>                                                      <!-- 매핑값 전부 singo테이블로 바꿔줘야됨!!!!!! -->
<div id="frame">
<jsp:include page="../navigator.jsp"></jsp:include>
   <!------------------------------ 전체 프레임 ------------------------------>
            
<!-- 검색 기능 -->

<div class="container" align="center">
         <form action="singo_list.singo">
            <h2>신고글 게시판</h2>
            <p>회원 신고글 리스트</p>
            <input type="hidden" name="pageNum">
</form> <br>

<div align="right">
총 글개수 : ${ap.total}
&nbsp;  <a href="adminusers.manager"><button class="btn btn-success">회원관리</button></a>
 &nbsp;
<a href="singo_list_all.singo"><button class="btn btn-danger">전체신고글</button></a>
</div>  <br>
      
  <table class="table table-striped">
    <thead>
      <tr>  
   <th>글번호</th>
   <th>카테고리</th>
   <th>제목</th>
   <th>작성자</th>
   <th>작성일</th>
   <th></th>
   <th></th>   
   <th>신고수</th>
      </tr>
    </thead>
    <tbody>
        <c:if test="${empty singolist}">
        <tr>
         <th colspan="5" align="center">데이터가 없습니다</th>
        </tr>
      </c:if>
      <c:if test="${not empty singolist}">
         <c:set var="num" value="${num }"></c:set>
            <c:forEach var="singoli" items="${singolist}">
               <tr>
               <td><c:out value="${num }"></c:out> <c:set var="num"
                           value="${num-1 }"></c:set></td>
               <td><c:choose>
               <c:when test="${singoli.category_no == 1}">자유</c:when>
               <c:when test="${singoli.category_no == 2}">Q&A</c:when>
               <c:when test="${singoli.category_no == 3}">스터디</c:when>
               </c:choose>
               </td>
                     <!-- 제목에 링크 게시물 글번호랑 페이지 가져가야됨. -->
               <td>${singoli.singo_subject}</td>
               <td>${singoli.singo_nick }</td>
               <td><fmt:formatDate value="${singoli.singoboard_date}"
                           pattern="yyyy-MM-dd a HH:mm:ss EEE요일" /></td>
               <td>   <!-- 상세페이지로 이동 -->
               <c:choose>
                    <c:when test="${singoli.category_no == 1}">
                        <a href="free_view.free?free_no=${singoli.singo_board_no}" class="btn btn-success" target="_blank">자유게시판보기</a>
                    </c:when>
                    <c:when test="${singoli.category_no == 2}">
                        <a href="qnaView.qna?qna_no=${singoli.singo_board_no}" class="btn btn-warning" target="_blank">Q&A게시판보기</a>
                    </c:when>
                    <c:when test="${singoli.category_no == 3}">
                        <a href="studyView.study?study_no=${singoli.singo_board_no}" class="btn btn-primary" target="_blank">스터디게시판보기</a>
                    </c:when>
                   </c:choose>            
               </td>
               <td>   <!-- 신고사유보기 -->
                        <a href="report_list.singo?singo_no=${singoli.singo_no}" class="btn btn-danger" target="_blank">사유리스트</a>
               </td>
                   <!-- 신고수 조회 -->
                   <td>${singoli.singo_board_count}</td> 
               </tr>
            </c:forEach>
         </c:if>
       </tbody>               
     </table>

   <!-- 스터디 게시판 컨테이너 end -->
   </div>

   <!-- footer -->
   <jsp:include page="../footer.jsp"></jsp:include>

   </div>
   <!------------------------------ 전체 프레임 end ------------------------------>

</body>
</html>