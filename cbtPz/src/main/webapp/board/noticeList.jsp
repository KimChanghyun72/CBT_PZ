<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeList.jsp</title>
</head>
<body>
<article>
		<!-- 공지사항 목록  -->
		<div class="container">
			<div class="table-responsive">
				<br><br>
				<table class="table table-striped table-sm">
					
					<colgroup>
						<col style="width: 1%;" />
						<col style="width: 10%;" />
						<col style="width: 30%;" />
						<col style="width: 10%;" />
						<col style="width: 10%;" />
					</colgroup>
					<thead>
						<tr align="center">
							<th> </th>
							<th>NO</th>
							<th>글제목</th>
							<th>작성자</th>
							<th>작성일</th>
						</tr>				
					</thead>
					<tbody id="tbody" align="center">
						<c:choose>
							<c:when test="${empty list}">
								<tr>
									<td colspan="5" align="center">데이터가 없습니다.</td>
								</tr>
							</c:when>
							<c:when test="${!empty list}">
								<c:forEach var="notice" items="${list}">
										<tr>
										<td style="color:Tomato;">
											<c:if test="${notice.isNew == '1' }">NEW</c:if>
										</td>
										<td>${notice.board_id}</td>
									<td><a href="${pageContext.request.contextPath}/board/noticeSelect.do?board_id=${notice.board_id}"><img src="../img/사이렌.png">${notice.board_title}</a></td>
										<td>${notice.member_id}</td>
										<td>${notice.board_date}</td>
									  </tr>
									
								</c:forEach>
							</c:when>
						</c:choose>
					</tbody>
								
				</table>
				<c:if test="${sessionScope.check=='A'}">
				<div style=" float:right;">
				<button class="btn btn-sm btn-primary"
					onclick="location.href='${pageContext.request.contextPath}/board/noticeInsert.jsp'">글쓰기</button>
				</div>
				</c:if>
	<!-- 페이징 처리 영역 -->	
   <my:paging paging="${paging}" jsfunc="gopage"/>
    	<script>
    	function gopage(p){

    		location.href="${pageContext.request.contextPath}/board/noticeList.do?p="+ p;
    	
    	};
    	</script>	
	<!-- 페이징 처리 영역 -->
			</div>
		</div>
	</article>
</body>
</html>