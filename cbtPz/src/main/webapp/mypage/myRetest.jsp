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
	<h1>test/ 오답문제 페이지</h1>
	<div class="retest">
		<form>
			<div>
				<table>
			<c:forEach items="${ retest_list }" var="retest">
				<tr>
					<td>${retest.problem_text}</td>
					</tr>
					<tr>
					<td>${retest.ans_1}</td>
					</tr>
					<tr>
					<td>${retest.ans_2}</td>
					</tr>
					<tr>
					<td>${retest.ans_3}</td>
					</tr>
					<tr>
					<td>${retest.ans_4}</td>
				</tr>
				</c:forEach>
		</table>
			</div>
		</form>
	</div>
</body>
</html>