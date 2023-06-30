<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID 확인</title>
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

input[type="button"] {
   background-color: black;
   color: #fff;
   padding: 10px 16px;
   border: none;
   border-radius: 4px;
   cursor: pointer;
   font-size: 14px;
   width: 100%;
}

input[type="button"]:hover {
   background-color: #45a049;
}
</style>
</head>
<body>
	<h1>ID 확인</h1>
	<div>
		<form>			
			<label for="nick">닉네임</label>
			<input type="email" id="nick" disabled="disabled" value="${nick}">
			<label for="id">확인된 회원의 ID</label>
			<input type="email" id="id" disabled="disabled" value="${id}"> 
			<input type="button" value="확인" onclick="window.close()">
		</form>
	</div>
</body>
</html>