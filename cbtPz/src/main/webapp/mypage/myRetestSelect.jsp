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
	bottom: 150px;
    right: 0;
	float: right;
	overflow : scroll;
	width : 380px;
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

.astyle { 
	text-decoration: none; box-shadow: 0 -18px rgba(255, 0, 0, 0.3) inset;
}
#fa { 
	text-decoration: none; 
	border: rgba(75, 112, 253, 0.3) solid; 
	border-width: 0 0 6px 0; 
}

.checkbox-wrap { cursor: pointer; }
.checkbox-wrap .check-icon  { display: inline-block; width: 20px; height: 18px; background: url(../img/fav0.png) left center no-repeat; vertical-align: middle; transition-duration: .4s; }
.checkbox-wrap input[type=checkbox] { display: none; }
.checkbox-wrap input[type=checkbox]:checked + .check-icon { background-image: url(../img/fav1.png);}
 
#haeseol{
	color : #679467;
	font-weight: bold;
}

</style>

<script>
<%
List<Map<String, Object>> problemList = (List<Map<String, Object>>)request.getSession().getAttribute("problemList");
int probNum;  //문제 번호
int ansNum;  //오른쪽 문제번호d
int probSize = problemList.size();

%>

var size = <%=probSize%>;
var is_submit=0;

//즐겨찾기 등록/해제
$(function(){
	$(document).on("change","#favorite",function() {
		if($(this).is(":checked", true)) {
		    var problem_id = $(event.target).parent().next().val();
		    $.ajax({	
		        type: "POST",   
		        url: "${pageContext.request.contextPath}/ajax/myFavoriteInsert.do",
		        dataType : "json",
		        data: {
		        	problem_id : problem_id,
		        },
		        success: function(data){
		        },
		    });
		}
		else {
			var problem_id = $(event.target).parent().next().val();
		    $.ajax({
		        type: "POST",   
		        url: "${pageContext.request.contextPath}/ajax/myFavoriteDelete.do",
		        dataType : "json",
		        data: {
		        	problem_id : problem_id,
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
		console.log("함수 실행됨");
		$.ajax("${pageContext.request.contextPath}/ajax/probScoringCtrl.do", {
			data : {
				 solve_id : solve_id,
				 testTime : testTime				 
				},
			dataType : "json",
			success : function(datas){
				for(i=0; i<datas.length; i++){
					console.log(datas.length)       //데이터 길이 콘솔출력
					//$(".haeseol"+i).html(datas[i].haeseol); //해설 출력
					if(datas[i].ans_correct == $('input[name=problem'+i+']:checked').val()){
						$('input[name=problem'+i+']').closest("td").prev()
								/*.append('<div id="ques_ox1"><img src="../img/o1.png" style="width:300x; height:70px;"></div>');*/
								
						
					}else{
						$('input[name=problem'+i+']').closest("td").prev()
								/*.append('<div id="ques_ox1"><img src="../img/x1.png" style="width:50px; height:35px;"></div>');*/
						/*$('input[name=problem'+i+']').eq(i).div()
						<div style="color:white; background-color:red;">
						*/
					}
				};
			}
		})
	}
	submitFunc();//정답, ox 불러오는 함수 실행.

	$(document).on("change", "#foo-table", submitFunc());
	
	//$("#foo-table").DataTable()
	//해시태그 문제 등록시 정렬 다르게
	var solve_cd = $("#solve_type_cd").val();	
	console.log(solve_cd);
    if(solve_cd.indexOf('#') != -1){
 	   $("#foo-table").DataTable({
         order: []
       });       
    } else {
       $("#foo-table").DataTable();
    } 
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
		<h1>${problemList[0].solve_type_name} </h1>
		<h4>${problemList[0].solve_score}/${problemList[0].solve_cnt}</h4>
			<div id="ViewTimer"></div>
	</div>
<div class="leftcolumn">
<div>&emsp;&emsp;<a id="fa"><img src="../img/fav0.png">클릭시 즐겨찾기 추가</a></div><br><br>	
	
	
<input id="solve_type_cd" type="hidden" value="${problemList[0].solve_type_cd}">


	<form id="testResult" name="testResult" action="ScoreInsert.do">
<table id="foo-table" class="table table-bordered">
		<thead align="center">
			<tr><th width="13%">&nbsp;&nbsp;과목&nbsp;&nbsp;</th><th width="10%">번호</th><th>문제</th></tr>
		</thead>
		<tbody>
		<% for(probNum=0; probNum<problemList.size(); probNum++){ %>
			<tr>
				<td align="center"><%=problemList.get(probNum).get("subject_name") %>
				<td class="probNum<%=probNum %>" align="center" width="6%">
					<%=probNum+1 %>번
					<br><br>
					<%if(problemList.get(probNum).get("is_correct").equals("1")){ %>
						<div id="ques_ox1" align="center"><img src="../img/o1.png" style="width:300x; height:70px;"></div>
					<% }else{ %>
	 					<div id="ques_ox1" align="center"><img src="../img/x1.png" style="width:50px; height:35px;"></div>
						
					<%} %>
				</td>
				<td>
					<div id="div<%=probNum%>"><%=problemList.get(probNum).get("problem_text") %>&nbsp;&nbsp;
						<% if(problemList.get(probNum).get("fav").equals(0)) {%>
						<label class="checkbox-wrap">
						<input type="checkbox" id="favorite" name="probChk<%=probNum%>"><i class="check-icon"></i>
						</label>
						<%} else { %>
						<label class="checkbox-wrap">
						<input type="checkbox" id="favorite" name="probChk<%=probNum%>" checked><i class="check-icon"></i>
						</label>
						<%} %>
						<input type="hidden" id="problem_id" value="<%=problemList.get(probNum).get("problem_id") %>">
					</div>
					<input type="hidden" id="paper_id" value="<%=problemList.get(probNum).get("paper_id") %>">
					<input type="hidden" id="pro_id" value="<%=problemList.get(probNum).get("problem_id") %>">
					<% if(problemList.get(probNum).get("check_num").equals("1")) {%>
						<div><input type="radio" id="checknum" name="problem<%=probNum%>" value="1" checked><a><%=problemList.get(probNum).get("ans_1") %></a></div>
						<div><input type="radio" id="checknum" name="problem<%=probNum%>" value="2"><a><%=problemList.get(probNum).get("ans_2") %></a></div>
						<div><input type="radio" id="checknum" name="problem<%=probNum%>" value="3"><a><%=problemList.get(probNum).get("ans_3") %></a></div>
						<div><input type="radio" id="checknum" name="problem<%=probNum%>" value="4"><a><%=problemList.get(probNum).get("ans_4") %></a></div>
						<%}else if(problemList.get(probNum).get("check_num").equals("2")) { %>
						<div><input type="radio" id="checknum" name="problem<%=probNum%>" value="1"><a><%=problemList.get(probNum).get("ans_1") %></a></div>
						<div><input type="radio" id="checknum" name="problem<%=probNum%>" value="2" checked><a><%=problemList.get(probNum).get("ans_2") %></a></div>
						<div><input type="radio" id="checknum" name="problem<%=probNum%>" value="3"><a><%=problemList.get(probNum).get("ans_3") %></a></div>
						<div><input type="radio" id="checknum" name="problem<%=probNum%>" value="4"><a><%=problemList.get(probNum).get("ans_4") %></a></div>
						<%}else if(problemList.get(probNum).get("check_num").equals("3")) { %>
						<div><input type="radio" id="checknum" name="problem<%=probNum%>" value="1"><a><%=problemList.get(probNum).get("ans_1") %></a></div>
						<div><input type="radio" id="checknum" name="problem<%=probNum%>" value="2"><a><%=problemList.get(probNum).get("ans_2") %></a></div>
						<div><input type="radio" id="checknum" name="problem<%=probNum%>" value="3" checked><a><%=problemList.get(probNum).get("ans_3") %></a></div>
						<div><input type="radio" id="checknum" name="problem<%=probNum%>" value="4"><a><%=problemList.get(probNum).get("ans_4") %></a></div>
						<%}else if(problemList.get(probNum).get("check_num").equals("4")){ %>
						<div><input type="radio" id="checknum" name="problem<%=probNum%>" value="1"><a><%=problemList.get(probNum).get("ans_1") %></a></div>
						<div><input type="radio" id="checknum" name="problem<%=probNum%>" value="2"><a><%=problemList.get(probNum).get("ans_2") %></a></div>
						<div><input type="radio" id="checknum" name="problem<%=probNum%>" value="3"><a><%=problemList.get(probNum).get("ans_3") %></a></div>
						<div><input type="radio" id="checknum" name="problem<%=probNum%>" value="4" checked><a><%=problemList.get(probNum).get("ans_4") %></a></div>
						<% }else {%>
						<div><input type="radio" id="checknum" name="problem<%=probNum%>" value="1"><a><%=problemList.get(probNum).get("ans_1") %></a></div>
						<div><input type="radio" id="checknum" name="problem<%=probNum%>" value="2"><a><%=problemList.get(probNum).get("ans_2") %></a></div>
						<div><input type="radio" id="checknum" name="problem<%=probNum%>" value="3"><a><%=problemList.get(probNum).get("ans_3") %></a></div>
						<div><input type="radio" id="checknum" name="problem<%=probNum%>" value="4"><a><%=problemList.get(probNum).get("ans_4") %></a></div>
						<%} %>
						<script>
						//정답일 경우 class를 추가해줘서 정답표시
						$('[name=problem<%=probNum%>][value=<%=problemList.get(probNum).get("ans_correct")%>]').next().addClass("astyle")
						</script>
					<input type="hidden" name="is_correct<%=probNum%>" >
					<br>
					<!--해설 출력 -->
					<div id="haeseol" class="haeseol<%=probNum %>">해설) <br> <%=problemList.get(probNum).get("haeseol")%></div>	
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