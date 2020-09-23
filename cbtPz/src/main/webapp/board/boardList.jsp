<%@page import="model.BoardDAO"%>
<%@page import="model.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- Bootstrap CSS -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<!-- Bootstrap CSS -->
<title>boardList.jsp</title>
<!--style CSS -->
<style>
body {
	padding-top: 70px;
	padding-bottom: 30px;
}

</style>
<!--style CSS -->
</head>
<body>
	<article>
		<div class="container">
			<div class="table-responsive">
				<h2 align="right">자유게시판</h2>
				<table class="table table-striped table-sm">
					<colgroup>
						<col style="width: 5%;" />
						<col style="width: auto;" />
						<col style="width: 15%;" />
						<col style="width: 10%;" />
						<col style="width: 10%;" />
					</colgroup>
					<thead>
						<tr>
							<th>NO</th>
							<th>글제목</th>
							<th>작성자</th>
							<th>조회수</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${empty list}">
								<tr>
									<td colspan="5" align="center">데이터가 없습니다.</td>
								</tr>
							</c:when>
							<c:when test="${!empty list}">
								<c:forEach var="board" items="${list}">
										<tr>
										<td>${board.board_id}</td>
									<td><a href="boardSelect.do?board_id=${board.board_id}">${board.board_title}</a></td>
										<td>${board.member_id}</td>
										<td>${board.board_views}</td>
										<td>${board.board_date}</td>
									  </tr>
									
								</c:forEach>
							</c:when>
						</c:choose>
					</tbody>

				</table>
				<p align="right">
				<button class="btn btn-sm btn-primary"
					onclick="location.href='board/boardInsert.jsp'">글쓰기</button>
				<button class="btn btn-sm btn-primary">삭제</button>
				</p>
	<!-- 페이징 처리 영역 -->	
   <my:paging paging="${paging}" jsfunc="gopage"/>
    	<script>
    	function gopage(p){
    		location.href="boardList.do?p="+ p;
    	}
    	</script>	
 		
	<!-- 페이징 처리 영역 -->
			</div>
		</div>
	</article>
</body>
</html>