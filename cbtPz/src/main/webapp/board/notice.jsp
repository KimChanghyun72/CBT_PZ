<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>notice.jsp</title>
<style>
.board_title {

	font-weight : 700;

	font-size : 22pt;

	margin : 10pt;

}

.board_info_box {

	color : #6B6B6B;

	margin : 10pt;

}

.board_member_id {

	font-size : 10pt;

	margin-right : 10pt;

}

.board_date {

	font-size : 10pt;

}

.board_content {

	color : #444343;

	font-size : 12pt;

	margin : 10pt;

}
</style>

</head>
<body>
<article>
		<!-- 공지사항 상세조회 페이지  -->
		<div class="container" role="main">

			<br><br>
			
			<div class="bg-white rounded shadow-sm">

				<div class="board_title"><c:out value="${board.board_title}"/></div>

				<div class="board_info_box">

					<span class="board_member_id">작성자: <c:out value="${board.member_id}"/>,</span><span class="board_date"><c:out value="${board.board_date}"/></span>

				</div>
				
				<div class="board_content">${board.board_contents}</div>
			<c:if test="${board.board_file != null}">
				<div class="board_file"><img src="${pageContext.request.contextPath}/filenameDownload.do?board_file=${board.board_file}" style="width:1000px"/></div>
			</c:if>
				</div>
			<div style="margin-top : 20px">
			 <p align="right">	
				<c:if test="${sessionScope.check=='A'}">
				<button type="button" onclick="location.href='${pageContext.request.contextPath}/board/noticeUpdateForm.do?board_id=${board.board_id}'" class="btn btn-sm btn-primary" id="btnUpdate">수정</button>
				<button type="button" onclick="location.href='${pageContext.request.contextPath}/board/noticeDelete.do?board_id=${board.board_id}'" class="btn btn-sm btn-primary" id="btnDelete">삭제</button>
				</c:if>
				<button type="button" onclick="location.href='${pageContext.request.contextPath}/board/noticeList.do'" class="btn btn-sm btn-primary" id="btnList">목록</button>
			</p>
			</div>


		</div>
	</article>
</body>
</html>