<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
   <meta charset="utf-8">
   <title>회원가입 페이지</title>   
   <script src="http://code.jquery.com/jquery-latest.min.js"></script>
   
   <!-- studystyle.css -->
   <link rel="stylesheet" type="text/css" href="./css/login/loginstyle.css">
</head>

<body>
<!------------------------------ 전체 프레임 ------------------------------>
   <div id="frame">
   
   <!-- 네비게이션 바/부트스트랩 -->
      <jsp:include page="../navigator.jsp"></jsp:include>

   <div class="container">
      <form action="insertMember" method="post">
         <h1>회원가입</h1>
                
         <div class="input-field">
            <input type="text" id="id" name="id" placeholder="&nbsp;이메일을 입력해주세요" required>
            <input type="button" id="idcheck" class="check" value="중복검사">
            <i class="fas fa-envelope"></i>
         </div>
         
         <div class="input-field">            
            <input type="text" id="nick" name="nick" placeholder="닉네임을 입력해주세요" required>
            <input type="button" id="nickcheck" class="check" value="중복검사">
            <i class="fas fa-user"></i>
         </div>

         <div class="input-field">
            <input type="password" id="passwd" name="passwd" placeholder="&nbsp;비밀번호를 입력해주세요" required>
            <i class="fas fa-lock"></i>
         </div>
         
         <input type="submit" id="submit" class="btn" value="회원가입" >
      </form>
   </div>
   
<!-- 외부 .js 파일 불러오기 / 이메일 비밀번호 유효성 검사 -->
<!-- <script src="./js/check.js"></script> -->

<script>
var id_check = false;
var nick_chk = false;

$(document).ready(function(){   
    $("form").on("submit", function(){
      if($("#id").val()==""){
        alert("id를 입력해주세요.");
        $("#id").focus();
        return false;
      }
      
      if($("#nickname").val()==""){
        alert("닉네임을 입력해주세요.");
        $("#nickname").focus();
        return false;
      }
      
      if($("#passwd").val()==""){
        alert("비밀번호를 입력해주세요.");
        $("#passwd").focus();
        return false;
      }
      
      if(id_check  == false){
          alert("ID중복검사 버튼을 클릭하세요.");        
          return false;
        }
      
      if(nick_chk  == false){
          alert("닉네임 중복검사 버튼을 클릭하세요.");        
          return false;
        }
    });
    
    // ID중복검사
    $("#idcheck").click(function(){
         var id = $("#id").val();
         
         function isValidId(id) {
//             var idRegex = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
			   var idRegex = /^[a-zA-Z0-9._%+-]+@(naver\.com|gmail\.com|nate\.com|daum\.net)$/i;
             return idRegex.test(id);
         }
         
         if(!isValidId(id)) {
            alert("유효한 이메일 형식이 아닙니다.");
            return false;
         }
         
         $.ajax({
             type : 'POST',
               data : {"id": id},
               url : "idcheck.do",
               success : function (cnt){
                  if(cnt != 1){
                     alert("사용가능한 아이디 입니다.")
                     $('#nick').focus();
                     id_check = true;
                     
                  } else{
                     alert("중복된 아이디 입니다.")
                     $('#id').focus();
                     $('#id').val("");
                  }
               }
         });
      });
    
    // 닉네임 중복검사
    $('#nickcheck').click(function(){
       var nick = $("#nick").val();
       
       if($("#nick").val() == "") {
            alert("닉네임을 입력해주세요");
            return false;
         }
       
      $.ajax({
          type : 'POST',
            data : {"nick": nick},
            url : "nickchk.do",
            success : function (cnt){
               if(cnt != 1){
                  alert("사용가능한 닉네임 입니다.")
                  $('#passwd').focus();
                  nick_chk = true;
                  
               } else{
                  alert("중복된 닉네임 입니다.")
                  $('#nick').focus();
                  $('#nick').val("");
               }
            }
      });
    });
    
  });
</script>
   
   <!-- footer -->
   <jsp:include page="../footer.jsp"></jsp:include>
   
</div>
<!------------------------------ 전체 프레임 end ------------------------------>

</body>
</html>