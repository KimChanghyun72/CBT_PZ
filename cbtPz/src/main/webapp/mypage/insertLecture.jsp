<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>강의 등록</h1>
	
	<form action="${pageContext.request.contextPath}/mypage/insertLecture.do" method="post" enctype="multipart/form-data">
	
	강의명 : <input type="text" name="lecture_name"> <br>
	강의 설명 : <textarea id="lecture_info" name="lecture_info" rows="4" cols="50"></textarea> <br>
	링크 : <input type="url" name="lecture_link"> <br>
	썸네일 이미지: <input type="file" id="lecture_image" name="lecture_image"> <br>
	 
	<input type="submit" value="강의 등록">
	
	</form>
</body>
</html>