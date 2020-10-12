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
	position : fixed;
	bottom: 0;
    right: 0;
	float: right;
	overflow : scroll;
	width : 500px;
	height : 500px;
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
 #ques_ox1{
	 margin: 0px; 
	 position: absolute; 
	 width: 55px; 
	 height: 45px; 
	 background-image: url(&quot;./img/re_o.gif&quot;);
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

//즐겨찾기 등록/해제
$(function(){
	$(document).on("change","#favorite",function() {
		if($(this).is(":checked", true)) {
		    var paper_id = $(this).closest("tr").find('#paper_id').val();
		    $.ajax({
		        type: "POST",   
		        url: "${pageContext.request.contextPath}/ajax/myFavoriteInsert.do",
		        dataType : "json",
		        data: {
		        	paper_id : paper_id,
		        },
		        success: function(data){
		        },
		    });
		}
		else if(($(this).is(":checked", false))){
		    var paper_id = $(this).closest("tr").find('#paper_id').val();
		    $.ajax({
		        type: "POST",   
		        url: "${pageContext.request.contextPath}/ajax/myFavoriteDelete.do",
		        dataType : "json",
		        data: {
		        	paper_id : paper_id,
		        },
		        success: function(data){
		        },
		    });
		}
	})
});

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
						$('input[name=problem'+i+']').closest("td").prev()
								.append('<div id="ques_ox1"><img src="../img/o.png" style="width:35px; height:35px;"></div>');
						
					}else{
						$('input[name=problem'+i+']').closest("td").prev()
								.append('<div id="ques_ox1"><img src="../img/x.png" style="width:35px; height:35px;"></div><div style="margin-top:35px">정답 :'+datas[i].ans_correct+'</div>');
						
					}
				};
			}
		})
	}
	submitFunc();//정답, ox 불러오는 함수 실행.
});
</script>
<script>
$(document).ready(function(){

	$('.btn').click(function(){
		var id = $(this).data("id");
		var offset = $('#div'+id).offset();  //선택한 태그의 위치를 반환
		offset.top-= 150;
		console.log(offset);
            //animate()메서드를 이용해서 선택한 태그의 스크롤 위치를 지정해서 0.4초 동안 부드럽게 해당 위치로 이동함 

        $('html').animate({scrollTop : offset.top}, 300);

	});

});
</script>
</head>
<body>
	<div class="header">
		<h1>${sessionScope.pageName} ${problemList[0].solve_type_cd} </h1>
		<h4>${problemList[0].solve_score}/${problemList[0].solve_cnt}</h4>
			<div id="ViewTimer"></div>
	</div>
<div class="leftcolumn">
	<form id="testResult" name="testResult" action="ScoreInsert.do">
<table id="foo-table" class="table table-bordered">
	
		<thead>
			<tr><th width="8%">&nbsp;&nbsp;과목&nbsp;&nbsp;</th><th width="10%">번호</th><th>문제</th></tr>
		</thead>
		<tbody>
		<% for(probNum=0; probNum<problemList.size(); probNum++){ %>
			<tr>
				<td><%=problemList.get(probNum).get("subject") %>
				<td class="probNum<%=probNum %>">
					<%=probNum+1 %>번
					<br>
					<%if(problemList.get(probNum).get("is_correct").equals("1")){ %>
						
						<br>
					<% }else{ %>
						
						<br>
						정답 : <%=problemList.get(probNum).get("ans_correct") %>번
					<%} %>
				</td>
				<td>
					<div id="div<%=probNum%>"><%=problemList.get(probNum).get("problem_text") %>&nbsp;&nbsp;<input type="checkbox" id="favorite" name="probChk<%=probNum%>"></div>
					<input type="text" id="paper_id" value="<%=problemList.get(probNum).get("paper_id") %>">
					<input type="hidden" id="pro_id" value="<%=problemList.get(probNum).get("problem_id") %>">
					<% if(problemList.get(probNum).get("check_num").equals("1")) {%>
						<div><input type="radio" id="checknum" name="problem<%=probNum%>" value="1" checked><%=problemList.get(probNum).get("ans_1") %></div>
						<div><input type="radio" id="checknum" name="problem<%=probNum%>" value="2"><%=problemList.get(probNum).get("ans_2") %></div>
						<div><input type="radio" id="checknum" name="problem<%=probNum%>" value="3"><%=problemList.get(probNum).get("ans_3") %></div>
						<div><input type="radio" id="checknum" name="problem<%=probNum%>" value="4"><%=problemList.get(probNum).get("ans_4") %></div>
						<%}else if(problemList.get(probNum).get("check_num").equals("2")) { %>
						<div><input type="radio" id="checknum" name="problem<%=probNum%>" value="1"><%=problemList.get(probNum).get("ans_1") %></div>
						<div><input type="radio" id="checknum" name="problem<%=probNum%>" value="2" checked><%=problemList.get(probNum).get("ans_2") %></div>
						<div><input type="radio" id="checknum" name="problem<%=probNum%>" value="3"><%=problemList.get(probNum).get("ans_3") %></div>
						<div><input type="radio" id="checknum" name="problem<%=probNum%>" value="4"><%=problemList.get(probNum).get("ans_4") %></div>
						<%}else if(problemList.get(probNum).get("check_num").equals("3")) { %>
						<div><input type="radio" id="checknum" name="problem<%=probNum%>" value="1"><%=problemList.get(probNum).get("ans_1") %></div>
						<div><input type="radio" id="checknum" name="problem<%=probNum%>" value="2"><%=problemList.get(probNum).get("ans_2") %></div>
						<div><input type="radio" id="checknum" name="problem<%=probNum%>" value="3" checked><%=problemList.get(probNum).get("ans_3") %></div>
						<div><input type="radio" id="checknum" name="problem<%=probNum%>" value="4"><%=problemList.get(probNum).get("ans_4") %></div>
						<%}else if(problemList.get(probNum).get("check_num").equals("4")){ %>
						<div><input type="radio" id="checknum" name="problem<%=probNum%>" value="1"><%=problemList.get(probNum).get("ans_1") %></div>
						<div><input type="radio" id="checknum" name="problem<%=probNum%>" value="2"><%=problemList.get(probNum).get("ans_2") %></div>
						<div><input type="radio" id="checknum" name="problem<%=probNum%>" value="3"><%=problemList.get(probNum).get("ans_3") %></div>
						<div><input type="radio" id="checknum" name="problem<%=probNum%>" value="4" checked><%=problemList.get(probNum).get("ans_4") %></div>
						<% }else {%>
						<div><input type="radio" id="checknum" name="problem<%=probNum%>" value="1"><%=problemList.get(probNum).get("ans_1") %></div>
						<div><input type="radio" id="checknum" name="problem<%=probNum%>" value="2"><%=problemList.get(probNum).get("ans_2") %></div>
						<div><input type="radio" id="checknum" name="problem<%=probNum%>" value="3"><%=problemList.get(probNum).get("ans_3") %></div>
						<div><input type="radio" id="checknum" name="problem<%=probNum%>" value="4"><%=problemList.get(probNum).get("ans_4") %></div>
						<%} %>
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
								<td class="ansNum<%=problemList.get(ansNum).get("problem_id") %>"><button type="button" class="btn btn-outline-primary" data-id="<%=ansNum%>"><b><%=ansNum+1 %>. |</b></button></td>
								<% if(problemList.get(ansNum).get("check_num").equals("1")) {%>
									<td>&nbsp; 1<input type="radio" id="checknum" name="answer<%=ansNum %>" value="1" checked></td>
									<td>&nbsp; 2<input type="radio" id="checknum" name="answer<%=ansNum %>" value="2"></td>
									<td>&nbsp; 3<input type="radio" id="checknum" name="answer<%=ansNum %>" value="3"></td>
									<td>&nbsp; 4<input type="radio" id="checknum" name="answer<%=ansNum %>" value="4"></td>
								<% } else if(problemList.get(ansNum).get("check_num").equals("2")) { %>
									<td>&nbsp; 1<input type="radio" id="checknum" name="answer<%=ansNum %>" value="1"></td>
									<td>&nbsp; 2<input type="radio" id="checknum" name="answer<%=ansNum %>" value="2" checked></td>
									<td>&nbsp; 3<input type="radio" id="checknum" name="answer<%=ansNum %>" value="3"></td>
									<td>&nbsp; 4<input type="radio" id="checknum" name="answer<%=ansNum %>" value="4"></td>
								<% } else if(problemList.get(ansNum).get("check_num").equals("3")) { %>
									<td>&nbsp; 1<input type="radio" id="checknum" name="answer<%=ansNum %>" value="1"></td>
									<td>&nbsp; 2<input type="radio" id="checknum" name="answer<%=ansNum %>" value="2"></td>
									<td>&nbsp; 3<input type="radio" id="checknum" name="answer<%=ansNum %>" value="3" checked></td>
									<td>&nbsp; 4<input type="radio" id="checknum" name="answer<%=ansNum %>" value="4"></td>
								<% } else if(problemList.get(ansNum).get("check_num").equals("4")){ %>
									<td>&nbsp; 1<input type="radio" id="checknum" name="answer<%=ansNum %>" value="1"></td>
									<td>&nbsp; 2<input type="radio" id="checknum" name="answer<%=ansNum %>" value="2"></td>
									<td>&nbsp; 3<input type="radio" id="checknum" name="answer<%=ansNum %>" value="3"></td>
									<td>&nbsp; 4<input type="radio" id="checknum" name="answer<%=ansNum %>" value="4" checked></td>
								<% }else {%>
									<td>&nbsp; 1<input type="radio" id="checknum" name="answer<%=ansNum %>" value="1"></td>
									<td>&nbsp; 2<input type="radio" id="checknum" name="answer<%=ansNum %>" value="2"></td>
									<td>&nbsp; 3<input type="radio" id="checknum" name="answer<%=ansNum %>" value="3"></td>
									<td>&nbsp; 4<input type="radio" id="checknum" name="answer<%=ansNum %>" value="4"></td>
								<% } %>
							</tr>
							
							<% } %>
						</tbody>
					</table>
				</div>
			</div>
		</div>
</body>
</html>