<%@page import="model.MemberDAO"%>
<%@page import="model.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	
<%request.getSession().setAttribute("pageName", "회원 관리");%>
	
</script>
<style>
	#d1{
		width : auto;
		box-shadow: 0 3px 20px rgba(0, 0, 0, 0.15);
	    padding: 35px 50px;
    	border-radius: 6px;
    	background:#f7f7f7;
	}

</style>
<script>
	$(function() {

		$("#listTable").dataTable({
		//paging : true
		});
	});
</script>
</head>
<body>
<br>
<br>
	<div class="container" id="d1">
	<h3>회원목록</h3>
	<table id="listTable" class="display">
		<thead>
			<tr bgcolor="skyblue">
				<th>id</th>
				<th>회원이름</th>
				<th>회원구분</th>
				<th>결제기한</th>
				<th>게시글 수</th>
				<th>시험 응시 수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="member">
				<tr>
					<td>${member.getMember_id()}</td>
					<td>${member.getMember_name()}</td>
					<td>${member.getIs_pay()}</td>
					<td>${member.getPay_enddate()}</td>
					<td>${member.getBoard_cnt()}</td>
					<td>${member.getSolve_cnt()}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
</body>
</html>