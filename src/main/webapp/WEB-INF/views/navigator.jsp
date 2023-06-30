<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head>
	<!-- 반응형 웹 -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    
    <!-- style.css -->
    <link rel="stylesheet" type="text/css" href="./css/style.css" />
    
    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
    <!-- jquery -->
    <script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>

<!-- 네비게이션 바/부트스트랩 --> 
<nav class="navbar navbar-inverse">
<div class="container-fluid">
        
    <div class="navbar-header">
        <a class="navbar-brand" href="#" onclick="location='main.do'">CodeName404</a>
    </div>
        
    <div class="collapse navbar-collapse" id="myNavbar">
        <ul class="nav navbar-nav">
            <li><a href="#" onclick="location='notice_list.notice'">Notice</a></li> <!-- active -->
            <li><a href="#" onclick="location='free_list.free'">FreeBoard</a></li>
            <li><a href="#" onclick="location='study_list.study'">Study</a></li>
            <li><a href="#" onclick="location='qna_list.qna'">Q&amp;A</a></li>
            
<!-- dropdown 기능 -->
<!-- 
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    Q&amp;A<span class="caret"></span>
                </a>
                <ul class="dropdown-menu">
                    <li><a href="#">해결</a></li>
                    <li><a href="#">미해결</a></li>
                </ul>
            </li>
-->
        </ul>
        
         <c:if test="${!empty adminmodel.admin_id}">
        <ul class="nav navbar-nav navbar-right">
            <li><a href="#" onclick="location='adminusers.manager'">
            	<span class="glyphicon glyphicon-user"></span>&nbsp;관리자페이지</a>
            </li>
            <li><a href="#" onclick="location='logout_form'">
            	<span class="glyphicon glyphicon-log-out"></span>&nbsp;Logout</a></li>
        </ul>
        </c:if>
        
        
        <!-- 로그아웃 상태 -->
        <%-- <c:if test="${empty sessionScope.id}"> --%>
        <c:if test="${empty memberModel.id and empty adminmodel.admin_id}">
        <ul class="nav navbar-nav navbar-right">
            <li><a href="#" onclick="location='signup_form.do'">
            	<span class="glyphicon glyphicon-user"></span> SignUp</a>
            </li> <!-- login_form.do -->
            <li><a href="#" onclick="location='separatelogin.do'">
            	<span class="glyphicon glyphicon-log-in"></span> Login</a></li>
        </ul>
        </c:if>
        
        <!-- 로그인 상태 -->
        <%-- <c:if test="${empty sessionScope.id}"> --%>
        <c:if test="${!empty memberModel.id}">
        <ul class="nav navbar-nav navbar-right">
            <li><a href="#" onclick="location='mypage.my'">
            	<span class="glyphicon glyphicon-user"></span>&nbsp;${memberModel.nick}의 마이페이지</a>
            </li>
            <li><a href="#" onclick="location='logout_form'">
            	<span class="glyphicon glyphicon-log-out"></span>&nbsp;Logout</a></li>
        </ul>
        </c:if>
        
    </div> 
</div>
</nav> 

</body>
</html>