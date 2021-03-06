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

		if (frm.qaboard_type_cd.value == "") {
			window.alert("질문을 선택해주세요");
			frm.qaboard_type_cd.focus();
			return false;
		}
		if (frm.qaboard_title.value == "") {
			window.alert("제목 입력하세요");
			frm.qaboard_title.focus();
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
<title>qaboardInsert.jsp</title>
</head>
<body>
		<!--Q&A 입력 폼  -->
		<div class="container" role="main">
			<br><br>
			<form id="frm" name="frm" id="frm" onsubmit="return inputCheck()" method="post" action="${pageContext.request.contextPath}/board/qaboardInsert.do">
				<div class="form-group">
					<SELECT name="qaboard_type_cd" id="qaboard_type_cd" class="form-control">
						<OPTION value="">선택</OPTION>
						<OPTION value="기출문제">기출문제</OPTION>
						<OPTION value="모의고사">모의고사</OPTION>
						<OPTION value="과목별">과목별</OPTION>				
						<OPTION value="기타">기타</OPTION>	
						</SELECT>
						</div>
				
				<div class="mb-3">
					<input  class="form-control" type="text" name="qaboard_title" id="qaboard_title" placeholder="제목"> 
					<input  class="form-control" type="text" name="member_id" id="member_id"  value="${sessionScope.login.member_id}" readonly="readonly"> 
					
				</div>

				<div class="mb-3">
					<textarea class="form-control" rows="10" name="qaboard_contents" id="qaboard_contents" placeholder="내용을 입력하세요"></textarea>
				</div>
				
			<div>
			<p align="right">
				<button type="submit" class="btn btn-sm btn-primary" >저장</button>
				<button type="button" class="btn btn-sm btn-primary" onclick="history.back(-1);">취소</button>
			</p>
			</div>
			</form>
		
		</div>	
<script>CKEDITOR.replace('qaboard_contents');</script>
</body>

</html>