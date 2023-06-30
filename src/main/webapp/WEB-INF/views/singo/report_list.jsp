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
            <input type="hidden" name="pageNum">
            <h2>신고사유 게시판</h2>
            <p>신고사유 모음!</p>
         <div class="input-group">
         </div>

<div align="right">
총 글개수 : ${bp.total}
&nbsp;<!--  <a href="singo_list.singo"><button class="btn btn-success">전체글보기</button></a>
 &nbsp;
<a href="singo_list.singo"><button class="btn btn-danger">신고받은회원</button></a>-->
</div>  <br>
      
  <table class="table table-striped">
    <thead>
      <tr>  
   <th>사유 글번호</th>
   <th>카테고리</th>
   <th>사유</th>
   <th>신고자</th>
   <th>작성일</th>
    </tr>
    </thead>
    <tbody>
        <c:if test="${empty reportList}">
        <tr>
         <th colspan="5" align="center">데이터가 없습니다</th>
        </tr>
      </c:if>
      <c:if test="${not empty reportList}">
         <c:set var="num" value="${num }"></c:set>
            <c:forEach var="reportli" items="${reportList}">
               <tr>
               <td><c:out value="${num }"></c:out> <c:set var="num"
                           value="${num-1 }"></c:set></td>
               <td><c:choose>
               <c:when test="${reportli.category_no == 1}">자유</c:when>
               <c:when test="${reportli.category_no == 2}">Q&A</c:when>
               <c:when test="${reportli.category_no == 3}">스터디</c:when>
               </c:choose>
               </td>
                     <!-- 제목에 링크 게시물 글번호랑 페이지 가져가야됨. -->
               <td>${reportli.report_reason}</td>
               <td>${reportli.report_nick }</td>
               <td><fmt:formatDate value="${reportli.report_date}"
                           pattern="yyyy-MM-dd a HH:mm:ss EEE요일" /></td>
               <td>   <!-- 신고사유보기 -->
                        <a href="report_View.singo?singo_no=${reportli.singo_no}" class="btn btn-danger" target="_blank">사유상세보기</a>
               </td>
               </tr>
            </c:forEach>
         </c:if>
       </tbody>               
     </table>
     <ul class="pagination">
     <li><a href="singo_list.singo?pageNum=1">첫번째 페이지</a></li>
               <c:if test="${bp.currentPage > 1 }">
                  <li><a
                     href="singo_list.singo?pageNum=${bp.currentPage - 1}">이전</a></li>
               </c:if>
               
               <c:forEach var="i" begin="${bp.startPage}" end="${bp.endPage}" step="1">
                  <li <c:if test="${bp.currentPage==i}">class="active"</c:if>>
                     <a href="singo_list.singo?pageNum=${i}">${i}</a>
                  </li>
               </c:forEach>
               
               <c:if test="${bp.currentPage < bp.totalPage }">
                  <li><a
                     href="singo_list.singo?pageNum=${bp.currentPage + 1}">다음</a></li>
               </c:if>
               <li><a href="singo_list.singo?pageNum=${bp.totalPage }">마지막
                     페이지</a></li>   

               </ul>
   <!-- 스터디 게시판 컨테이너 end -->
   </div>

   <!-- footer -->
   <jsp:include page="../footer.jsp"></jsp:include>

   </div>
   <!------------------------------ 전체 프레임 end ------------------------------>
</body>
</html>