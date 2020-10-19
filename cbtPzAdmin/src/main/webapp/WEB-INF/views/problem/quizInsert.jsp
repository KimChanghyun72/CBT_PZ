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
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
</head>
<body>
	<form method="post" name="frm" id="frm" action="insertPro"
		onsubmit="return check_submit();">
		<select name="subject" id="subject">
			<option value="0" selected>과목</option>
			<option value="1과목">1과목</option>
			<option value="2과목">2과목</option>
			<option value="3과목">3과목</option>
			<option value="4과목">4과목</option>
			<option value="5과목">5과목</option>
		</select>
		<p></p>
		<label>문제</label>
		<p>
			<textarea cols="50" rows="10" placeholder="문제를 입력하세요."
				name="problem_text" id="problem_text"></textarea>
		</p>
		<label>정답</label>
		<ol>
			<li><input placeholder="내용을 입력해주세요." name="ans_1" id="ans_1"><input
				type="checkbox" name="ans_correct" id="ans_correct" value="1">
			<li><input placeholder="내용을 입력해주세요." name="ans_2" id="ans_2"><input
				type="checkbox" name="ans_correct" id="ans_correct" value="2">
			<li><input placeholder="내용을 입력해주세요." name="ans_3" id="ans_3"><input
				type="checkbox" name="ans_correct" id="ans_correct" value="3">
			<li><input placeholder="내용을 입력해주세요." name="ans_4" id="ans_4"><input
				type="checkbox" name="ans_correct" id="ans_correct" value="4">
		</ol>
		<label>해설</label>
		<p>
			<textarea cols="50" rows="10" placeholder="해설를 입력하세요." name="haeseol"
				id="haeseol"></textarea>
		</p>
		<label>해쉬태그</label><br> 
	 code : <select name="classify_code_cd" id="classify_code_cd">
	 			<option value="0" selected>소분류</option>
				<option value="소프트웨어 설계">소프트웨어 설계</option>
				<option value="소프트웨어 개발">소프트웨어 개발</option>
				<option value="데이터베이스 구축">데이터베이스 구축</option>
				<option value="프로그래밍 언어 활용">프로그래밍 언어 활용</option>
				<option value="정보시스템 구축관리">정보시스템 구축관리</option>
		    </select> 
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
</body>
</html>