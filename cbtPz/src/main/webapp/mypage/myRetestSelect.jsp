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
	float: right;
	width: 25%;
	/* background-color: #f1f1f1; */
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
	$(document).on("click", "#checknum", function () {
	    var checkNum = $(this).val();
	    var paper_id = $(this).closest("tr").find('#paper_id').val();
	    var pro_id = $(this).closest("tr").find('#pro_id').val();
	    $.ajax({
	        type: "POST",   
	        url: "${pageContext.request.contextPath}/ajax/paperUpdate.do",
	        dataType : "json",
	        data: {
	        	check_num : checkNum,
	        	paper_id : paper_id,
	        	problem_id : pro_id
	        },
	        success: function(data){
	           
	        },
	    });
	});
})
	

$(function(){
	
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
		var solve_id = $('#solve_id').val();
		var testTime = $('#testTime').val();
		$.ajax("${pageContext.request.contextPath}/ajax/probScoringCtrl.do", {
			data : {
				 solve_id : solve_id,
				 testTime : testTime				 
				},
			dataType : "json",
			success : function(datas){
				for(i=0; i<datas.length; i++){
					console.log(datas.length)       //데이터 길이 콘솔출력
					$(".haeseol"+i).html(datas[i].haeseol); //헤설 출력
					if(datas[i].ans_correct == $('input[name=problem'+i+']:checked').val()){
						$('input[name=problem'+i+']').closest("td").prev().append("<div>O</div>");
						$("input[name=is_correct"+i+"]").val("Y");
						cnt = cnt+1; //정답 갯수 ++
						console.log(cnt);//정답 개수 콘솔
					}else{
						$('input[name=problem'+i+']').closest("td").prev()
								.append("<div>X</div><div>정답 : "+datas[i].ans_correct+"</div>");
						$("input[name=is_correct"+i+"]").val("N");
					}
				};
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
	var m = Math.floor(SetTime / 60) + "분 " + (SetTime % 60) + "초";	//남은 시간 계산
	var msg = "현재 경과된 시간은 <font color='red'>" + m + "</font> 입니다.";
	document.all.ViewTimer.innerHTML = msg;		// div 영역에 보여줌 
	 if(is_submit != true){// 제출되지 않았다면 1초씩 증가
		SetTime++;
	 $("[name=testTime]").val(SetTime)
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
		<h1>${sessionScope.pageName} ${problemList[0].solve_type_cd} </h1>
		<c:if test="">
		</c:if>
			<div id="ViewTimer"></div>
	</div>
<div class="leftcolumn">
	<form id="testResult" name="testResult" action="ScoreInsert.do">
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
					<div><%=problemList.get(probNum).get("problem_text") %>&nbsp;&nbsp;<input type="checkbox"  name="probChk<%=probNum%>"></div>
					<input type="hidden" id="paper_id" value="<%=problemList.get(probNum).get("paper_id") %>">
					<input type="hidden" id="pro_id" value="<%=problemList.get(probNum).get("problem_id") %>">
					<div><input type="radio" id="checknum" name="problem<%=probNum%>" value="1"><%=problemList.get(probNum).get("ans_1") %></div>
					<div><input type="radio" id="checknum" name="problem<%=probNum%>" value="2"><%=problemList.get(probNum).get("ans_2") %></div>
					<div><input type="radio" id="checknum" name="problem<%=probNum%>" value="3"><%=problemList.get(probNum).get("ans_3") %></div>
					<div><input type="radio" id="checknum" name="problem<%=probNum%>" value="4"><%=problemList.get(probNum).get("ans_4") %></div>
					<input type="text" name="is_correct<%=probNum%>">
					<div class="haeseol<%=probNum %>"></div>
				</td>
			</tr>
			<% } %>
		</tbody>
    </table>
	</form>
</div>

	<!-- <div class="row"> -->
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
								<td><input type="hidden" id="paper_id" value="<%=problemList.get(ansNum).get("paper_id") %>"></td>
								<td><input type="hidden" id="pro_id" value="<%=problemList.get(ansNum).get("problem_id") %>"></td>
								<td class="ansNum<%=problemList.get(ansNum).get("problem_id") %>"><b><%=ansNum+1 %>. |</b></td>
								<td>&nbsp; 1<input type="radio" id="checknum" name="answer<%=ansNum %>" value="1"></td>
								<td>&nbsp; 2<input type="radio" id="checknum" name="answer<%=ansNum %>" value="2"></td>
								<td>&nbsp; 3<input type="radio" id="checknum" name="answer<%=ansNum %>" value="3"></td>
								<td>&nbsp; 4<input type="radio" id="checknum" name="answer<%=ansNum %>" value="4"></td>
							</tr>
							
							<% } %>
						</tbody>
					</table>
						<input type="hidden" id="solve_id" name="solve_id" value="${problemList[0].solve_id}">
						<input type="hidden" id="testTime" name="testTime"> <!-- 테스트에 걸린 시간 -->
					<div class="ans_correct"></div>
				</div>
			</div>
			<button class="btnScore">제출</button>
		</div>
	<!-- </div> -->
</body>
</html>