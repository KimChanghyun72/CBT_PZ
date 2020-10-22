<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.test {
    width: 30%;
    border-radius: 6px;
    border: 1px solid #ebebeb;
    height: 40px;
    padding: 15px 20px;
    color: rgba(0, 0, 0, 0.25);
    font-size: 12px;
    font-weight: 600;
    margin-bottom: 20px;
   


	.container{
		width : auto;
		padding : 20px;
		box-shadow: 0 3px 20px rgba(0, 0, 0, 0.15);
/* 	    padding: 35px 50px; */
    	border-radius: 6px;
    	background:#f7f7f7;
	
	}
</style>
<script type="text/javascript">
	<%request.getSession().setAttribute("pageName", "개별 문제");%>
</script>
<script>

	$(function(){
		
		//---------------------------- 문제 리스트 출력 ----------------------------
		/*$.ajax("${pageContext.request.contextPath}/ajax/problemList.do", {
			dataType : "json",
			success : function(datas){
				for(i=0; i<datas.length; i++){
					$("<tr>").append("<td><div>"+datas[i].subject+"</div></td>")
					.append("<td><div>"+datas[i].problem_text+"</div></td>")
					.append("<td><div>"+datas[i].ans_1+"</div></td>")
					.append("<td><div>"+datas[i].ans_2+"</div></td>")
					.append("<td><div>"+datas[i].ans_3+"</div></td>")
					.append("<td><div>"+datas[i].ans_4+"</div></td>")
					.append("<td><div>"+datas[i].haeseol+"</div></td>")
					.append("<td><button>삭제</button></td>")
					.appendTo($("#listTable tbody"));
				}
			}
		});*/ //문제 리스트 출력 끝
		
		//-----------------------문제 업데이트 코드 --------------------------
		$(".btnUpd").on("click", function(){
			confirm("수정하시겠습니까?");
			if(confirm==1){
			var tr = $(this).parents("tr");
			var problem_id = tr.find(".problem_id");
			var subject = tr.find(".subject"); var problem_text = tr.find(".problem_text");
			var ans_1 = tr.find(".ans_1");var ans_2 = tr.find(".ans_2"); var ans_3 = tr.find(".ans_3"); var ans_4 = tr.find(".ans_4");
			var haeseol = tr.find(".haeseol");
			console.log(problem_id.val());
			$.ajax("${pageContext.request.contextPath}/ajax/problemUpdate.do", {
				dataType : "json",
				data : {
							problem_id : problem_id.val(),
							subject : subject.html(),
							problem_text : problem_text.html(),
							ans_1 : ans_1.html(),
							ans_2 : ans_2.html(),
							ans_3 : ans_3.html(),
							ans_4 : ans_4.html(),
							haeseol : haeseol.html()
				},
				success : function(data){
					console.log("update됨.")
					subject.html(data.subject);
					problem_text.html(data.problem_text);
					ans_1.html(data.ans_1);
					ans_2.html(data.ans_2);
					ans_3.html(data.ans_3);
					ans_4.html(data.ans_4);
					haeseol.html(data.haeseol);
				}
			})			
		}		
		});
//--------------------------- 업데이트 ajax 끝-------------------------
//-----------------------------삭제 ajax ----------------------------
	$(".btnDel").on("click", function(){
		confirm("삭제하시겠습니까?");
		if(confirm==1){
			var tr = $(this).parents("tr");
			var problem_id = tr.find(".problem_id");
			$.ajax("${pageContext.request.contextPath}/ajax/problemDelete.do", {
				dataType : "json",
				data : {
					problem_id : problem_id.val()
				},
				success : function(data){
					tr.remove();
				}
			})
		}
	})

		
		$("#listTable").DataTable();
	});

</script>
</head>
<body>
<div class="container">
<form method="post" name="frm" id="frm" 
   	  action="${pageContext.request.contextPath}/problemInsert.do"
   	  onsubmit = "return inputCheck()">
   	  
   	  <div class="col-12 col-lg-5">
		<div class="form-group" style="text-align: center;">
				<p>Job</p>
			</div>
			</div>
		<div class="col-12 col-lg-7">
	        <div class="form-group">
				<select name="subject" id="subject">
					<option value="0" selected>과목</option>
					<option value="1" >1과목</option>
					<option value="2" >2과목</option>
					<option value="3" >3과목</option>
					<option value="4" >4과목</option>
					<option value="5" >5과목</option>
				</select>
			</div>
			</div>
		
		<div class="col-12">
           <div class="form-group" >
              <p>문제</p>
           </div>
        </div>
           <div class="col-12">
               <div class="form-group">
                  <textarea name="problem_text" placeholder="문제를 입력하세요." class="form-control" id="problem_text" cols="30" rows="10"></textarea>
               </div>
           </div>
           
		<p></p>
	<!-- <label>문제</label>
		<p><textarea cols="50" rows="10" placeholder="문제를 입력하세요." name="problem_text" id="problem_text"></textarea></p> -->
	
	<label>정답</label>
	<ol list-style-type:decimal;>
		<li><input placeholder="내용을 입력해주세요." name="ans_1" id="ans_1" class="test"><input type="checkbox" name="ans_correct" id="ans_correct" value="1"></li>
		<li><input placeholder="내용을 입력해주세요." name="ans_2" id="ans_2" class="test"><input type="checkbox" name="ans_correct" id="ans_correct" value="2"></li>
		<li><input placeholder="내용을 입력해주세요." name="ans_3" id="ans_3" class="test"><input type="checkbox" name="ans_correct" id="ans_correct" value="3"></li>
		<li><input placeholder="내용을 입력해주세요." name="ans_4" id="ans_4" class="test"><input type="checkbox" name="ans_correct" id="ans_correct" value="4"></li>
	</ol>
	
	<label>해설</label>
		<p><textarea cols="50" rows="10" placeholder="해설를 입력하세요." name="haeseol" id="haeseol"></textarea></p>
		<input type="text" id="paperhead_id" name="paperhead_id"/>
	<button>등록</button>
	<button>초기화</button>
</form>
	</div>
	<div class="container">
		<table id="listTable" class="display">
			<thead>
				<tr bgcolor="skyblue">
					<th>과목</th>
					<th>문제</th>
					<th>보기1</th>
					<th>보기2</th>
					<th>보기3</th>
					<th>보기4</th>
					<th>정답</th>
					<th>수정</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach  items="${problemList}" var="problemList">
				<tr>
					<td><input type="hidden" class="problem_id" value="${problemList.problem_id}"><div contenteditable="true" class="subject">${problemList.subject_name}
					<input type="text" class="subject" value="${problemList.subject}"></div></td>
					<td><div contenteditable="true" class="problem_text">${problemList.problem_text}</div></td>
					<td><div contenteditable="true" class="ans_1">${problemList.ans_1}</div></td>
					<td><div contenteditable="true" class="ans_2">${problemList.ans_2}</div></td>
					<td><div contenteditable="true" class="ans_3">${problemList.ans_3}</div></td>
					<td><div contenteditable="true" class="ans_4">${problemList.ans_4}</div></td>
					<td><div contenteditable="true" class="haeseol">${problemList.haeseol}</div></td>
					<td><button class="btnUpd">수정</button>
					<td><button class="btnDel">삭제</button>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
</body>
</html>