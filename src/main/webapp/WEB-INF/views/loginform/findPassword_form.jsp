<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>비밀번호 찾기</title>
   <script src="http://code.jquery.com/jquery-latest.js"></script>
   
    <script type="text/javascript">
	$(function(){
		$("#newpasswd").click(function(){
			let id=$("input[name='id']").val();
			let nick=$("input[name='nick']").val();
			$.ajax({
				url:"finduserpasswd.do",
				dataType:'json',
				data:{"id":id,"nick":nick},
				success:function(data){
					if(data==true){
						alert("임시 비밀번호가 발급되었습니다.메일함을 확인해 주세요");
						console.log(data);
						location.href="login_form.do";
					}else{
						alert("아이디 또는 닉네임을 정확하게 입력해 주세요");
						$("#id").val("");
						$("#nick").val("");
						console.log(data);
				}
		   	}
		});
	});
});
</script>
   <style>
      body {
         font-family: Arial, sans-serif;
         background-color: #f2f2f2;
         padding: 20px;
      }
      
      h1 {
         color: #333;
         text-align: center;
         margin-bottom: 20px;
      }
      
      form {
         max-width: 400px;
         margin: 0 auto;
         background-color: #fff;
         padding: 20px;
         border-radius: 4px;
         box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
      }
      
      label {
         display: block;
         margin-bottom: 8px;
         color: #333;
         font-weight: bold;
      }
      
      input[type="email"] {
         width: 100%;
         padding: 8px;
         border: 1px solid #ccc;
         border-radius: 4px;
         box-sizing: border-box;
         margin-bottom: 16px;
         font-size: 14px;
      }
      
      input[type="submit"] {
         background-color: #4caf50;
         color: #fff;
         padding: 10px 16px;
         border: none;
         border-radius: 4px;
         cursor: pointer;
         font-size: 14px;
      }
      
      input[type="submit"]:hover {
         background-color: #45a049;
      }
      
      input[type="button"] {
         background-color: black;
         color: #fff;
         padding: 10px 16px;
         border: none;
         border-radius: 4px;
         cursor: pointer;
         font-size: 14px;
      }
      
      input[type="button"]:hover {
         background-color: #45a049;
      }
   </style>
   
   
</head>
<body>
   <h1>비밀번호 찾기</h1>
   <form>
      <label for="id">가입한 이메일</label>
      <input type="email" id="id" name="id" required="required" placeholder="ID를 입력하세요">
      
      <label for="nick">가입한 닉네임</label>
      <input type="email" id="nick" name="nick" required="required" placeholder="닉네임을 입력하세요"> 
		<div align="center">
      <input type="button" value="임시 비밀번호 발송" id="newpasswd">
      &nbsp;&nbsp;
      <input type="button" value="닫기" onclick="window.close()">
      </div>
   </form>
</body>
</html>