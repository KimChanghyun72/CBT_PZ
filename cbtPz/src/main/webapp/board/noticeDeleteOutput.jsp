<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeDeleteOutput.jsp</title>
<script>
	//글쓰기  완료시  목록으로 보냄	
	if('${param.board_id}' != ""){
		window.alert("글이 삭제 되었습니다");
		location.href='${pageContext.request.contextPath}/board/noticeList.do';
	}
</script>
</head>
<body>

</body>
</html>