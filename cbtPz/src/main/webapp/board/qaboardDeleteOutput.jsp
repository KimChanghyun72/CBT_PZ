<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qaboardDelteOutput.jsp</title>
<script>
	//삭제 완료 페이지
	
	//글쓰기  완료시  목록으로 보냄	
	if('${param.qaboard_id}'!= ""){
		window.alert("글이 삭제 되었습니다");
		location.href='${pageContext.request.contextPath}/board/qaboardList.do';
	}
</script>
</head>
<body>

</body>
</html>