<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="height: 100px;; background-color: navy; color: white; font-size: 3.0em; text-align: center;">관리자 페이지</div>
<form method="post" name="frm" id="frm" 
   	  action="${pageContext.request.contextPath}/problemInsert.do"
   	  onsubmit = "return inputCheck()">
   	<input type="text" id="problem_id" name="problem_id"/>
	<select name="subject" id="subject">
		<option value="0" selected>과목</option>
		<option value="1" >1과목</option>
		<option value="2" >2과목</option>
		<option value="3" >3과목</option>
		<option value="4" >4과목</option>
		<option value="5" >5과목</option>
	</select>
<!-- 	<select>
		<option value="1" selected>연도회차</option>
		<option value="2" >2019 1회차</option>
		<option value="3" >2019 2회차</option>
		<option value="4" >2019 3회차</option>
		<option value="5" >2020 1회차</option>
		<option value="6" >2020 2회차</option>
	</select>
	<p></p>
	<select>
		<option value="1" selected>분류</option>
		<option value="2" >요구사항 확인</option>
		<option value="3" >화면 설계</option>
		<option value="4" >애플리케이션 설계</option>
		<option value="5" >인터페이스 설계</option>
	</select>
	<label>#해쉬태그
		<input type="text" list="hashlist" name="hash">
		<datalist id="hashlist">
			<option value="요구공학"></option>
			<option value="운영체제"></option>
			<option value="네트워크"></option>
		</datalist>
	</label> -->
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