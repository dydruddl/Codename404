<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:if test="${result == 1 }">
	<script>
		alert("이미 신고한 글입니다.");
		window.close();
	</script>
</c:if>

<script>
	alert("신고 접수가 완료됬습니다.")
	window.close();
</script>
	


</body>
</html>