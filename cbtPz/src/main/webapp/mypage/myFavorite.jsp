<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#tr_font h5{
	color : white;
	text-shadow: 2px 2px 2px gray;
	}
	
	
.table-responsive{
	min-height: 350px;
}

</style>
<script>
$(document).ready(function() {
	$("#foo-table").DataTable({
		lengthMenu: [ 5, 10, 20, 30, 50 ],
	
	   	// 기본 표시 건수를 50건으로 설정
	   	displayLength: 5, 
   	});
});

</script>
</head>
<body>
	<br><br><br><br>
	<div class="container">
		<form>
			<div class="table-responsive">
				<table border="1"  id="foo-table" class="table table-bordered">
					<thead align="center">
						<tr id="tr_font" bgcolor="#99d6ff">
							<th width="16%"><h5>과목</h5></th>
							<th><h5>문제</h5></th>
						</tr>	
					</thead>		
					<tbody>
					<c:forEach items="${problemList}" var="favorite">
						<tr>
							<td align="center">${favorite.subject_name}</td>
							<td><h5>${favorite.problem_text}</h5>
								${favorite.ans_1}<br>
								${favorite.ans_2}<br>
								${favorite.ans_3}<br>
								${favorite.ans_4}<br>
								정답 : ${favorite.ans_correct}<br>
		     				 	해설 : ${favorite.haeseol}
							</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
		</form>
	</div>
</body>
</html>