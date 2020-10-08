<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">

<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table {
    width: 600px;
  }
</style>
<script>
function btnSelectSolve(solve_id) {
	if( confirm("응시문제를 확인 하시겠습니까?")) {
		location.href="${pageContext.request.contextPath}/mypage/myRetestSelect.do?solve_id="+solve_id;
	} else {
		alert("취소 되었습니다.");
	}  
}
</script>
</head>
<body>
	<h1>test/ 오답문제 페이지</h1>
	<div class="retest">
		<form>
			<div>
				<table border="1"  class="table table-hover" id="dev-table">
				<tr>
					<td>응시날짜</td>
					<td>응시소모시간</td>
					<td>응시유형</td>
					<td>채점결과</td>
				</tr>
				<c:forEach items="${solvelist}" var="solvelist">
				<tr>
					<td>${solvelist.solve_date}</td>
					<td>${solvelist.solve_time}</td>
					<td>${solvelist.solve_type_cd}</td>
					<td>${solvelist.solve_score}/${solvelist.solve_cnt}</td>
					<td><button type="button" class="btn btn-outline-primary" onclick="btnSelectSolve('${solvelist.solve_id}')">문제확인</button></td>
					<td><button type="button" class="btn btn-outline-primary">재응시</button></td>
				</tr>
				</c:forEach>
		</table>
			</div>
		</form>
	</div>
</body>
</html>