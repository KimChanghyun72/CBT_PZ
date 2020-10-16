<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.pagination li {
		display : inline-block;
		border : 15px solid white;
	}
.pagination .active {
	border : 10px solid lightgray;
	background-color : lightgray;
}

table {
    width: 600px;
  }
  
#ques_ox1{
 margin: 0px; 
 position: absolute; 
 width: 55px; 
 height: 45px; 
 background-image: url(&quot;./img/re_o.gif&quot;);
}
</style>
<script>
function btnSelectSolve(solve_id) {
	if( confirm("응시문제를 확인 하시겠습니까?")) {
		location.href="${pageContext.request.contextPath}/my/myRetestSelect.do?solve_id="+solve_id;
	} else {
		alert("취소 되었습니다.");
	}  
}
		
function btnRetest(solve_id) {
	if( confirm("재응시 하시겠습니까?")) {
		location.href="${pageContext.request.contextPath}/my/myRetest.do?solve_id="+solve_id;
	} else {
		alert("취소 되었습니다.");
	}  
}		
function btnContinueTest(solve_id) {
	if( confirm("계속해서 문제를 응시 하시겠습니까?")) {
		location.href="${pageContext.request.contextPath}/study/problemView.do?solve_id="+solve_id;
	} else {
		alert("취소 되었습니다.");
	}  
}
</script>

</head> 
<body>

	<br><br>	
	<div class="container">
			<div class="table-responsive">
				<table border="1"  class="table table-hover" id="dev-table">
				<tr align="center" bgcolor="lightblue">
					<th width="20%">응시날짜</th>
					<th width="15%">응시소모시간</th>
					<th>응시유형</th>
					<th width="15%">채점결과</th>
					<th width="15%">문제확인</th>
					<th width="15%">재응시</th>
				</tr>
				<c:forEach items="${solvelist}" var="solvelist">
				<tr align="center">
					<td>${solvelist.solve_date}</td>
					
					
					<fmt:parseNumber var="percent" value="65.153454" integerOnly="true" />
					
					<td><fmt:formatNumber value="${solvelist.solve_time/60}" pattern="0"/>분 ${solvelist.solve_time%60}초</td>
					<td>${solvelist.solve_type_name}</td>
					<td>
						<c:if test="${solvelist.solve_submit=='Y'}">
						${solvelist.solve_score}/${solvelist.solve_cnt}
						</c:if>						
					</td>		
					<td>
						<c:if test="${solvelist.solve_submit=='Y'}">
						<button type="button" class="btn btn-outline-primary" onclick="btnSelectSolve('${solvelist.solve_id}')">문제  확인</button>
						</c:if>
						<c:if test="${solvelist.solve_submit=='N'}">
						<button type="button" class="btn btn-outline-danger" onclick="btnContinueTest('${solvelist.solve_id}')">이어서풀기</button>
						</c:if>
					</td>
					<td>
						<c:if test="${solvelist.solve_submit=='Y'}">
						<button type="button" class="btn btn-outline-primary" onclick="btnRetest('${solvelist.solve_id}')">재응시</button>
						</c:if>
					</td>
				</tr>
				</c:forEach>
				</table>
			</div>
		<!-- 페이징 처리 영역 -->	
   		<my:paging paging="${paging}" jsfunc="gopage"/>
	    	<script>
	    	function gopage(p){
	
	    		location.href="${pageContext.request.contextPath}/mypage/myRetestList.do?p="+ p;
	    	
	    	};
	    	</script>	
	</div>
</body>
</html>