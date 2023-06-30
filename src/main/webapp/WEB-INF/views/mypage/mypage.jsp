<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- navigator -->
<jsp:include page="../navigator.jsp"></jsp:include>

<title>My Page</title>
<link rel="stylesheet" type="text/css"
	href="./css/mypage/mypage_style.css">
</head>
<body>
	<div class="container">
		<div class="profile">
			<div ></div>
			<h2 class="username">${memberModel.nick }의 마이페이지</h2>
		</div>
		<!-- <button class="profile-edit-btn" type="button">프로필 변경</button> -->
		<div class="my-info">
			<!-- <h3 class="section-title">내 정보</h3> -->
			<form>
				<label for="email">이메일:</label> 
				<input type="email" id="email" name="id" value="${memberModel.id }" readonly><br>
			</form>
		</div>
		<div class="self-intro">
			
			<form>
				<label for="intro">자기소개</label><br>
				<textarea id="intro" name="intro" readonly style="resize: none">${memberModel.intro }</textarea><br>
			
				<label for="education">학력:${memberModel.grade }</label><br>

				<label for="tools">사용 가능한 툴:</label><br>
				<textarea id="tools" name="tool" readonly style="resize: none">${memberModel.tool }</textarea>
				<br> <label for="awards">수상 경력</label><br>
				<textarea id="awards" name="awards" readonly style="resize: none">${memberModel.prize }</textarea>
				<br> <label for="projects">프로젝트 URL:</label><br> 
				<input type="url" id="projects" name="projectfile" value="${memberModel.projectfile }" readonly><br>

			</form>
		</div>
		<div align="center">

			<button class="my-update-btn" type="button"
				onclick="location='mypage_edit.my'">수정하러가기</button>
		</div>
	</div>
</body>
</html>
