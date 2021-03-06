<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="//cdn.ckeditor.com/4.15.0/standard/ckeditor.js"></script>
	<script>
	<!--공백 체크 및 비밀번호 확인  -->
	function inputCheck() {

		if (frm.board_title.value == "") {
			window.alert("제목 입력하세요");
			frm.board_title.focus();
			return false;
		}
		if (frm.member_id.value == "") {
			window.alert("작성자를 입력하세요");
			frm.member_id.focus();
			return false;
		}
	
		return true;
	}
</script> 

<title>noticeInsert.jsp</title>

</head>
<body>	
		<!--공지사항 입력 폼  -->
		<div class="container" role="main">
			<br><br>
			<form id="frm" name="frm" id="frm" onsubmit="return inputCheck()" method="post" action="${pageContext.request.contextPath}/board/noticeInsert.do" enctype="multipart/form-data">
				<div class="mb-3">
					<input  class="form-control" type="text" name="board_title" id="board_title" placeholder="제목"> 
					<input  class="form-control" type="text" name="member_id" id="member_id" value="관리자" readonly="readonly"> 
					<input type="file" id="board_file" name="board_file">
				</div>

				<div class="mb-3">
					<textarea class="form-control" rows="10" name="board_contents" id="board_contents" placeholder="내용을 입력하세요"></textarea>
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