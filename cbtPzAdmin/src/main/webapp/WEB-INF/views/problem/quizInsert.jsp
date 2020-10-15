<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>    
	.center {
	  padding: 30px;
	  text-align: center;
	  background: white;
	}

	
</style>
</head>
<body>
<form method="post" name="frm" id="frm" 
   	  action="insertPro"
   	  onsubmit = "return inputCheck()">
	<select name="subject" id="subject">
		<option value="0" selected>과목</option>
		<option value="1과목" >1과목</option>
		<option value="2과목" >2과목</option>
		<option value="3과목" >3과목</option>
		<option value="4과목" >4과목</option>
		<option value="5과목" >5과목</option>
	</select>
		<p></p>
	<label>문제</label>
		<p><textarea cols="50" rows="10" placeholder="문제를 입력하세요." name="problem_text" id="problem_text"></textarea></p>
	<label>정답</label>
	<ol>
		<li><input placeholder="내용을 입력해주세요." name="ans_1" id="ans_1"><input type="checkbox" name="ans_correct" id="ans_correct" value="1">
		<li><input placeholder="내용을 입력해주세요." name="ans_2" id="ans_2"><input type="checkbox" name="ans_correct" id="ans_correct" value="2">
		<li><input placeholder="내용을 입력해주세요." name="ans_3" id="ans_3"><input type="checkbox" name="ans_correct" id="ans_correct" value="3">
		<li><input placeholder="내용을 입력해주세요." name="ans_4" id="ans_4"><input type="checkbox" name="ans_correct" id="ans_correct" value="4">
	</ol>
	<label>해설</label>
		<p><textarea cols="50" rows="10" placeholder="해설를 입력하세요." name="haeseol" id="haeseol"></textarea></p>
	<label>해쉬태그</label><br>
		 code : <select name="classify_code_cd">
				    <option value="소프트웨어 설계">소프트웨어 설계</option>
				    <option value="소프트웨어 개발">소프트웨어 개발</option>
				    <option value="데이터베이스 구축">데이터베이스 구축</option>
				    <option value="프로그래밍 언어 활용">프로그래밍 언어 활용</option>
				    <option value="정보시스템 구축관리">정보시스템 구축관리</option>
		   	    </select>
		 name : <input type="text" name="hashtag_name" id="hashtag_name"/><p>
	<button>등록</button>
	<button>초기화</button>
</form>
</body>
</html>