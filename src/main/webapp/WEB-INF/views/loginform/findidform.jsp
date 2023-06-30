<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID찾기</title>

<script src="http://code.jquery.com/jquery-latest.js"></script>
 <script type="text/javascript">
	$(function(){
		$("#findid").click(function(){
			let nick=$("input[name='nick']").val();
			$.ajax({
				url:"finduserid.json",
				dataType:'json',
				data:{"nick":nick},
				success:function(data){
					if(JSON.stringify(data) != '{}'){
						alert("고객님의 정보와 일치하는 ID입니다.");
						console.log(data);
						var id = data.id;
						var nick = data.nick;
						location.href="identifyid.do?id="+id+"&nick="+nick;
					}
					/* else{
						console.log(data);
						alert("닉네임을 정확하게 입력해 주세요.");
						$("#nick").val("");
					} */
				},
				error:function(error){
					console.log(error);
					alert("닉네임을 정확하게 입력해 주세요.");
					$("#nick").val("");
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

input[type="text"] {
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

input[type="submit"] {
   background-color: black;
   color: #fff;
   padding: 10px 16px;
   border: none;
   border-radius: 4px;
   cursor: pointer;
   font-size: 14px;
   width: 100%;
}

input[type="submit"]:hover {
   background-color: #45a049;
}
</style>

</head>
<body>

   <h1>ID 찾기</h1>
<form>
   <label for="nick">가입한 닉네임</label>
   <input type="text" id="nick" name="nick" required="required" placeholder="닉네임을 입력하세요"> 
   <input type="submit" value="ID 찾기" id="findid">
   &nbsp;&nbsp;
   <input type="button" value="닫기" onclick="window.close()">
</form>
   

</body>
</html>