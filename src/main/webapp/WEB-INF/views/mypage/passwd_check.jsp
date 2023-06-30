<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>현재 비밀번호 입력</title>
<link rel="stylesheet" type="text/css" href="./css/mypage/mypage_style.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
function check(){
	if(document.myform.passwd.value == ""){
		alert("비번을 입력 하세요.");
		document.myform.passwd.focus();
		return false;
	}

	if(document.myform.passwd.value != document.myform.passwd2.value){
		alert("비번이 일치하지  않습니다.");
		document.myform.passwd.value = "";
		return false;
	}
}	
</script>
</head>

<body>
<form name="myform" action="mypage_newpasswd.my" method="post" onSubmit="return check()">
	<input type="hidden" name="passwd2" value="${memberModel.passwd}">
  		<div class="passwd-check">
   			 <label for="passwd-check">현재 비밀번호</label>
   			 <input type="password" id="passwd-check" name="passwd">
    		<input type="submit"  value="확인">
  		</div>
</form>

</body>
</html>