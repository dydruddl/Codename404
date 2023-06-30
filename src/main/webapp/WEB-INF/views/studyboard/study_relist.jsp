<!-- 
	board가 무엇인가? 
	Controller StudyBoardReplyController.java 에서 
	객체board 를 -> std_board 로 수정
-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="head.jsp"%>     

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>스터디 댓글 리스트</title>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script type="text/javascript">
	$(function() {
	    $('.edit1').click(function() { 
	       var id  = $(this).attr('id');  //  this: 많은 버튼 중 사용자가 누른 수정버튼
	       // id의 속성값 rno를 id변수로 설정
	      
	       $("#td_"+id).attr("readonly", false);
	       
	       var txt = $('#td_'+id).val(); // replytext
	       // 해당 td태그의 id값으로 댓글 내용 불러오기
	       
	       $("#td_"+id).text(txt);
	       
	       $('#btn_'+id).html( // 버튼 value를 확인, 취소로 바꿈
	    		   "<button type='button' class='btn btn-secondary' onclick='up("+id+")'>"
                   +"<svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-check-circle' viewBox='0 0 16 16'>"
                   
                   +"<path d='M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z'></path>"
                   +"<path d='M10.97 4.97a.235.235 0 0 0-.02.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05z'></path>"
                   +"</svg>" +" </button>" + "&nbsp;" + "&nbsp;"
                 
                   +"<button type='button' class='btn btn-secondary' onclick='lst()'>"
                   +"<svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-arrow-counterclockwise' viewBox='0 0 16 16'>"
                   +"<path fill-rule='evenodd' d='M8 3a5 5 0 1 1-4.546 2.914.5.5 0 0 0-.908-.417A6 6 0 1 0 8 2v1z'></path>"
                   +"<path d='M8 4.466V.534a.25.25 0 0 0-.41-.192L5.23 2.308a.25.25 0 0 0 0 .384l2.36 1.966A.25.25 0 0 0 8 4.466z'></path>"
                   +"</svg>" +"</button>");
	    });
	 });
 
	 function up(id) { // 확인 버튼 눌렀을 때 
	    var study_replytext=$('#td_'+id).val(); // textarea 내용을 변수에 저장
	    //console.log(replytext);
	    var formData="study_rno="+id+"&study_replytext="+study_replytext+"&study_no=${std_board.study_no}";
	             
	    $.post('repStudyUpdate',formData, function(data) { // 댓글 내용 수정하는 요청
	       $('#study_relist').html(data); // 수정된 data 출력
	    });
	 }
 
	 function lst() { // 취소버튼 눌렀을 때
	    $('#study_relist').load('study_relist?study_no=${std_board.study_no}'); 
	 }
	 
	 function del(study_rno,study_no) { // 삭제 버튼 눌렀을 때
	    var formData="study_rno="+study_rno+"&study_no="+study_no;
	    $.post("repStudyDelete",formData, function(data) {
	       $('#study_relist').html(data);
	    });
	 }
	</script>
</head>

<form class="form-inline">
<div class="card mb-2">
   <div class="card-body">
      <ul class="list-group list-group-flush">
   <c:if test="${not empty study_relist }">
   
   <c:forEach var="sbr" items="${study_relist}"><p>
          <li class="list-group-item">
         <div class="form-inline mb-2">
            <label for="study_re_nick"><span class="glyphicon glyphicon-user"></span></label>
            <input type="text" class="form-control ml-2" id="study_re_nick" value="${sbr.study_re_nick }" readonly>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <label for="study_regdate"><span class="glyphicon glyphicon-calendar"></span></label>
            <input type="text" readonly class="form-control ml-2" id="study_regdate" value="<fmt:formatDate value= "${sbr.study_regdate }" pattern = "yyyy-MM-dd"/>">
         </div>
         
         <label for="study_replytext"></label>
         <!-- <input type="text" style="width:565px;height:80px;" id="td_${qbr.qna_rno}" value="${qbr.qna_replytext }" readonly> -->
         <textarea style='resize:none;' id="td_${sbr.study_rno }" name="study_replytext" readonly>${sbr.study_replytext}</textarea>
          
         <p>
         <!-- 댓글 작성자는 본인 댓글 수정, 삭제 가능하게 설정 -->
         <c:if test="${memberModel.nick==sbr.study_re_nick or !empty adminmodel.admin_id}" >
         <div id="btn_${sbr.study_rno}">
             <button type="button" class="btn btn-secondary edit1" id="${sbr.study_rno}" >
                   <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
                 <path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"></path></svg>
                 </button>&nbsp;
                <button type="button" class="btn btn-secondary" onclick="del(${sbr.study_rno},${sbr.study_no})">
                   <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3" viewBox="0 0 16 16">
                 <path d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5ZM11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H2.506a.58.58 0 0 0-.01 0H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1h-.995a.59.59 0 0 0-.01 0H11Zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5h9.916Zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47ZM8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5Z"></path></svg>
                 </button>
                 </div>
            </c:if>
          </li>
          <p>
         </c:forEach>
         </c:if>
      </ul>
   </div>
</div>
</form>
</body>
</html>