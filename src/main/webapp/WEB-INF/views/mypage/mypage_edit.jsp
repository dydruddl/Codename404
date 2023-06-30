<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- navigator -->
<jsp:include page="../navigator.jsp"></jsp:include>

<title>My Page</title>
<link rel="stylesheet" type="text/css"	href="./css/mypage/mypage_style.css">

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
/* 라디오 버튼 계속 체크되어있게 하는 함수 */
$(document).ready(function(){
	$("input:radio[name='grade'][value='${memberModel.grade}']").attr("checked", true);
});
</script>

</head>
<body>

<div class="container">
	<div class="profile">
			<!-- <div class="profile-img"></div> -->
			<h2 class="username">${memberModel.nick }의 마이페이지</h2>
	</div>
	<div class="my-info">
			<!-- <h3 class="section-title">내 정보</h3> -->
			<form>
				<label for=nick>닉네임:</label>
				<input type=email id=nick name=nick value="${memberModel.nick }" readonly>
				<br>
				<label for="email">이메일:</label>
				<input type="email" id="email" name="id" value="${memberModel.id }" readonly><br>

				<!-- <label for="password">비밀번호:</label><br>
				<input type="password" id="password" name="password"><br> -->
				<button class="my-update-btn" type="button"
					onclick="location='passwd_check.my?id=${memberModel.id}'">비밀번호 수정</button>
				<!-- <button type="submit">비밀번호 수정</button>  -->
			</form>
	</div>
	
<form action="mypage_editform.my" method="post">	
	<div class="self-intro">
		<input type="hidden" name="id" value="${memberModel.id }">
		
		<label for="intro">자기소개</label><br>
		<textarea id="intro" name="intro" style="resize: none" >${memberModel.intro }</textarea>
		
		<label for="education">학력:</label>
		<div class="radio-buttons">
			<label><input type="radio" name="grade" value="고등학교">고등학교</label>
			<label><input type="radio" name="grade" value="대학교">대학교</label>
			<label><input type="radio" name="grade" value="대학원">대학원</label>
		</div>

		<label for="tools">사용 가능한 툴:</label><br>
		<textarea id="tool" name="tool" style="resize: none">${memberModel.tool }</textarea>
		<br> <label for="awards">수상 경력</label><br>
		<textarea id="awards" name="prize" style="resize: none">${memberModel.prize }</textarea>
		<br> <label for="projects">프로젝트 URL:</label><br> 
		<input type="url" id="projects" name="projectfile" placeholder="url형식에 맞게 입력해주세요. ex) http:// ~"
		 value="${memberModel.projectfile}"><br>
		<!-- <button type="submit">저장</button> -->
	</div>
	<div class="buttons" align="center">
			<button class="update" type="submit">수정완료</button>
			<button class="delete" type="button"
         			onclick="location='mypage_deleteform.my'">탈퇴하기</button>
	</div>
</form>
</div>
	
</body>
</html>
