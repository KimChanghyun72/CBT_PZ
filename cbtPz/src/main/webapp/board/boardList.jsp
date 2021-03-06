<%@page import="model.TeacherVO"%>
<%@page import="model.BoardDAO"%>
<%@page import="model.BoardVO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>boardList.jsp</title>
<script>

	//관리자 접속시 체크 버튼 확인시 삭제 기능 
	function check() {
		if ($("input:checkbox[name='ck']:checked").length > 0) {
			location.href = "${pageContext.request.contextPath}/board/boardDelete.do?board_id="
					+ $("input:checkbox[id='ck']:checked").val();
		}
	}
	$(document).ready(function() {
		//체크박스 선택시 라디오박스 처럼 사용 하는 기능
		$('input[type="checkbox"][name="ck"]').click(function() {
			if ($(this).prop('checked')) {
				$('input[type="checkbox"][name="ck"]').prop('checked', false);
				$(this).prop('checked', true);
			}
		});
		
		//선택값 초기화
		$('#search').focus(function(){
			$('#search').val("")
		})
		
	});
	
	
</script>
</head>
<body>

	<article>
		<div class="container">
			<div class="table-responsive2">
				<br> <br>
				<table class="table table-striped table-sm">
					<colgroup>
						<col style="width: 1%;" />
						<col style="width: 10%;" />
						<col style="width: 30%;" />
						<col style="width: 15%;" />
						<col style="width: 10%;" />
						<col style="width: 10%;" />
						<col style="width: 3.8%;" />
					</colgroup>
					<thead>
						<tr align="center">
							<th></th>
							<th>NO</th>
							<th>제목</th>
							<th>작성자</th>
							<th>조회수</th>
							<th>작성일</th>
							<c:if test="${sessionScope.check=='A'}">
								<th>관리자</th>
							</c:if>
						</tr>
					</thead>
					<tbody id="tbody" align="center">					
					<!--데이터가 없을시 조회 될 페이지  -->
						<c:choose>
							<c:when test="${empty list}">
							<tr>
							<td colspan="10" style="background-color:#FFFF" align="center" ><a style="color:#d31900">"${param.search}"</a>에 대한 검색 결과가 없습니다.</td>	
							</tr>
							</c:when>
							<c:when test="${!empty list}">
					<!--데이터가 없을시 조회 될 페이지  -->
						
						
							<!-- 조회수 1위글  -->
							<td></td>
							<td><img src="../img/1등.png"></td>
							<td><a href="${pageContext.request.contextPath}/board/boardSelect.do?board_id=${best.board_id}"><strong>${best.board_title}</strong></a></td>
							<td><strong>${best.member_id}</strong></td>
							<td><strong style="color: Tomato;">${best.board_views}</strong></td>
							<td>${best.board_date}</td>
								<c:if test="${sessionScope.check=='A'}">
											<td><input id="ck" name="ck" type="checkbox" value="${best.board_id}"></td>
							    </c:if>
							<!-- 조회수 1위글  -->	
							
							<!-- 리스트 목록 -->		
								<c:forEach var="board" items="${list}">
									<tr>
										<td style="color: Tomato;"><c:if
												test="${board.isNew == '1' }">NEW</c:if></td>
										<td>${board.board_id}</td>
										<td align='left'><a href="${pageContext.request.contextPath}/board/boardSelect.do?board_id=${board.board_id}">
												${board.board_title}&nbsp;
										<c:if test="${board.board_file != null}">
										<img src="../img/사진.png">
										</c:if>
										</a><c:if test="${board.cnt != 0 }">
												<a style="color: Tomato;">[${board.cnt}]</a>
											</c:if></td>
										<td>${board.member_id}</td>
										<td>${board.board_views}</td>
										<td>${board.board_date}</td>
										<c:if test="${sessionScope.check=='A'}">
											<td><input id="ck" name="ck" type="checkbox"
												value="${board.board_id}"></td>
										</c:if>
									</tr>
								</c:forEach>
								<!-- 리스트 목록 -->
							</c:when>
						</c:choose>
					</tbody>
				</table>
					
				<!--세션에 접근에 따른 "글쓰기" "삭제" 버튼-->
				<div style="float: right;">
					<c:if test="${sessionScope.check=='M'||sessionScope.check=='T'}">
						<button class="btn btn-sm btn-primary"
							onclick="location.href='${pageContext.request.contextPath}/board/boardInsert.jsp'">글쓰기</button>
					</c:if>
					<c:if test="${sessionScope.check=='A'}">
						<button id="del" class="btn btn-sm btn-primary" onclick="check()">삭제</button>
					</c:if>
				</div>
				<!--세션에 접근에 따른 "글쓰기" "삭제" 버튼-->
				
				
				<!-- 페이징 버튼 -->
				<my:paging paging="${paging}" jsfunc="gopage" />
				<!-- 페이징 버튼 -->
				
				
				<!-- 검색 영역 -->
				<div class="w3-container" align="center">
					<form method="post" name='searchfrm'>
					<input type="hidden" name='p' value='1'>
						<table style="text-align: center; width: 600px; height: 100px;">
							<tr>
								<td><SELECT name="select" id="select" style="height: 30px; padding: 5px 10px; font-size: 12px;">
												<OPTION value="">선택</OPTION>
												<OPTION value="searchtitle">제목</OPTION>
												<OPTION value="searchposter">작성자</OPTION>
											</SELECT>
											<script>
											    $('#select').val('${param.select}')
											</script>
									<input name="search" id = "search" placeholder="검색어를 입력하세요"
									style="height: 30px; padding: 5px 10px; font-size: 12px; line-height: 1.5; "
									type="text" value='${param.search}' /> 
								<input class="btn btn-sm btn-primary" type="submit" value=" 검색 " />
								</td>
							</tr>
						</table>
					</form>
				</div>
				
				<!-- 검색 영역 -->

				<!-- 페이징 처리 기능 -->
				<script>
					function gopage(p) {
						searchfrm.p.value = p;
						searchfrm.submit();
					};
				</script>
				<!-- 페이징 처리 기능 -->
			</div>
		</div>
	</article>

</body>
</html>