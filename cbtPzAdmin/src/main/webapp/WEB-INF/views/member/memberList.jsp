<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>회원목록</h3>
	<table style="width: 50%" border="1" id="memberTable">
		<thead>
			<tr bgcolor="skyblue">
				<th>id</th>
				<th>회원이름</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${memberList}" var="member">
				<tr>
					<td>${member.member_id}</td>
					<td>${member.member_name}</td>
					<%-- <td><button type="button" onclick="location.href='memberList.do?member_id=${member.member_id}'">삭제</button></td> --%>
				</tr>
			</c:forEach>
		</tbody>
	</table> 
</body>
</html>