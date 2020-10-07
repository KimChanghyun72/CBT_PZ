<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qaboardList.jsp</title>
<script>
		//관리자 접속시 체크 버튼 확인시 삭제 기능 
	function check() {
		if ($("input:checkbox[name='ck']:checked").length > 0) {

			location.href = "${pageContext.request.contextPath}/board/qaboardDelete.do?qaboard_id="
					+ $("input:checkbox[id='ck']:checked").val();
		}
	}
</script>

</head>
<body>
	<!--Q&A 목록  -->
	<article>
		<div class="container">
			<div class="table-responsive">
				<br> <br>
				<table class="table table-striped table-sm">
					<colgroup>
						<col style="width: 1%;" />
						<col style="width: 10%;" />
						<col style="width: 30%;" />
						<col style="width: 15%;" />
						<col style="width: 10%;" />
						<col style="width: 11%;" />
						<col style="width: 15%;" />
					</colgroup>
					<thead>
						<tr align="center">
							<th> </th>
							<th>NO</th>
							<th>글제목</th>
							<th>작성자</th>
							<th>조회수</th>
							<th>작성일</th>
							<th>질문유형</th>
							<c:if test="${sessionScope.check=='A'}">
								<th>관리자</th>
							</c:if>
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
								<c:forEach var="qaboard" items="${list}">
									<tr>
										<c:if test="${qaboard.qaboard_views <= 2}">
										<td style="color:Tomato;">NEW</td>
										</c:if>
										<c:if test="${qaboard.qaboard_views > 2}">
										<td>  </td>
										</c:if>
										<td>${qaboard.qaboard_id}</td>
										<td><a href="${pageContext.request.contextPath}/board/qaboardSelect.do?qaboard_id=${qaboard.qaboard_id}">${qaboard.qaboard_title}</a></td>
										<td>${qaboard.member_id}</td>
										<td>${qaboard.qaboard_views}</td>
										<td>${qaboard.qaboard_date}</td>
										<td>${qaboard.qaboard_type_cd}</td>
										<c:if test="${sessionScope.check=='A'}">
											<td><input id="ck" name="ck" type="checkbox"
												value="${qaboard.qaboard_id}"></td>
										</c:if>
									</tr>
								</c:forEach>
							</c:when>
						</c:choose>
					</tbody>

				</table>
				<p align="right">
					<c:if test="${sessionScope.check=='M'}">
					<button class="btn btn-sm btn-primary"
						onclick="location.href='${pageContext.request.contextPath}/board/qaboardInsert.jsp'">글쓰기</button>
					</c:if>
					<c:if test="${sessionScope.check=='A'}">
						<button id="del" class="btn btn-sm btn-primary" onclick="check()">삭제</button>
					</c:if>
				</p>
				<!-- 페이징 처리 영역 -->
				<my:paging paging="${paging}" jsfunc="gopage" />
				<script>
					function gopage(p) {
						location.href = "${pageContext.request.contextPath}/board/qaboardList.do?p="
								+ p;
					};
				</script>
				<!-- 페이징 처리 영역 -->
			</div>
		</div>
	</article>
</body>
</html>