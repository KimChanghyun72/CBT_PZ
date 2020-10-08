<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">		
<title>Insert title here</title>
</head>
<% request.getSession().setAttribute("pageName", "학습하기-메인"); %>
<body>
 <section class="contact-area">
        <div class="container">
            <div class="row">
                <!-- Contact Info -->
                <div class="col-12 col-lg-6">
                    <div class="contact--info mt-50 mb-100">
                        <h4>Contact Info</h4>
                        <ul class="contact-list">
                            <li>
                                <h6><i class="fa fa-clock-o" aria-hidden="true"></i> Business Hours</h6>
                                <h6>9:00 AM - 18:00 PM</h6>
                            </li>
                            <li>
                                <h6><i class="fa fa-phone" aria-hidden="true"></i> Number</h6>
                                <h6>+44 300 303 0266</h6>
                            </li>
                            <li>
                                <h6><i class="fa fa-envelope" aria-hidden="true"></i> Email</h6>
                                <h6>info@clever.com</h6>
                            </li>
                            <li>
                                <h6><i class="fa fa-map-pin" aria-hidden="true"></i> Address</h6>
                                <h6>10 Suffolk st Soho, London, UK</h6>
                            </li>
                        </ul>
                    </div>
                </div>
     		 </div>
        </div>
    </section>
  
<form action = "${pageContext.request.contextPath}/haederSearch.do">
		<div><button name="paper_type_cd" value="모의">모의고사</button></div>
		<div><button name="paper_type_cd" value="기출">기출문제</button></div>
</form>
		<div><a href="/cbtPz/hashtagPage.do"><button name="paper_type_cd" value="태그">태그별</button></a></div>
<form action ="${pageContext.request.contextPath}/subjectSearch.do"> 		
		<div><button name="subject" value="subject">과목별</button></div>
</form>		
</body>
</html>