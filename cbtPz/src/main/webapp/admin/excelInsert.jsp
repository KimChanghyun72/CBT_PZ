<%@page contentType="text/html;charset=euc-kr"%>
<html>
<script>
	function checkForm() {
		if (upload.file1.value == "") {
			alert("������ ���ε����ּ���.");
			return false;
		} else if (!checkFileType(upload.file1.value)) {
			alert("�������ϸ� ���ε� ���ּ���.");
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
	<form method="post" name="frm" id="frm"
		action="${pageContext.request.contextPath}/excelInsert.do"
		onsubmit="return inputCheck()">
		<td><input type="file" name="file1" size="20" align="absmiddle" />
		</td>
		<td><a onclick="checkForm();" style="cursor: hand"> [����] </a></td>
	</form>
</body>
</html>