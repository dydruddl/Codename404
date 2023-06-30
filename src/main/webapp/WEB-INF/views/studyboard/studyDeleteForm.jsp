<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>스터디 삭제 alert</title>
</head>
<body>
	<script>
		//alert("삭제하시겠습니까?");
		var result=confirm("삭제 하시겠습니까?"); // 확인을 누르면 1이나 true 반환하나 보다. // result 변수를 studyDelete.jsp 에서도 사용
		if(result){
			location.href="studyDelete.study?study_no=${study_no}&pageNum=${pageNum}&category_no=${category_no}"; 
			// model에서 넘어온 study_no
		}else{
			history.go(-1);
		}		
	</script>
</body>


</html>