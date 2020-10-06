<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardInsertOutput.jsp</title>
<script>
	//입력 확인 페이지

	//글쓰기  완료시  목록으로 보냄	
	if('${board.board_id}'=='${board.board_id}'){
		window.alert("글이 등록 되었습니다");
		location.href='${pageContext.request.contextPath}/board/boardList.do';
	}
</script>
</head>
<body>

</body>
</html>