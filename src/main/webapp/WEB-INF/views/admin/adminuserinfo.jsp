<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../bootstrap.jsp"></jsp:include>
</head>
<body>
	<div>
		<jsp:include page="../navigator.jsp"></jsp:include>
	</div>
	<div class="container" align="center">
		<h2 class="text-primary">회원 상세정보</h2>
		<br>
		<table class="table table-bordered">
			<tr>
				<td align="center"><h4 class="text-primary">ID</h4></td>
				<td>${memberinfo.id}</td>
			</tr>
			<tr>
				<td align="center"><h4 class="text-primary">닉네임</h4></td>
				<td>${memberinfo.nick}</td>
			</tr>
			<tr>
				<td align="center"><h4 class="text-primary">가입일</h4></td>
				<td><fmt:formatDate value="${memberinfo.register}"
						pattern="yyyy-MM-dd a HH:mm:ss EEE요일" /></td>
			</tr>
			<tr>
				<td align="center"><h4 class="text-primary">자기소개</h4></td>
				<td>${memberinfo.intro}</td>
			</tr>
			<tr>
				<td align="center"><h4 class="text-primary">일반회원/탈퇴회원</h4></td>
				<td><c:if test="${memberinfo.state == 1 }">일반회원</c:if> <c:if
						test="${memberinfo.state != 1 }">탈퇴회원</c:if></td>
			</tr>
			<tr>
					<!-- 페이지 가지고 가야됨 -->
				<td colspan="2" align="center">
				<a href="adminusers.manager?pageNum=${pageNum}">
					<button type="button" class="btn btn-info">회원목록</button>
				</a>
				&nbsp;&nbsp;
					<a href="singo_list.singo?singo_nick=${memberinfo.nick}">
					<button type="button" class="btn btn-warning">신고글보기</button></a>
					&nbsp;&nbsp;

  <!-- Trigger the modal with a button -->
  <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal">회원강퇴</button>

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">회원강퇴 처리여부</h4>
        </div>
        <div class="modal-body">
          <p>정말 이 회원을 탈퇴시키겠습니까?</p>
        </div>
        <div class="modal-footer">
         <!-- 페이지 갖고 가야되는데 아직 안함. -->
          
          <button type="button" class="btn btn-danger" id="adminuserdeleteBtn" data-dismiss="modal">확인</button>         
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  
			</tr>
		</table>
	</div>

	<div>
		<jsp:include page="../footer.jsp"></jsp:include>
	</div>
	<script>
		$("#adminuserdeleteBtn").on('click', function(e){
			e.preventDefault();
			self.location = "adminuserdelete.manager?id=${memberinfo.id}&nick=${memberinfo.nick}";
		});
	</script>
</body>
</html>