<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${result == 1}">
	<script>
		alert("등록되지 않은 관리자 입니다.");
		history.go(-1);
	</script>
</c:if>   

<c:if test="${result == 2}">
	<script>
		alert("관리자정보가 틀렸습니다.");
		history.go(-1);
	</script>
</c:if>

</body>
</html>