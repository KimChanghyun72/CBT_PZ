<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
	function checkForm() {
		if (upload.file1.value == "") {
			alert("파일을 업로드해주세요.");
			return false;
		} else if (!checkFileType(upload.file1.value)) {
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
<body>
<div style="height: 100px;; background-color: navy; color: white; font-size: 3.0em; text-align: center;">관리자 페이지</div>
<form method="post" name="frm" id="frm" enctype="multipart/form-data"
   	  action="${pageContext.request.contextPath}/excelInsert.do">
<h3>문제 분류</h3>
	<input type="radio" name="paper_type_cd" id="paper_type_cd" value="모의고사">모의고사 &nbsp;&nbsp; 
	<input type="text" name="paper_round" id="paper_round" placeholder="연도회차를 입력하세요."/>&nbsp;&nbsp;
	<button>등록</button>
	<br>
	<input type="radio" name="paper_type_cd" id="paper_type_cd" value="기출문제">기출문제<br>
	<input type="file" name="excel_file" size="20" align="absmiddle"/>
</form>
<form method="post" name="frm" id="frm" 
   	  action="${pageContext.request.contextPath}/hashInsert.do"
   	  onsubmit = "return inputCheck()">
<h3>해쉬태그 등록</h3>
<label>#해쉬태그
		<input type="text" list="hashlist" name="hash">
		<datalist id="classify_code_cd"  >
			<option value="요구공학"></option>
			<option value="운영체제"></option>
			<option value="네트워크"></option>
		</datalist>
	</label>
	<input type="text" name="examInput" placeholder="키워드를 입력하세요."/>&nbsp;&nbsp;
	<button>등록</button>
</form>
</body>
</html>