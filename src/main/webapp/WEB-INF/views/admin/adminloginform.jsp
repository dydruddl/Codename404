<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Login Board</title>

<!-- studystyle.css -->
<link rel="stylesheet" type="text/css" href="./css/login/loginstyle.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>


 
	<!------------------------------ 전체 프레임 ------------------------------>
	<div id="frame">
		<!-- 네비게이션 바/부트스트랩 -->
		<jsp:include page="../navigator.jsp"></jsp:include>

		<div class="container">

			<form action=adminlogin.manager method=post>
				<h1>로그인</h1>
				<div class="input-field">
					<input type="text" id="id" name="admin_id" placeholder="이메일을 입력해주세요" /> <i
						class="fas fa-user"></i>
				</div>

				<div class="input-field">
					<input type="password" id="passwd" name ="admin_passwd" placeholder="비밀번호를 입력해주세요" /> <i
						class="fas fa-lock"></i>
				</div>

				<input type="submit" class="btn" value="로그인" >

			</form>
		</div>

		<!-- footer -->
		<jsp:include page="../footer.jsp"></jsp:include>

	</div>
	<!------------------------------ 전체 프레임 end ------------------------------>
</body>
</html>