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
	<div class="board">
		<h2>작성글</h2>

		<table class="table table-hover">
			<thead>
				<tr>
					<th>NO</th>
					<th>제목</th>
					<th>작성자</th>
					<th>조회수</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${board_list}" var="board">
				<tr>
					<td>${board.board_id}</td>
					<td><a href="myInputSelect.do?board_id=${board.board_id}">${board.board_title}</a></td>
					<td>${board.member_id}</td>
					<td>${board.board_views}</td>
					<td>${board.board_date}</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>