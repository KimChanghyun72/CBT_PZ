<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
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

/* input[type=text], select {
  width: 50%;
  padding: 6px 10px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

input[type=submit] {
  width: 10%;
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}
input[type=reset] {
  width: 10%;
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}


input[type=submit]:hover {
  background-color: #45a049;
}

div {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}
textarea {
  width: 100%;
  height: 150px;
  padding: 12px 20px;
  box-sizing: border-box;
  border: 2px solid #ccc;
  border-radius: 4px;
  background-color: #f8f8f8;
  resize: none;
}
img {
  display: block;
  margin-left: auto;
  margin-right: auto;
  width: 70%;
} */
</style>
<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
<!-- <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->
<script>
	function checkForm() {
		if (upload.file_path.value == "") {
			alert("파일을 업로드해주세요.");
			return false;
		} else if (!checkFileType(upload.file_path.value)) {
			alert("엑셀파일만 업로드 해주세요.");
			return false;
		}
		document.upload.submit();
	}
	function checkFileType(filePath) {

		var fileLen = filePath.length;
		var fileFormat = filePath.substring(fileLen - 4);
		fileFormatfileFormat = fileFormat.toLowerCase();

		if (fileFormat == ".xlsx") {
			return true;
		} else {
			return false;
		}
	}
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
<div>
	<form method="post" name="frm" id="frm" enctype="multipart/form-data" action="insertPhead" align="center">
		<h3>문제 분류</h3>
		<input type="radio" name="paper_type_cd" id="paper_type_cd" value="a2">모의고사 
		<input type="radio" name="paper_type_cd" id="paper_type_cd" value="a1">기출문제&nbsp;&nbsp; 
		<input type="text"  name="paper_round" id="paper_round" placeholder="연도회차를 입력하세요." />&nbsp;&nbsp;<p>
	</p>
	</form>
	<form action="insertExcel" enctype="multipart/form-data" method="post" align="center">
		<img src="${pageContext.request.contextPath}/images/excelEx.jpg">
		<p><p>
			<input type="file" name="file_path" size="20" align="absmiddle" /> <br>
			<p><p>
			<input type="submit" id="submit" value="등록"> 
			<input type="reset" id="reset" value="초기화">
			<h3>해시 태그</h3>
	 code : <select name="classify_code_cd" id="classify_code_cd">
				<option value="0" selected>소분류</option>
				<option value="소프트웨어 설계">소프트웨어 설계</option>
				<option value="소프트웨어 개발">소프트웨어 개발</option>
				<option value="데이터베이스 구축">데이터베이스 구축</option>
				<option value="프로그래밍 언어 활용">프로그래밍 언어 활용</option>
				<option value="정보시스템 구축관리">정보시스템 구축관리</option>
			</select><p><p>
	 name : <input type="text" name="hashtag_name" id="hashtag_name"/>
		   	<input type="text" id="testInput" placeholder="Search">
			<!-- <button type="button">
				<i class="fa fa-search" aria-hidden="true"></i>
			</button> -->
		<p>
	</form>
</div>
</body>
</html>