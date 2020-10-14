<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h1>test/ 즐겨찾기 문제 페이지</h1>
	<div class="favorite">
		<form>
			<div>
				<table border="1"  class="table table-hover" id="dev-table">
					<tr style="background-color:lightblue">
						<td width="10%"><h4>과목</h4></td>
						<td><h4>문제</h4></td>
					</tr>			
					<c:forEach items="${problemList}" var="favorite">
					<tr>
						<td>${favorite.subject}</td>
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