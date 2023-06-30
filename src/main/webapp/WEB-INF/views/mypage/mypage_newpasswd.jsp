<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>새 비밀번호 입력</title>
<link rel="stylesheet" type="text/css"   href="./css/mypage/mypage_style.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
$(function(){
   $("form").submit(function(){
         if($("#passwd").val()==""){
               alert("비밀번호를 입력 하세요.");
               $("#passwd").focus();
               return false;
         }
         if($("#confirm-newpasswd").val()==""){
            alert("비밀번호 확인을 입력 하세요.");
            $("#confirm-newpasswd").focus();
            return false;
          }
         if($("#passwd").val() != $("#confirm-newpasswd").val()){
            alert("비밀번호가 일치하지 않습니다.");
            $("#passwd").val("").focus();
            $("#confirm-newpasswd").val("");
            return false;
         }         
   });   
});

</script>

</head>
<body>
   <div class="newpasswd-container">
      <h2>새 비밀번호 입력</h2>
      <form action="updatepasswd.my" method="post">
          <input type="hidden" name="id" value="${memberModel.id}">
         <div class="newpasswd-form-group">
            <label for="passwd">새 비밀번호:</label> 
            <input type="password"   id="passwd" name="passwd" placeholder="새 비밀번호를 입력하세요">
         </div>
         <div class="newpasswd-form-group">
            <label for="confirm-passwd">비밀번호 확인:</label> 
            <input type="password" id="confirm-newpasswd" name="confirm-newpasswd"
               placeholder="비밀번호를 다시 입력하세요">
         </div>
         <button type="submit">확인</button>
      </form>
   </div>
</body>
</html>