<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
		if (frm.board_contents.value == "") {
			window.alert("내용을 입력하세요");
			frm.board_contents.focus();
			return false;
		}
		if('${sessionScope.check}'=='M'){
			if (frm.pw.value != "${sessionScope.login.member_pw}") {
				window.alert("비밀번호를 확인해주세요");
				frm.pw.focus();
				return false;
			}
		}
		if('${sessionScope.check}'=='T'){
			if (frm.pw.value != "${sessionScope.login.teacher_password}") {
				window.alert("비밀번호를 확인해주세요");
				frm.pw.focus();
				return false;
			}
		}
	
		return true;
	}
</script> 
<title>boardUpdate.jsp</title>
</head>
<body>
		<!-- 수정 페이지 입력 폼  -->
		<div class="container" role="main">
				<br><br>
			<form id="frm" name="frm" id="frm" onsubmit="return inputCheck()" method="post" action="${pageContext.request.contextPath}/board/boardUpdate.do" enctype="multipart/form-data">
			<input  type="hidden" name="board_file" value="${board.board_file}"> 
			<input  type="hidden" name="board_id" value="${board.board_id}"> 
				<div class="mb-3">
					<input  class="form-control" type="text" name="board_title" id="board_title" value="${board.board_title}" placeholder="제목"> 
					<c:if test="${sessionScope.check=='M'}"> 
						<input  class="form-control" type="text" name="member_id" id="member_id"  value="${sessionScope.login.member_id}" readonly="readonly">
					</c:if>
					<c:if test="${sessionScope.check=='T'}">
						<input  class="form-control" type="text" name="member_id" id="member_id"  value="${sessionScope.login.teacher_id}" readonly="readonly">
					</c:if> 
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