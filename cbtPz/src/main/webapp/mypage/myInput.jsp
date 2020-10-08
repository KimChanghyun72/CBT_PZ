<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<article>
		<div class="container">
			<div class="table-responsive">
				<br><br>
		<table class="table table-hover">
			<thead>
				<tr align="center">
					<th></th>
					<th>NO</th>
					<th>제목</th>
					<th>작성자</th>
					<th>조회수</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody align="center">
				<c:choose>
					<c:when test="${empty board_list}">
						<tr>
							<td colspan="6" align="center">데이터가 없습니다.</td>
						</tr>
					</c:when>
					<c:when test="${!empty board_list}">
			<c:forEach items="${board_list}" var="board">
				<tr>
					<c:if test="${board.board_views <= 2}">
					<td style="color:Tomato;">NEW</td>
					</c:if>
					<c:if test="${board.board_views > 2}">
					<td>  </td>
					</c:if>
					<td>${board.board_id}</td>
					<td><a href="myInputSelect.do?board_id=${board.board_id}">${board.board_title}</a></td>
					<td>${board.member_id}</td>
					<td>${board.board_views}</td>
					<td>${board.board_date}</td>
				</tr>
				</c:forEach>
				</c:when>
				</c:choose>
			</tbody>
			
		</table>
		
	<!-- 페이징 처리 영역 -->	
   <my:paging paging="${paging}" jsfunc="gopage"/>
    	<script>
    	function gopage(p){

    		location.href="${pageContext.request.contextPath}/mypage/myInput.do?p="+ p;
    	
    	};
    	</script>	
	<!-- 페이징 처리 영역 -->
	</div>
	</div>
	</article>
</body>
</html>