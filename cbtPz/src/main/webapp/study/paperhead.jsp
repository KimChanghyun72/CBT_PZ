<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
th , td {
	text-align : center;
}

</style>
</head>
<body>


<article>
	<div class="container" align="center">
		<table class="table-striped table-sm">
	<colgroup>
		<col style="width: 800px" /><!-- 80% -->
		<col style="width: 100px" />
	</colgroup>
		<tr>
		<th>문제 유형</th>
		<th>풀기</th>
		</tr>
	<c:forEach items="${headlist}" var="headlist">			
	<input type="hidden" ${headlist.paperhead_id} />
	<tr><td>${headlist.paper_type_cd} ${headlist.paper_round}</td>
	<td>
	
	<form action="${pageContext.request.contextPath}/study/problemHead.do">
	<button type="submit" name="paperhead_id" value="${headlist.paperhead_id}" class="btn btn-sm btn-primary">풀기</button>
	</form>
	</td>
	</tr>
	<br>
	</c:forEach>
	
	</table>
	</div>
	</article>
</body>
</html>