<%@page import="model.ProblemVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>StudyPaper.jsp</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {
	box-sizing: border-box;
}

body {
	font-family: Arial;
	padding: 10px;
	background: #f1f1f1;
}

/* Header/Blog Title */
.header {
	padding: 30px;
	text-align: center;
	background: white;
}

.header h1 {
	font-size: 50px;
}

/* Style the top navigation bar */
.topnav {
	overflow: hidden;
	background-color: #333;
}

/* Style the topnav links */
.topnav a {
	float: left;
	display: block;
	color: #f2f2f2;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

/* Change color on hover */
.topnav a:hover {
	background-color: #ddd;
	color: black;
}

/* Create two unequal columns that floats next to each other */
/* Left column */
.leftcolumn {
	float: left;
	width: 75%;
}

/* Right column */
.rightcolumn {
	float: left;
	width: 25%;
	background-color: #f1f1f1;
	padding-left: 20px;
}

/* Fake image */
.fakeimg {
	background-color: #aaa;
	width: 100%;
	padding: 20px;
}

/* Add a card effect for articles */
.card {
	background-color: white;
	padding: 20px;
	margin-top: 20px;
}

/* Clear floats after the columns */
.row:after {
	content: "";
	display: table;
	clear: both;
}

/* Footer */
.footer {
	padding: 20px;
	text-align: center;
	background: #ddd;
	margin-top: 20px;
}

/* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 800px) {
	.leftcolumn, .rightcolumn {
		width: 100%;
		padding: 0;
	}
}

/* Responsive layout - when the screen is less than 400px wide, make the navigation links stack on top of each other instead of next to each other */
@media screen and (max-width: 400px) {
	.topnav a {
		float: none;
		width: 100%;
	}
}

.haeseol {
	visibility:hidden;
}
.probChk {
	visibility:hidden;
}
 #scoreFrm, .pre-submitBtn{
 	visibility:hidden;
}
 .after-Scoring{
 	visibility:hidden;
 }

</style>
<link rel="stylesheet" href="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.css"/> 
<script src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script>
<script>
<%
ArrayList<ProblemVO> problemList = (ArrayList<ProblemVO>)request.getAttribute("problemList");
int probNum;  //문제 번호
int ansNum;  //오른쪽 문제번호
int probSize = problemList.size();
%>
var size = <%=probSize%>;

$(function(){
	 $("#foo-table").DataTable();
})
$(function(){ //for문은 번호를 설정해주는 역할만 하고 이벤트시에는 안 먹음.
	for(var i=0; i<size; i++){
	$('input[name=problem'+i+']').on("change", function(){
		var j= $(this).attr('name').substring(7);
		var v =$(this).val();
		
		$('input:radio[name=answer'+j+']').val([v]);
	})
	
	$('input[name=answer'+i+']').on("change", function(){
		var j= $(this).attr('name').substring(6);
		var v =$(this).val();
		
		$('input:radio[name=problem'+j+']').val([v]);
	})
	
	}
});
	

//수정중 삭제파트 1.
</script>
<script>
//카운트 시간 표시.
var SetTime = 1800;		// 최초 설정 시간(기본 : 초)
function msg_time() {	// 1초씩 카운트
	var m = Math.floor(SetTime / 60) + "분 " + (SetTime % 60) + "초";	// 남은 시간 계산
	var msg = "현재 남은 시간은 <font color='red'>" + m + "</font> 입니다.";
	document.all.ViewTimer.innerHTML = msg;		// div 영역에 보여줌 
	SetTime--;					// 1초씩 감소
	if (SetTime < 0) {			// 시간이 종료 되었으면..
		clearInterval(tid);		// 타이머 해제
		alert("종료");
	}
}
window.onload = function TimerStart(){ tid=setInterval('msg_time()',1000) };

</script>
</head>
<body>
	<div class="header">
		<h1>Header</h1>
			<div id="ViewTimer"></div>
	</div>
<div class="leftcolumn">
<table id="foo-table" class="table table-bordered">
	
		<thead>
			<tr><th>과목</th><th>번호</th><th>문제</th></tr>
		</thead>
		<tbody>
		<% for(probNum=0; probNum<problemList.size(); probNum++){ %>
			<tr>
				<td><%=problemList.get(probNum).getSubject() %>
				<td class="probNum<%=probNum %>"><%=probNum+1 %>번</td>
				<td>
					<div><%=problemList.get(probNum).getProblem_text() %>&nbsp;&nbsp;<input type="checkbox"  class="probChk"></div>
					<div><input type="radio" name="problem<%=probNum%>" value="1"><%=problemList.get(probNum).getAns_1() %></div>
					<div><input type="radio" name="problem<%=probNum%>" value="2"><%=problemList.get(probNum).getAns_2() %></div>
					<div><input type="radio" name="problem<%=probNum%>" value="3"><%=problemList.get(probNum).getAns_3() %></div>
					<div><input type="radio" name="problem<%=probNum%>" value="4"><%=problemList.get(probNum).getAns_4() %></div>
					<div class="haeseol<%=probNum %>"></div>
				</td>
			</tr>
			<% } %>
		</tbody>
    </table>
    
</div>

	<div class="row">
		<div class="rightcolumn">
			<div class="card">
				<h3>정답확인</h3>
				<form class="scoreFrm" action=""> <!-- 답지 제출 폼 -->
				<div class="fakeimg">
					<table>
						<tbody>
						
							<% 
								for(ansNum=0; ansNum<problemList.size();ansNum++){
							%>
							<tr>
								<td class="ansNum<%=problemList.get(ansNum).getProblem_id() %>"><b><%=ansNum+1 %>. |</b></td>
								<td>&nbsp; 1<input type="radio" name="answer<%=ansNum %>" value="1"></td>
								<td>&nbsp; 2<input type="radio" name="answer<%=ansNum %>" value="2"></td>
								<td>&nbsp; 3<input type="radio" name="answer<%=ansNum %>" value="3"></td>
								<td>&nbsp; 4<input type="radio" name="answer<%=ansNum %>" value="4"></td>
							</tr>
							
							<% } %>
							
						</tbody>
					</table>
					<input type="submit" class="Scoring" value="제출">
				</div>
			</form>				
			</div>
		</div>
	</div>
</body>
</html>
