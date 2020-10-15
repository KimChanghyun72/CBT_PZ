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
<script>
var check = "${sessionScope.check}";
	$(function(){
		$("[name=btnSubmit]").on("click", function(){
			if(check == "M"){
				$(this).prev().submit();
			}else{
				alert("학생회원만 문제를 풀 수 있습니다.");
			}
		});
	})
</script>
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
	<tr><td>${headlist.commoncode_name} ${headlist.paper_round}</td>
	<td>
	
	<form action="${pageContext.request.contextPath}/study/problemHead.do">
	<input type="hidden" name="paperhead_id" value="${headlist.paperhead_id}">
	</form>
	<button  name="btnSubmit" value="${headlist.paperhead_id}" class="btn btn-sm btn-primary">풀기</button>
	</td>
	</tr>
	<br>
	</c:forEach>
	
	</table>
	</div>
	</article>
</body>
</html>