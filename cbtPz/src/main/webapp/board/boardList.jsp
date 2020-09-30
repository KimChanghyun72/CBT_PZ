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
		function check()	{
        	if($("input:checkbox[name='ck']:checked").length > 0) {	
         	location.href="${pageContext.request.contextPath}/board/boardDelete.do?board_id="+$("input:checkbox[id='ck']:checked").val();
             }        
		}      
</script>
</head>
<body>
	<article>
		<div class="container">
			<div class="table-responsive">
				<h2 align="right">자유게시판</h2>
				<table class="table table-striped table-sm">
					<colgroup>
						<col style="width: 10%;" />
						<col style="width: 30%;" />
						<col style="width: 15%;" />
						<col style="width: 10%;" />
						<col style="width: 10%;" />
						<col style="width: 10%;" />
					</colgroup>
					<thead>
						<tr align="center">
							<th>NO</th>
							<th>글제목</th>
							<th>작성자</th>
							<th>조회수</th>
							<th>작성일</th>
							<c:if test="${list[0].member_id!='s'}">									  
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
								<c:forEach var="board" items="${list}">
										<tr>
										<td>${board.board_id}</td>
									<td><a href="${pageContext.request.contextPath}/board/boardSelect.do?board_id=${board.board_id}">${board.board_title}</a></td>
										<td>${board.member_id}</td>
										<td>${board.board_views}</td>
										<td>${board.board_date}</td>
										<c:if test="${sessionScope.check!='A'}">			<!-- "${sessionScope.check=='A'} --> 						  
										<td><input id="ck" name="ck" type="checkbox" value="${board.board_id}"></td>
									  	</c:if>
									  </tr>
									
								</c:forEach>
							</c:when>
						</c:choose>
					</tbody>
								
				</table>
				<p align="right">
				<button class="btn btn-sm btn-primary"
					onclick="location.href='${pageContext.request.contextPath}/board/boardInsert.jsp'">글쓰기</button>
				<button id="del" class="btn btn-sm btn-primary" onclick="check()">삭제</button>
				</p>
	<!-- 페이징 처리 영역 -->	
   <my:paging paging="${paging}" jsfunc="gopage"/>
    	<script>
    	function gopage(p){

    		location.href="${pageContext.request.contextPath}/board/boardList.do?p="+ p;
    	
    	};
    	</script>	
	<!-- 페이징 처리 영역 -->
			</div>
		</div>
	</article>
</body>
</html>