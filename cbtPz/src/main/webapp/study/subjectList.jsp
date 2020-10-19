<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	tr, td{
		text-align : center;
	}
	tr{
		height : 75px;
	}
	td{
		height : 100px;
	}
	.tagSub{
		font-size : 30px;
	}
	
	#fa { 
	text-decoration: none; 
	border: rgba(75, 112, 253, 0.3) solid; 
	border-width: 0 0 6px 0; 
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
	<br><br><br>
	<div align="center">
		<a id="fa"><img src="../img/prob.png">&nbsp;&nbsp;문제는 랜덤으로 10개씩 출제 됩니다.</a>
	</div>
	<article>
	<div class="container" align="center">
		<table class="table-striped table-sm">
	<colgroup>
		<col style="width:800px; " /><!-- 80% -->
		<col style="width:100px; " />
	</colgroup>
		<th bgcolor="#99d6ff"><h5>문제 유형</h5></th>
		<th bgcolor="#99d6ff"><h5>풀기</h5></th>
		</tr>
	<c:forEach items="${subjectlist}" var="subjectlist">			
	<input type="hidden"/>
	<tr><td class="tagSub"><b>${subjectlist.commoncode_name}</b></td>
	<td>
	<form action="${pageContext.request.contextPath}/problemSubject.do">
		<input type="hidden" name="subject" value="${subjectlist.commoncode_id}">
	</form>
	<button name="btnSubmit" value="${subjectlist.commoncode_id}" class="btn btn-sm btn-primary">풀기</button>
	</td>
	</tr>
	<br>
	</c:forEach>
	
	</table>
	</div>
	</article>
</body>
</html>