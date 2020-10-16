<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.css">  -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.js"></script>
<script>
		$("#listTable").DataTable({
			paging: false
		});
</script>
</head>
<body>
	<h3>회원목록</h3>
	<table id="listTable" class="table table-bordered">
		<thead>
			<tr>
				<th>id</th>
				<th>회원이름</th>
				<th>회원구분</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${memberList}" var="member">
				<tr>
					<td>${member.member_id}</td>
					<td>${member.member_name}</td>
					<td>${member.member_job}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table> 
</body>
</html>