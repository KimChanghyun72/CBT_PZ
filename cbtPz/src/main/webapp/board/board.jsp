<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>board.jsp</title>
<style>
body {

	padding-top: 70px;

	padding-bottom: 30px;

}

.board_title {

	font-weight : 700;

	font-size : 22pt;

	margin : 10pt;

}

.board_info_box {

	color : #6B6B6B;

	margin : 10pt;

}

.board_member_id {

	font-size : 10pt;

	margin-right : 10pt;

}

.board_date {

	font-size : 10pt;

}

.board_content {

	color : #444343;

	font-size : 12pt;

	margin : 10pt;

}
</style>

</head>
<body>
<article>

		<div class="container" role="main">

			<h2 align="right" onclick="location.href='boardList.do'">자유게시판</h2>
			
			<div class="bg-white rounded shadow-sm">

				<div class="board_title"><c:out value="${board.board_title}"/></div>

				<div class="board_info_box">

					<span class="board_member_id">작성자: <c:out value="${board.member_id}"/>,</span><span class="board_date"><c:out value="${board.board_date}"/></span>

				</div>
				
				<div class="board_content">${board.board_contents}</div>

				</div>

			

			<div style="margin-top : 20px">
			 <p align="right">	
				<button type="button" onclick="location.href='boardUpdateForm.do?board_id='+${board.board_id}" class="btn btn-sm btn-primary" id="btnUpdate">수정</button>

				<button type="button" onclick="location.href='boardDelete.do?board_id='+${board.board_id}" class="btn btn-sm btn-primary" id="btnDelete">삭제</button>

				<button type="button" onclick="location.href='boardList.do'" class="btn btn-sm btn-primary" id="btnList">목록</button>
			</p>
			</div>
		</div>

	</article>

</body>
</html>