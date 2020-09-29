<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- jQuery -->

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>qaboard.jsp</title>
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

			<h2 align="right" onclick="location.href='${pageContext.request.contextPath}/board/qaboardList.do'">Q&A</h2>
			
			<div class="bg-white rounded shadow-sm">

				<div class="board_title"><c:out value="${qaboard.qaboard_title}"/></div>

				<div class="board_info_box">

					<span class="board_member_id">작성자: <c:out value="${qaboard.member_id}"/>,</span><span class="board_date"><c:out value="${qaboard.qaboard_date}"/></span>

				</div>
				
				<div class="board_content">${qaboard.qaboard_contents}</div>
				
					
				</div>
			<div style="margin-top : 20px">
			 <p align="right">	
				<button type="button" onclick="location.href='qaboardUpdateForm.do?qaboard_id='+${qaboard.qaboard_id}" class="btn btn-sm btn-primary" id="btnUpdate">수정</button>

				<button type="button" onclick="location.href='${pageContext.request.contextPath}/board/qaboardDelete.do?qaboard_id='+${qaboard.qaboard_id}" class="btn btn-sm btn-primary" id="btnDelete">삭제</button>

				<button type="button" onclick="location.href='${pageContext.request.contextPath}/board/qaboardList.do'" class="btn btn-sm btn-primary" id="btnList">목록</button>
			</p>
			</div>
<!---------------------댓글 입력폼------------------------->
<c:if test="${sessionScope.check=='A'}">								  						
<div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top: 10px">
<form>
<div class="row">
<div class="col-sm-10">
<textarea class="form-control" rows="3" placeholder="댓글을 입력해 주세요" name="comment_contents"></textarea>
</div>
<div class="col-sm-2">
	<input type="text" class="form-control" name="comment_poster" placeholder="작성자"/>
	<input type="hidden" name="board_id" value="${board.board_id}"/>
	<button type="button" class="btn btn-sm btn-primary" name="btnSave" style="width: 100%; margin-top: 10px" id="btnSave">저장</button>
</div>
</div>
</form>
</div>
</c:if>
<!--------------------댓글 리스트------------------------>
	<div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top: 10px">			
	<h6 class="border-bottom pb-2 mb-0" align='center'>Answer</h6>
	<div id="list"></div>
	</div>
<!--------------------댓글 리스트------------------------>			
</div>
	</article>
</body>
</html>