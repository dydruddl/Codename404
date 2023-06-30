<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function() {
    $('.edit1').click(function() {  // 수정버튼 클릭 시
    
       var id  = $(this).attr('id');  //  this: 많은 버튼 중 사용자가 누른 수정버튼
       // id의 속성값 rno를 id변수로 설정
       
       $("#td_"+id).attr("readonly",false);
       
       var txt = $('#td_'+id).val(); // replytext
       // 해당 td태그의 id값으로 댓글 내용 불러오기
       console.log(txt);
       
//      $('#td_'+id).html("<textarea id='tt_"+id+"'>"+txt+"</textarea>" ); // 내용을 textarea에 추가
       $('#td_'+id).text(txt); // 내용을 textarea에 추가
       
       $('#btn_'+id).html( // 버튼 value를 확인, 취소로 바꿈
                /*  "<input type='button' value='확인' onclick='up("+id+")'> "
                +"<input type='button' value='취소' onclick='lst()'>"); */
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
 //   let qna_replytext = $('#tt_'+id).val(); // textarea 내용을 변수에 저장
//    console.log("tt_id:"+ $('#tt_'+id) );
  var qna_replytext = $('#td_'+id).val();
    console.log("id:"+ id );
    console.log("qna_replytext:"+ qna_replytext );
    console.log("qna_bno:"+ ${board.qna_no});
    //console.log(replytext);
    var formData = "qna_rno="+id+"&qna_replytext="+qna_replytext +"&qna_bno=${board.qna_no}";
             
    $.post('repUpdate',formData, function(data) { // 댓글 내용 수정하는 요청
       $('#qna_relist').html(data); // 수정된 data 출력
    });
 }
 
 function lst() { // 취소버튼 눌렀을 때
    $('#qna_relist').load('qna_relist?qna_no=${board.qna_no}'); 
 }
 
 function del(qna_rno,qna_bno) { // 삭제 버튼 눌렀을 때
    var formData="qna_rno="+qna_rno+"&qna_bno="+qna_bno;
    $.post("repDelete",formData, function(data) {
       $('#qna_relist').html(data);
    });
 }
</script> 
</head>
<body>




<form class="form-inline">
<div class="card mb-2">
   <div class="card-body">
      <ul class="list-group list-group-flush">
   <c:if test="${not empty qna_relist }">
   
   <c:forEach var="qbr" items="${qna_relist}"><p>
          <li class="list-group-item">
         <div class="form-inline mb-2">
            <label for="qna_re_nick"><span class="glyphicon glyphicon-user"></span></label>
            <input type="text" class="form-control ml-2" id="qna_re_nick" value="${qbr.qna_re_nick }" readonly>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <label for="qna_regdate"><span class="glyphicon glyphicon-calendar"></span></label>
            <input type="text" readonly class="form-control ml-2" id="qna_regdate" value="<fmt:formatDate value= "${qbr.qna_regdate }" pattern = "yyyy-MM-dd"/>">
         </div>
         
         <c:if test="${qbr.qna_re_sol==1 }"><img width="20" height="20" src="./images/check.png"><b>채택된 댓글입니다</b></c:if>
         <label for="qna_replytext"></label>
         <!-- <input type="text" style="width:565px;height:80px;" id="td_${qbr.qna_rno}" value="${qbr.qna_replytext }" readonly> -->
         <textarea style='resize:none;' id="td_${qbr.qna_rno }" name="qna_replytext" readonly>${qbr.qna_replytext}</textarea>
          
         <p>
         <!-- 댓글 작성자,관리자는 댓글 수정, 삭제 가능하게 설정 -->
         <c:if test="${memberModel.nick==qbr.qna_re_nick or !empty adminmodel.admin_id }" >
         <div id="btn_${qbr.qna_rno}">
             <button type="button" class="btn btn-secondary edit1" id="${qbr.qna_rno}" >
                   <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
                 <path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"></path></svg>
                 </button>&nbsp;
                <button type="button" class="btn btn-secondary" onclick="del(${qbr.qna_rno},${qbr.qna_bno})">
                   <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3" viewBox="0 0 16 16">
                 <path d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5ZM11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H2.506a.58.58 0 0 0-.01 0H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1h-.995a.59.59 0 0 0-.01 0H11Zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5h9.916Zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47ZM8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5Z"></path></svg>
                 </button>
                 </div>
            </c:if>
                  
                  
                  
                  
            <!-- 원글 작성자에게는 댓글 채택버튼 보이게 설정 -->
			<!-- 원글 작성자가 댓글 쓴 경우 채택 버튼 안 보이게 설정 -->
			<c:if test="${memberModel.nick == board.qna_nick }">
				<c:if test="${board.qna_nick != qbr.qna_re_nick }">
					<c:if test="${qbr.qna_re_sol ==0 }"><p>
						<button type="button" class="btn btn-secondary"
							onclick="location.href='rsUpdate?qna_rno=${qbr.qna_rno}&pageNum=${pageNum }&qna_no=${qbr.qna_bno }'"
							data-toggle="tooltip" title="채택">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check-lg" viewBox="0 0 16 16">
                    				<path d="M12.736 3.97a.733.733 0 0 1 1.047 0c.286.289.29.756.01 1.05L7.88 12.01a.733.733 0 0 1-1.065.02L3.217 8.384a.757.757 0 0 1 0-1.06.733.733 0 0 1 1.047 0l3.052 3.093 5.4-6.425a.247.247 0 0 1 .02-.022Z"></path></svg>
						</button>
					</c:if>
					<p>
					<c:if test="${qbr.qna_re_sol ==1 }">
						<button type="button" class="btn btn-secondary"
							onclick="location.href='rsCancel?qna_rno=${qbr.qna_rno}&pageNum=${pageNum }&qna_no=${qbr.qna_bno }'"
							data-toggle="tooltip" title="채택취소">
                				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-counterclockwise" viewBox="0 0 16 16">
  									<path fill-rule="evenodd" d="M8 3a5 5 0 1 1-4.546 2.914.5.5 0 0 0-.908-.417A6 6 0 1 0 8 2v1z"></path>
 									<path d="M8 4.466V.534a.25.25 0 0 0-.41-.192L5.23 2.308a.25.25 0 0 0 0 .384l2.36 1.966A.25.25 0 0 0 8 4.466z"></path>
								</svg>
              			</button>
					</c:if>
				</c:if>
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