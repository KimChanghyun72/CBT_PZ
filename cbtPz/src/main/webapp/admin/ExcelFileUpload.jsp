<%@page contentType="text/html;charset=UTF-8" isELIgnored="false"%>
<html>
<script>  
function checkForm() {   
 if (upload.file_path.value == "") {   
  alert("파일을 업로드해주세요.");   
  return false;   
 }  else if(!checkFileType(upload.file_path.value)) {   
  alert("엑셀파일만 업로드 해주세요.");   
  return false;   
 }   
  document.upload.submit();
}   
function checkFileType(filePath){   
  
 var fileLen = filePath.length;   
 var fileFormat = filePath.substring(fileLen - 4);   
 fileFormatfileFormat = fileFormat.toLowerCase();   
  
 if (fileFormat == ".xls"){   return true;    
 }   else{     return false;     }   
}   
</script>  
 
<body>
<form action="${pageContext.request.contextPath}/excelInsert.do" name="upload" method="POST" enctype="multipart/form-data">
<<input type="file" name="file_path" size="20" align="absmiddle" />
<td><a onclick="checkForm();" style="cursor:hand"> [전송] </a></td>
</form>
</body>
 
</html>
 