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

<script>
// 각 게시판의 글번호와 카테고리번호를 가지고 넘어가야될듯.
 $(document).ready(function() {
 			var popupX = ((window.screen.width-600)/2);
           var popupY = ((window.screen.height-400)/2);
            $("#findpassword").on('click', function(){
                window.open("findPassword.do", "비밀번호 찾기창", "resizeable=no, location=0, status=0, width=600, height=650, left="+popupX+", top="+popupY);
            });
}); 

 $(document).ready(function() {
		var popupX = ((window.screen.width-600)/2);
    var popupY = ((window.screen.height-400)/2);
     $("#findid").on('click', function(){
         window.open("findId.do", "ID 찾기창", "resizeable=no, location=0, status=0, width=600, height=650, left="+popupX+", top="+popupY);
     });
}); 
</script>

</head>
<body>


 
	<!------------------------------ 전체 프레임 ------------------------------>
	<div id="frame">
		<!-- 네비게이션 바/부트스트랩 -->
		<jsp:include page="../navigator.jsp"></jsp:include>

		<div class="container">

			<form action=login_form method=post>
				<h1>로그인</h1>
				<div class="input-field">
					<input type="text" id="id" name="id" placeholder="이메일을 입력해주세요" /> <i
						class="fas fa-user"></i>
				</div>

				<div class="input-field">
					<input type="password" id="passwd" name ="passwd" placeholder="비밀번호를 입력해주세요" /> <i
						class="fas fa-lock"></i>
				</div>
				

				<input type="submit" class="btn" value="로그인" >

				<div class="forgot-password">
					<button id="findid" class="btn">ID 찾기</button>
					<button id="findpassword" class="btn">비밀번호 찾기</button>
				</div>
			</form>
		</div>

		<!-- footer -->
		<jsp:include page="../footer.jsp"></jsp:include>

	</div>
	<!------------------------------ 전체 프레임 end ------------------------------>
</body>
</html>