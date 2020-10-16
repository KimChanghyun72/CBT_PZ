<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
	<form method="post" name="frm" id="frm" enctype="multipart/form-data"
		action="insertPhead">
		<h3>문제 분류</h3>
		<input type="radio" name="paper_type_cd" id="paper_type_cd" value="a2">모의고사 
		<input type="radio" name="paper_type_cd" id="paper_type_cd" value="a1">기출문제&nbsp;&nbsp; 
		<input type="text"  name="paper_round" id="paper_round" placeholder="연도회차를 입력하세요." />&nbsp;&nbsp;<p>
	</p>
	</form>
	<form action="insertExcel" enctype="multipart/form-data" method="post">
		<img src="${pageContext.request.contextPath}/images/Desert.jpg" 
			style="width: 300px">
		<p>
			<input type="file" name="file_path" size="20" align="absmiddle" /> <br>
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
			<input type="submit" id="submit" value="등록"> <input
				type="reset" id="reset" value="초기화">
	</form>
</body>
</html>