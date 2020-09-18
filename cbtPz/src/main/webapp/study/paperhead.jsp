<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:forEach items="${headlist}" var="headlist">			
	<input type="hidden" ${headlist.paperhead_id} />
	${headlist.paper_type_cd}        
	${headlist.paper_round}<br>
	<form action="problemSearch.do">
	<button type="submit" name="paperhead_id" value="${headlist.paperhead_id}">풀기</button>
	</form>
	<br>
</c:forEach>



</body>
</html>