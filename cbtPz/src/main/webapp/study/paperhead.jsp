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

h5 {
	color : white;
	text-shadow: 2px 2px 2px gray;
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
	<br><br><br>
	<div class="container" align="center">
		<table class="table-striped table-sm">
	<colgroup>
		<col style="width: 800px" /><!-- 80% -->
		<col style="width: 100px" />
	</colgroup>
		<tr>
		<th bgcolor="#99d6ff"><h5>문제 유형</h5></th> 
		<th bgcolor="#99d6ff"><h5>풀기</h5></th>
		</tr>
	<c:forEach items="${headlist}" var="headlist">			
	<tr><td>${headlist.commoncode_name} ${headlist.paper_round}</td>
	<td>
	
	<form action="${pageContext.request.contextPath}/study/problemHead.do">
	<input type="hidden" name="paperhead_id" value="${headlist.paperhead_id}">
	</form>
	<button  name="btnSubmit" value="${headlist.paperhead_id}" class="btn btn-sm btn-primary">풀기</button>
	</td>
	</tr>
	</c:forEach>
	
	</table>
	</div>
	</article>
</body>
</html>