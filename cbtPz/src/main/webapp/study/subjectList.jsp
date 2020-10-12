<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	tr, td{
		text-align : center;
	}
	tr{
		height : 75px;
	}
	td{
		height : 100px;
	}
	.tagSub{
		font-size : 30px;
	}
</style>
</head>
<body>
	
	<article>
	<div class="container" align="center">
		<table class="table-striped table-sm">
	<colgroup>
		<col style="width:800px; " /><!-- 80% -->
		<col style="width:100px; " />
	</colgroup>
		<tr>
		<th>문제 유형</th>
		<th>&nbsp;&nbsp;&nbsp;</th>
		</tr>
	<c:forEach var="i" begin="1" end="5">			
	<input type="hidden"/>
	<tr><td class="tagSub"><b>${i} 과목</b></td>
	<td>
	<form action="${pageContext.request.contextPath}/problemSubject.do">
	<button type="submit" name="subject" value="${i}과목" class="btn btn-sm btn-primary">풀기</button>
	</form>
	</td>
	</tr>
	<br>
	</c:forEach>
	
	</table>
	</div>
	</article>
	
	
	
	
	<%-- <form action="${pageContext.request.contextPath}/problemSubject.do">	
	1과목<button type="submit" name="subject" value="1과목">풀기</button><br>
	2과목<button type="submit" name="subject" value="2과목">풀기</button><br>
	3과목<button type="submit" name="subject" value="3과목">풀기</button><br>
	4과목<button type="submit" name="subject" value="4과목">풀기</button><br>
	5과목<button type="submit" name="subject" value="5과목">풀기</button><br>
	</form>
	<br> --%>
</body>
</html>