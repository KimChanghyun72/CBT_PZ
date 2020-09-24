<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<script>
	function inputCheck() {

		if (frm.title.value == "") {
			window.alert("제목 입력하세요");
			frm.title.focus();
			return false;
		}
		if (frm.id.value == "") {
			window.alert("작성자를 입력하세요");
			frm.contents.focus();
			return false;
		}
		if (frm.contexts.value == "") {
			window.alert("내용을 입력하세요");
			frm.title.focus();
			return false;
		}
	
		return true;
	}
</script> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">

<title>boardInsert.jsp</title>
<style>
body {
	padding-top: 170px;
	padding-bottom: 30px;
}
</style>


</head>
<body>
	
		<div class="container" role="main">
			<h2 align="right" onclick="location.href='./boardList.do'">자유게시판</h2>
			<form id="frm" name="frm" id="frm" onsubmit="return inputCheck()" method="post" action="${pageContext.request.contextPath}/boardUpdate.do" enctype="multipart/form-data">
			<input  type="hidden" name="board_file" value="${board.board_file}"> 
			<input  type="hidden" name="board_id" value="${board.board_id}"> 
				<div class="mb-3">
					<input  class="form-control" type="text" name="board_title" id="board_title" value="${board.board_title}" placeholder="제목"> 
					<input  class="form-control" type="text" name="member_id" id="member_id" value="${board.member_id}" placeholder="작성자"> 
					<input type="file" id="file" name="file">
				</div>

				<div class="mb-3">
					<textarea class="form-control" rows="10" name="board_contents" id="board_contents" placeholder="내용을 입력하세요">${board.board_contents}</textarea>
				</div>
				<div class="mb-3">
					<input class="form-control" type="password" name="pw" id="pw" placeholder="비밀번호를 입력하세요">
				</div>
			<div>
			<p align="right">
				<button type="submit" class="btn btn-sm btn-primary" >저장</button>
				<button type="button" class="btn btn-sm btn-primary" onclick="history.back(-1);">취소</button>
			</p>
			</div>
			</form>
		</div>
	
</body>

</html>