<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">		
<title>Insert title here</title>
</head>
<body>
<form action = "${pageContext.request.contextPath}/haederSearch.do">
		<div><button name="paper_type_cd" value="모의">모의고사</button></div>
		<div><button name="paper_type_cd" value="기출">기출문제</button></div>
</form>
		<div><a href="/cbtPz/hashtagPage.do"><button name="paper_type_cd" value="태그">태그별</button></a></div>
<form action ="${pageContext.request.contextPath}/subjectSearch.do"> 		
		<div><button name="subject" value="subject">과목별</button></div>
</form>		
</body>
</html>