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
</style>
</head>
<body>
	<br><br><br><br>
	<div class="container">
		<form>
			<div class="table-responsive">
				<table border="1"  class="table table-hover" id="dev-table">
					<tr id="tr_font" bgcolor="#99d6ff" align="center">
						<th width="16%"><h5>과목</h5></th>
						<th><h5>문제</h5></th>
					</tr>			
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
				</table>
			</div>
		</form>
		<!-- 페이징 처리 영역 -->	
   		<my:paging paging="${paging}" jsfunc="gopage"/>
	    	<script>
	    	function gopage(p){
	
	    		location.href="${pageContext.request.contextPath}/mypage/myFavorite.do?p="+ p;
	    	
	    	};
	    	</script>	
	</div>
</body>
</html>