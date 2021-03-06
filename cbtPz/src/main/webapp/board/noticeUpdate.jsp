<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="//cdn.ckeditor.com/4.15.0/standard/ckeditor.js"></script>
<meta charset="UTF-8">
	<script>
	<!--공백 체크 확인  -->
	function inputCheck() {

		if (frm.board_title.value == "") {
			window.alert("제목 입력하세요");
			frm.title.focus();
			return false;
		}
		
		return true;
	}
</script> 
<title>noticeUpdate.jsp</title>
</head>
<body>
		<!-- 수정 페이지 입력 폼  -->
		<div class="container" role="main">
			<br><br>
			<form id="frm" name="frm" id="frm" onsubmit="return inputCheck()" method="post" action="${pageContext.request.contextPath}/board/noticeUpdate.do" enctype="multipart/form-data">
			<input  type="hidden" name="board_file" value="${board.board_file}"> 
			<input  type="hidden" name="board_id" value="${board.board_id}"> 
				<div class="mb-3">
					<input  class="form-control" type="text" name="board_title" id="board_title" value="${board.board_title}" placeholder="제목"> 
					<input  class="form-control" type="text" name="member_id" id="member_id" value="${board.member_id}" readonly="readonly"> 
					<input type="file" id="file" name="file">
				</div>

				<div class="mb-3">
					<textarea class="form-control" rows="10" name="board_contents" id="board_contents" placeholder="내용을 입력하세요">${board.board_contents}</textarea>
				</div>
				<div>
			<p align="right">
				<button type="submit" class="btn btn-sm btn-primary" >저장</button>
				<button type="button" class="btn btn-sm btn-primary" onclick="history.back(-1);">취소</button>
			</p>
			</div>
			</form>
		</div>
<script>CKEDITOR.replace('board_contents');</script>
</body>

</html>