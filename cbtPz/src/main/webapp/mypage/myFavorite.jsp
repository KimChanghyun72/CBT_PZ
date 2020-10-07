<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>test/ 즐겨찾기 문제 페이지</h1>
	<div class="favorite">
		<form>
			<div>
				<table>
			<c:forEach items="${ favorite_list }" var="favorite">
				<tr>
					<td>${favorite.problem_text}</td>
					</tr>
					<tr>
					<td>${favorite.ans_1}</td>
					</tr>
					<tr>
					<td>${favorite.ans_2}</td>
					</tr>
					<tr>
					<td>${favorite.ans_3}</td>
					</tr>
					<tr>
					<td>${favorite.ans_4}</td>
				</tr>
				</c:forEach>
		</table>
			</div>
		</form>
	</div>
</body>
</html>