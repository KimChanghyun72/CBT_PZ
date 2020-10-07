<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" name="frm" id="frm" 
   	  action="${pageContext.request.contextPath}/problemInsert.do"
   	  onsubmit = "return inputCheck()">
	<select name="subject" id="subject">
		<option value="0" selected>과목</option>
		<option value="1" >1과목</option>
		<option value="2" >2과목</option>
		<option value="3" >3과목</option>
		<option value="4" >4과목</option>
		<option value="5" >5과목</option>
	</select>
		<p></p>
	<label>문제</label>
		<p><textarea cols="50" rows="10" placeholder="문제를 입력하세요." name="problem_text" id="problem_text"></textarea></p>
	<label>정답</label>
	<ol list-style-type:decimal;>
		<li><input placeholder="내용을 입력해주세요." name="ans_1" id="ans_1"><input type="checkbox" name="ans_correct" id="ans_correct" value="1">
		<li><input placeholder="내용을 입력해주세요." name="ans_2" id="ans_2"><input type="checkbox" name="ans_correct" id="ans_correct" value="2">
		<li><input placeholder="내용을 입력해주세요." name="ans_3" id="ans_3"><input type="checkbox" name="ans_correct" id="ans_correct" value="3">
		<li><input placeholder="내용을 입력해주세요." name="ans_4" id="ans_4"><input type="checkbox" name="ans_correct" id="ans_correct" value="4">
	</ol>
	<label>해설</label>
		<p><textarea cols="50" rows="10" placeholder="해설를 입력하세요." name="haeseol" id="haeseol"></textarea></p>
		<input type="text" id="paperhead_id" name="paperhead_id"/>
	<button>등록</button>
	<button>초기화</button>
</form>
</body>
</html>