<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">	
<title>Insert title here</title>
</head>
<body>
<form action = "${pageContext.request.contextPath}/haederSearch.do">
<table border="1">
	<tr>
		<td width="150px" height="150px"><button name="headtype" value="모의">모의고사</button></td>
		<td width="150px" height="150px"><button name="headtype" value="기출">기출문제</button></td>
	</tr>
	<tr>
		<td width="150px" height="150px">태그별</td>
		<td width="150px" height="150px">과목별</td>
	</tr>
</table>
</form>
</body>
</html>