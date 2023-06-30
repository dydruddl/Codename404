<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../bootstrap.jsp"></jsp:include>
<script type="text/javascript">
   $(function() {
      
      // 수정 버튼 클릭
      $('.editreply').click(function() {
         var id  = $(this).attr('id');  // rno
         
         var txt = $('#td_'+id).text(); // replytext
         
         $('#td_'+id).html("<textarea style='resize: none;' rows='3' cols='30' id='tt_"+id+"'>"+txt
            +"</textarea>");
         
         // 수정, 삭제 버튼을 확인, 취소버튼으로 수정
         $('#btn_'+id).html(
            "<input type='button' value='확인' class='btn btn-primary' onclick='up("+id+")'> "
           +"<input type='button' value='취소' class='btn btn-danger'  onclick='lst()'>");
      });
   });
   
   // 확인버튼 클릭해서 내용을 수정
   function up(id) {
      var replytext = $('#tt_'+id).val();
      var formData = "notice_rno="+id+'&notice_replycontent='+replytext
         +"&notice_no=${notice.notice_no}";
         
      // 댓글 수정 요청하는 내용
      // DTO나 List를 json형태로 값을 주고 받는데 조작을해 자바스크립트 객체 형태로 처리해야된다.
      // (지금은 아님) hello project sample.jsp에서 위 방식을 썼다.
      // view.jsp에서 load함수로 부르기 때문에 view.jsp에 있는 div id 값을 쓸 수 있다.
      $.post('noticereplyupdate.notice',formData, function(data) {
         $('#noticereplist').html(data);
      });
   }
   
   // 취소 버튼 클릭
    function lst() {
       $('#noticereplist').load('noticereply.notice?notice_no=${notice.notice_no}');
      }
    
      
   // 댓글 삭제
   function del(notice_rno,notice_no) {
      var formData="notice_rno="+notice_rno+"&notice_no="+notice_no;
      
      // 댓글 삭제 요청
      $.post("noticereplydelete.notice",formData, function(data) {
         $('#noticereplist').html(data);
      });
   }
</script>
</head>
<body>
   <div class="container" align="center">
         <c:if test="${empty noticereplist }">
         </c:if>
      <table class="table table-bordered">
         <c:if test="${not empty noticereplist }">
         <h2 class="text-primary">댓글</h2>
         <br>
         <tr>
            <th>댓글 작성자</th>
            <th>내용</th>
            <th>수정일</th>
            <th>수정·삭제여부</th>
            
         </tr>
         <c:forEach var="noticerep" items="${noticereplist}">
            <tr>
               <td>${noticerep.notice_renick}</td>
               <td id="td_${noticerep.notice_rno}">${noticerep.notice_replycontent}</td>
               <td>
               <fmt:formatDate value="${noticerep.notice_regdate }" pattern="yyyy-MM-dd HH:mm:ss EEE요일"/>
               </td>
               <td id="btn_${noticerep.notice_rno}">
                  <c:if test="${noticerep.notice_renick==memberModel.nick or !empty adminmodel.admin_nick}">                     
                      <button type="button" class="btn btn-secondary editreply" id="${noticerep.notice_rno}" >
                   <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
                 <path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"></path></svg>
                 </button>&nbsp;
                <button type="button" class="btn btn-secondary" onclick="del(${noticerep.notice_rno},${noticerep.notice_no})">
                   <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3" viewBox="0 0 16 16">
                 <path d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5ZM11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H2.506a.58.58 0 0 0-.01 0H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1h-.995a.59.59 0 0 0-.01 0H11Zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5h9.916Zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47ZM8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5Z"></path></svg>
                 </button>
                     
                     <%-- <input type="button" value="수정" class="btn btn-secondary editreply" id="${noticerep.notice_rno}">
                     <input type="button" value="삭제" class="btn btn-secondary" onclick="del(${noticerep.notice_rno},${noticerep.notice_no})"> --%>               
                  </c:if>
                  </td>
                 
                 
            </tr>
         </c:forEach>
         </c:if>
         <!-- notice.admin_nick말고 일반회원의 session nick값으로 변경해야됨 -->
      </table>
   </div>

</body>
</html>