<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		var resulta = confirm("정말 삭제하시겠습니까?");
		if(result){
			location.href="";
		}else{
			history.go(-1);
		}
	</script>
</body>
</html>