<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" /> <%-- 현재 프로젝트를 가져오는 것 --%>

<!-- style.css -->
<link rel="stylesheet" type="text/css" href="./css/study/study_writestyle.css" />

<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script src="http://code.jquery.com/jquery-latest.js"></script>

<style>
#header {
	margin-top: -20px;
	width: 100%;
	height: 500px;
	background: url('./images/head.jpg') no-repeat;
	background-position: center center;
	background-size: cover;
	border-bottom: 1px solid #A9A9A9;
}
</style>