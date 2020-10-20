<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.container {
		width: auto;
		padding: 20px;
		box-shadow: 0 3px 20px rgba(0, 0, 0, 0.15);
		/* 	    padding: 35px 50px; */
		border-radius: 6px;
		background: #f7f7f7;
}
</style>
<script>
	$(document).ready(function() {
		$("#submit").click(function() {
			if($("#subject").val()==0){
				alert("과목을 선택하세요.");
				$("#subject").focus();
				return false;
			}
			if ($("#problem_text").val().length == 0) {
				alert("문제를 입력하세요.");
				$("#problem_text").focus();
				return false;
			}
			if ($("#ans_1").val().length == 0) {
				alert("보기를  입력하세요.");
				$("#ans_1").focus();
				return false;
			}
			if ($("#ans_2").val().length == 0) {
				alert("보기를  입력하세요.");
				$("#ans_1").focus();
				return false;
			}
			if ($("#ans_3").val().length == 0) {
				alert("보기를  입력하세요.");
				$("#ans_1").focus();
				return false;
			}
			if ($("#ans_4").val().length == 0) {
				alert("보기를  입력하세요.");
				$("#ans_1").focus();
				return false;
			}
			//if($("#ans_correct").val().length==0){alert("정답을 설정하세요."); $("#ans_correct").focus(); return false;}
			if ($("#haeseol").val().length == 0) {
				alert("해설을 입력하세요.");
				$("#haeseol").focus();
				return false;
			}
			if ($("#classify_code_cd").val()== 0) {
				alert("소분류를 선택하세요.");
				$("#classify_code_cd").focus();
				return false;
			}
		/* 	if ($("#hashtag_name").val().length == 0) {
				alert("해시태그를 입력하세요.");
				$("#hashtag_name").focus();
				return false;
			} */
		});
	});
</script>
<script>
	$(function() {
		$("#testInput").autocomplete({
			source : function(request, response) {
				$.ajax({
					url : "/cbtPz/ajax/hashtagAutoSearch.do",
					type : "GET",
					dataType : "json",
					data : {
						hashtag_name : $("#testInput").val()
					}, // 검색 키워드
					success : function(data) { // 성공
						response($.map(data, function(item) {
							return {
								label : item.hashtag_name, //목록에 표시되는 값
								value : item.hashtag_name, //선택 시 input창에 표시되는 값	
								idx : item.testIdx
							};
						})); //response
					},//success
					error : function() { //실패
						//alert("통신에 실패했습니다."); 
					}
				});
			},
			open : function(evt, ui) {
				$(this).autocomplete("widget").css({
					"width" : 1000
				});
			},
			minLength : 1,
			autoFocus : false,
			/* select : function(evt, ui) {
				
				$("#tag-list").append("<li class='tag-item'><span class='hashtext'>"+ui.item.value+"</span><span class='del-btn' idx='"+ui.item.idx+"'>x</span></li>");
				console.log("전체 data: " + JSON.stringify(ui));
				console.log("db Index : " + ui.item.idx);
				console.log("검색 데이터 : " + ui.item.value);
			}, */
			focus : function(evt, ui) {
				return false;
			},
			close : function(evt) {

			}
		});

	});
</script>
<script type="text/javascript">
	
<%request.getSession().setAttribute("pageName", "개별 문제");%>
	
</script>
<script>
	$(function() {

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
		});*///문제 리스트 출력 끝
		//-----------------------문제 업데이트 코드 --------------------------
		$(".btnUpd").on("click", function() {
			confirm("수정하시겠습니까?");
			var tr = $(this).parents("tr");
			var problem_id = tr.find(".problem_id");
			var subject = tr.find(".subject");
			var problem_text = tr.find(".problem_text");
			var ans_1 = tr.find(".ans_1");
			var ans_2 = tr.find(".ans_2");
			var ans_3 = tr.find(".ans_3");
			var ans_4 = tr.find(".ans_4");
			var haeseol = tr.find(".haeseol");
			console.log(problem_id.val());
			$.ajax("/cbtPz/ajax/problemUpdate.do", {
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
				success : function(data) {
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

		});
		//--------------------------- 업데이트 ajax 끝-------------------------
		//-----------------------------삭제 ajax ----------------------------
		$(".btnDel").on("click", function() {
			confirm("삭제하시겠습니까?");
			var tr = $(this).parents("tr");
			var problem_id = tr.find(".problem_id");
			$.ajax("/cbtPz/ajax/problemDelete.do", {
				dataType : "json",
				data : {
					problem_id : problem_id.val()
				},
				success : function(data) {
					tr.remove();
				}
			})
		})

		$("#listTable").DataTable();
	});
</script>
</head>
<body>

	<div
		style="width: 100%; height: 240px; background-image: url(./images/학습.jpg)"
		class="  d-flex align-items-center justify-content-center p-3">
		<h1 style="color: #00000">개별문제</h1>
	</div>
	
	<br><br>

	<div class="container">
	<form method="post" name="frm" id="frm" class="test" action="insertPro" onsubmit="return check_submit();">
		<div class="col-12 col-lg-5">
				<div class="form-group" style="text-align: center;">
				</div>
			</div>
			<div class="col-12 col-lg-7">
				<div class="form-group">
					<select name="subject" id="subject">
						<option value="0" selected>과목</option>
						<option value="1">1과목</option>
						<option value="2">2과목</option>
						<option value="3">3과목</option>
						<option value="4">4과목</option>
						<option value="5">5과목</option>
					</select>
				</div>
			</div>

			<div class="col-12">
				<div class="form-group">
					<p>문제</p>
				</div>
			</div>
			<div class="col-12">
				<div class="form-group">
					<textarea name="problem_text" placeholder="문제를 입력하세요."
						class="form-control" id="problem_text" cols="30" rows="10"></textarea>
				</div>
			</div>

			<p></p>
			<!-- <label>문제</label>
		<p><textarea cols="50" rows="10" placeholder="문제를 입력하세요." name="problem_text" id="problem_text"></textarea></p> -->
			<label>정답</label>
	<ol list-style-type: decimal;>
		<li><input placeholder="내용을 입력해주세요." name="ans_1" id="ans_1"><input type="checkbox" name="ans_correct" id="ans_correct" value="1">
		<li><input placeholder="내용을 입력해주세요." name="ans_2" id="ans_2"><input type="checkbox" name="ans_correct" id="ans_correct" value="2">
		<li><input placeholder="내용을 입력해주세요." name="ans_3" id="ans_3"><input type="checkbox" name="ans_correct" id="ans_correct" value="3">
		<li><input placeholder="내용을 입력해주세요." name="ans_4" id="ans_4"><input type="checkbox" name="ans_correct" id="ans_correct" value="4">
	</ol><p>
	<label>해설</label>
		<p><textarea cols="50" rows="10" placeholder="해설를 입력하세요." name="haeseol" id="haeseol"></textarea></p>
	<label>해쉬태그</label><p>
	 code : <select name="classify_code_cd" id="classify_code_cd">
	 			<option value="0" selected>소분류</option>
				<option value="소프트웨어 설계">소프트웨어 설계</option>
				<option value="소프트웨어 개발">소프트웨어 개발</option>
				<option value="데이터베이스 구축">데이터베이스 구축</option>
				<option value="프로그래밍 언어 활용">프로그래밍 언어 활용</option>
				<option value="정보시스템 구축관리">정보시스템 구축관리</option>
		    </select><p>
	 name : <input type="text" name="hashtag_name" id="hashtag_name" />
		<p>
			<input type="text" id="testInput" placeholder="Search">
			<button type="button">
				<i class="fa fa-search" aria-hidden="true"></i>
			</button>
		<p>
			<input type="submit" id="submit" value="등록"> 
			<input type="reset" id="reset" value="초기화">
</form>
	</div>
	
	<br><br><br><br>
	
	
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
				<c:forEach items="${proList}" var="problemList">
					<tr>
						<td><input type="hidden" class="problem_id"
							value="${problemList.problem_id}">
							<div contenteditable="true" class="subject">${problemList.subject}</div></td>
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