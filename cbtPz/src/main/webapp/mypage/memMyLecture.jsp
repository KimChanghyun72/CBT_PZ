<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* 수정중ㅠ */
/*
.grid-item {
	border: 1px outset black;
	background-color: white;
	text-align: center;
}
.grid-item { width: 200px; }
*/
.relocator {
	width: 1200px;
	margin-top: 10px;
	height: auto;
	display: inline-block;
}

.relocator ul {
	list-style: none;
	margin: 0px;
	padding: 0px;
	height: auto;
}

.relocator ul li {
	width: 300px;
	height: 200px;
	overflow: visible;
	position: relative;
	float: left;
	margin-left: 20px;
	margin-bottom: 15px;
	padding: 10px;
	background: #ffffff;
}
/*overflow: visible 글 내용이 완전히 보이게 그대로 출력 */
.relocator ul li a {
	width: 300px;
	height: 200px;
	overflow: hidden;
	display: block;
	position: relative;
}

.title_bg {
	background: rgba(255, 255, 255, .7);
	padding: 5px;
	width: 300px;
	height: 200px;
}

#highlighter {
	background: rgba(255, 255, 255, .7);
}

.title_txt {
	color: #ff6c00;
	text-decoration: none;
}

.hig_content {
	text-decoration: none;
	color: #ff6c00;
	overflow: hidden;
	padding: 5px;
}

a {
	text-decoration: none;
	color: #000;
}

</style>

<!-- jQuery Relocator.js Plugin Demo -->
<script type="text/javascript" src="js/jquery.relocator.1.0.0.js"></script>

<script>
	$(document).ready(function() {
		$('#relocator').relocate({
			title : true,
			highlight : true,
			direction : "bottom",
			speed : 250,
		});
	});
</script>

</head>

<body>
	<h3>수강한 강의</h3>
<!--

썸네일 이미지를 클릭했을 때 강의 상세 정보 띄움.

강의명, 강의 설명, 링크, 썸네일 이미지

컨테이너 박스에 이미지 비율 맞춤
강의 소개 컨테이너 화면 비율 맞춤
-->
	<!--<form action="lectureSearch.do" method="post"></form>  -->

	<form action="<%=application.getContextPath()%>/lectureSearch.do"
		method="post"></form>



	<div class="relocator" id="relocator">
		<ul>
			<c:forEach items="${ st_lecture_list }" var="lecture">
				<li><a href="${lecture.lecture_link }"> <img style="width: 300px; height: 200px;"
						src="lectureSelect.do?lecture_image=${lecture.lecture_image }"
						data-title="${lecture.lecture_name }" data-desc="${lecture.lecture_info }">
				</a></li>
			</c:forEach>
		</ul>
	</div>
</body>
</html>