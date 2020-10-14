<%@page import="model.MemberDAO"%>
<%@page import="model.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	<%request.getSession().setAttribute("pageName", "회원 관리");%>
</script>
</head>
<body>
<h3>회원목록</h3>
<table style="width:50%" border="1" id="member">
 <thead>
  <tr bgcolor="skyblue">
    <th>id</th>
    <th>회원이름</th>
    <th></th>
  </tr>
 </thead>
 <tbody>
<c:forEach items="${list}" var="member">
  	<tr>
    	<td>${member.getMember_id()}</td>
    	<td>${member.getMember_name()}</td>
    	<%-- <td><button type="button" onclick="location.href='memberUpdateForm.do?member_id=${member.member_id}'">삭제</button></td>   --%>  
  	</tr>
</c:forEach>
   </tbody>
</table>
</body>
</html>