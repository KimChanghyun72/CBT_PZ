<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="model.ProblemVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
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
	width: 60%;
}

/* Right column */
.rightcolumn {
	float: right;
	width: 40%;
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
	/* display: table;  */
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
@media screen and (max-width: 1500px) {
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
.row {
	width : 1000px;
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
List<Map<String, Object>> problemList = (List<Map<String, Object>>)request.getSession().getAttribute("problemList");
int probNum;  //문제 번호
int ansNum;  //오른쪽 문제번호
int probSize = problemList.size();
%>

var size = <%=probSize%>;
var is_submit=0;

$(function(){
	 $("#foo-table").DataTable();
	 $("div.row").eq(3).css("width","600px");
})
$(function(){ //for문은 번호를 설정해주는 역할만 하고 이벤트시에는 안 먹음.
	for(var i=0; i<size; i++){
	$(document).on("change",'input[name=problem'+i+']', function(){
		var j= $(this).attr('name').substring(7);
		var v =$(this).val();
		
		$('input:radio[name=answer'+j+']').val([v]);
	})
	
	$(document).on("change",'input[name=answer'+i+']', function(){
		var j= $(this).attr('name').substring(6);
		var v =$(this).val();
		
		$('input:radio[name=problem'+j+']').val([v]); 
	})
	}
	var cnt = 0; //문제 맞춘 갯수
	//ajax로 답지 불러오는 함수.
	function submitFunc(){
		$.ajax("${pageContext.request.contextPath}/ajax/probScoringCtrl.do", {
			dataType : "json",
			success : function(datas){
				for(i=0; i<datas.length; i++){
					console.log(datas.length)       //데이터 길이 콘솔
					if(datas[i].ans_correct == $('input[name=problem'+i+']:checked').val()){
						$('input[name=problem'+i+']').closest("td").prev().append("<div>O</div>");
						cnt = cnt+1;
						console.log(cnt);
					}else{
						$('input[name=problem'+i+']').closest("td").prev()
								.append("<div>X</div><div>정답 : "+datas[i].ans_correct+"</div>");
					}
				};
				$("[name=testNum]").val(datas.length); //문제 갯수 입력
				$("[name=testScore]").val(cnt); //성적 폼태그에 입력
			}
		})
	}
	
	
	//문제 제출하면 ajax로 답지 불러오고 제출버튼 삭제.
	$(document).on("click",".btnScore", function(){
		is_submit = confirm("제출하시겠습니까?");
		if(is_submit){
			submitFunc();
			$(this).remove();
			$(".rightcolumn").append("<button class='btnFinish'>확인</button>");
			//타이머 시간 고정.
			
			}
	});
	
	$(document).on("click", ".btnFinish", function(){
	
		console.log(cnt);
		//$("#testResult").submit();
	})
	
	
});
	

//수정중 삭제파트 1.
//카운트 시간 표시.
var SetTime = 0;		// 최초 설정 시간(기본 : 0초)
function msg_time() {	// 1초씩 카운트
	var m = Math.floor(SetTime / 60) + "분 " + (SetTime % 60) + "초";	// 남은 시간 계산
	var msg = "현재 경과된 시간은 <font color='red'>" + m + "</font> 입니다.";
	document.all.ViewTimer.innerHTML = msg;		// div 영역에 보여줌 
	 if(is_submit != true){// 제출되지 않았다면 1초씩 증가
		SetTime++;		
	} else{
		var timeCnt = SetTime;
		$("[name=testTime]").val(timeCnt);  //form에 걸린 시간 전송
		console.log(timeCnt.toFixed(0)); //콘솔에 걸린 시간 표시 (초단위)
		
		clearInterval(tid); //타이머 해제
	}

}
window.onload = function TimerStart(){ tid=setInterval('msg_time()',1000) };

</script>
</head>
<body>
	<div class="header">
		<h1>${problemList[0].paper_type_cd} ${problemList[0].paper_round}</h1>
 		<h1>${problemList[0].subject}</h1>
		<c:if test="">
		</c:if>
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
				<td><%=problemList.get(probNum).get("subject") %>
				<td class="probNum<%=probNum %>"><%=probNum+1 %>번</td>
				<td>
					<div><%=problemList.get(probNum).get("problem_text") %>&nbsp;&nbsp;<input type="checkbox"  class="probChk"></div>
					<div><input type="radio" name="problem<%=probNum%>" value="1"><%=problemList.get(probNum).get("ans_1") %></div>
					<div><input type="radio" name="problem<%=probNum%>" value="2"><%=problemList.get(probNum).get("ans_2") %></div>
					<div><input type="radio" name="problem<%=probNum%>" value="3"><%=problemList.get(probNum).get("ans_3") %></div>
					<div><input type="radio" name="problem<%=probNum%>" value="4"><%=problemList.get(probNum).get("ans_4") %></div>
					<div class="haeseol<%=problemList.get(probNum).get("problem_id") %>"></div>
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
				<div class="fakeimg">
					<table>
						<tbody>
							<% 
								for(ansNum=0; ansNum<problemList.size();ansNum++){
							%>
							<tr>
								<td class="ansNum<%=problemList.get(ansNum).get("problem_id") %>"><b><%=ansNum+1 %>. |</b></td>
								<td>&nbsp; 1<input type="radio" name="answer<%=ansNum %>" value="1"></td>
								<td>&nbsp; 2<input type="radio" name="answer<%=ansNum %>" value="2"></td>
								<td>&nbsp; 3<input type="radio" name="answer<%=ansNum %>" value="3"></td>
								<td>&nbsp; 4<input type="radio" name="answer<%=ansNum %>" value="4"></td>
							</tr>
							
							<% } %>
						</tbody>
					</table>
					<form action="${pageContext.request.contextPath}/solveInsert.do">
					<input type="hidden" name="member_id" value="${sessionScope.member_id}">		
					<input type="hidden" name="solve_type_cd" value="${problemList[0].paper_type_cd} ${problemList[0].paper_round}">
					
					<button class="btnScore">제출</button>
					</form>
					
					<div class="ans_correct"></div>
					
					<form id="testResult" name="testResult" action="ScoreInsert.do">
						<input type="text" name="testTime"> <!-- 테스트에 걸린 시간 -->
						<input type="text" name="testScore"> <!-- 테스트 성적 -->
						<input type="text" name="testNum">
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
