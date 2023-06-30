<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		//alert("삭제하시겠습니까?");
		var result = confirm("삭제 하시겠습니까?");
		if(result){
			location.href = "qnaDelete.qna?qna_no=${qna_no}&pageNum=${pageNum}&category_no=${category_no}"; //model에서 넘어온 qna_no
		}else{
			history.go(-1);
		}		
	</script>
</body>


</html>