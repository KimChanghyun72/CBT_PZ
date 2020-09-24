<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* test css */
.grid-item {
	border: 1px outset black;
	background-color: white;
	text-align: center;
}

.grid-item {
	width: 200px;
}
</style>
<script
	src="https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.min.js"></script>
</head>

<body>
	<h3>등록한 강의</h3>
	<!--
		강의 썸네일 이미지를 클릭했을 때 강의 상세 정보를 보게 되는 방식
		강의명-썸네일 이미지 하단
		썸네일 이미지 mouseover시 강의명, 강의 설명, 
		
		강의명, 강의 설명, 링크, 썸네일 이미지
	-->
	<!-- <form action="lectureSearch.do" method="post"></form>  -->

	<!-- <form action="<%=application.getContextPath()%>/lectureSearch.do"
		method="post"></form> -->

	<div class="grid">
		<c:forEach items="${ lecture_list }" var="lecture">
			<div class="grid-item">
				강의명 ${lecture.lecture_name }<br>
				<!--강의 소개--> ${lecture.lecture_info }<br>
				링크 <a href="${lecture.lecture_link }"></a><br>
				썸네일 이미지
				<div>
					<img src="lectureSelect.do?lecture_image=${lecture.lecture_image }">
				</div>
			</div>
		</c:forEach>
	</div>
	<script>
		$('.grid').masonry({
			// options
			itemSelector : '.grid-item',
			columnWidth : 200
		});
	</script>
</body>
</html>