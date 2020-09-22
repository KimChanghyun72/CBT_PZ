<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>StudyPaper.jsp</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {
  box-sizing: border-box;
}

body {
  font-family: Arial;
  padding: 10px;
  background: #f1f1f1;
}

/* Header/Blog Title */
.header {
  padding: 30px;
  text-align: center;
  background: white;
}

.header h1 {
  font-size: 50px;
}

/* Style the top navigation bar */
.topnav {
  overflow: hidden;
  background-color: #333;
}

/* Style the topnav links */
.topnav a {
  float: left;
  display: block;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

/* Change color on hover */
.topnav a:hover {
  background-color: #ddd;
  color: black;
}

/* Create two unequal columns that floats next to each other */
/* Left column */
.leftcolumn {   
  float: left;
  width: 75%;
}

/* Right column */
.rightcolumn {
  float: left;
  width: 25%;
  background-color: #f1f1f1;
  padding-left: 20px;
}

/* Fake image */
.fakeimg {
  background-color: #aaa;
  width: 100%;
  padding: 20px;
}

/* Add a card effect for articles */
.card {
  background-color: white;
  padding: 20px;
  margin-top: 20px;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Footer */
.footer {
  padding: 20px;
  text-align: center;
  background: #ddd;
  margin-top: 20px;
}

/* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 800px) {
  .leftcolumn, .rightcolumn {   
    width: 100%;
    padding: 0;
  }
}

/* Responsive layout - when the screen is less than 400px wide, make the navigation links stack on top of each other instead of next to each other */
@media screen and (max-width: 400px) {
  .topnav a {
    float: none;
    width: 100%;
  }
}
</style>
</head>
<body>

<div class="header">
  <h1>Header</h1>
	<h2>${headproblem[0].paper_type_cd} ${sub[0].subject}	문제	</h2>
  	<h2>${headproblem[0].paper_round}	</h2>
</div>

<div class="row">
  <div class="leftcolumn">
    <div class="card">
		<c:forEach items="${headproblem}" var="headproblem">	
					
			문제:${headproblem.problem_text} <br>	
			${headproblem.ans_1}<br>
			${headproblem.ans_2}<br> 
			${headproblem.ans_3}<br> 
			${headproblem.ans_4}<br>
			정답:${headproblem.ans_correct}<br>        
			해설:${headproblem.haeseol}<br>
			<br><br>
		</c:forEach>
		<c:forEach items="${sub}" var="sub">	
					
			문제 : ${sub.problem_text} <br>	
			${sub.ans_1}<br>
			${sub.ans_2}<br>
			${sub.ans_3}<br>
			${sub.ans_4}<br>
			정답:${sub.ans_correct}<br>        
			해설:${sub.haeseol}<br>
			<br><br>
		</c:forEach>
		
    </div>
  </div>
  <div class="rightcolumn">
    <div class="card">
      <h3>정답확인</h3>
      <div class="fakeimg"><p>Image</p></div>
      <div class="fakeimg"><p>Image</p></div>
      <div class="fakeimg"><p>Image</p></div>
      <div class="fakeimg"><p>Image</p></div>      
    </div>
  </div>
</div>
</body>
</html>
