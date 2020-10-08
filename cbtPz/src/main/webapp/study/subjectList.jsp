<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<article>
	<div class="container" align="center">
		<table class="table-striped table-sm">
	<colgroup>
		<col style="width: 800px" /><!-- 80% -->
		<col style="width: 100px" />
	</colgroup>
		<tr>
		<th>문제 유형</th>
		<th>풀기</th>
		</tr>
	<c:forEach items="${headlist}" var="headlist">			
	<input type="hidden" ${headlist.paperhead_id} />
	<tr><td>${headlist.paper_type_cd} ${headlist.paper_round}</td>
	<td>
	<form action="problemHead.do">
	<button type="submit" name="paperhead_id" value="${headlist.paperhead_id}" class="btn btn-sm btn-primary">풀기</button>
	</form>
	</td>
	</tr>
	<br>
	</c:forEach>
	
	</table>
	</div>
	</article>
	
	
	
	
	<form action="problemSubject.do">	
	1과목<button type="submit" name="subject" value="1과목">풀기</button><br>
	2과목<button type="submit" name="subject" value="2과목">풀기</button><br>
	3과목<button type="submit" name="subject" value="3과목">풀기</button><br>
	4과목<button type="submit" name="subject" value="4과목">풀기</button><br>
	5과목<button type="submit" name="subject" value="5과목">풀기</button><br>
	</form>
	<br>
</body>
</html>