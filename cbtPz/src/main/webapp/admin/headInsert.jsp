<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="height: 100px;; background-color: navy; color: white; font-size: 3.0em; text-align: center;">관리자 페이지</div>
<form method="post" name="frm" id="frm" 
   	  action="${pageContext.request.contextPath}/"
   	  onsubmit = "return inputCheck()">
	<select name="subject" id="subject">
		<option selected>문제분류</option>
		<option>모의고사</option>
		<option>기출문제</option>
	</select>
	<select>
		<option selected>연도회차</option>
		<option>2019 1회차</option>
		<option>2019 2회차</option>
		<option>2019 3회차</option>
		<option>2020 1회차</option>
		<option>2020 2회차</option>
	</select>
</form>
</body>
</html>