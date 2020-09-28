<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *Must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title><decorator:title/></title>


	<!-- Bootstrap core CSS -->
	<!-- <link rel="stylesheet1" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"> -->
	<link href="${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	
	
  	<!-- Custom styles for this template -->
  	<link href="${pageContext.request.contextPath}/css/modern-business.css" rel="stylesheet">

    <!-- Favicon -->
    <link rel="icon" href="${pageContext.request.contextPath}/img/core-img/favicon.ico">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">    
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    
    <script src="${pageContext.request.contextPath}/js/jquery/jquery-2.2.4.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap/bootstrap.min.js"></script>

    
 <decorator:head/>   

    

</head>

<body>
    <!-- Preloader -->


    <!-- ##### Header Area Start ##### -->
    
    <header class="header-area">

        <!-- Top Header Area 
        <div class="top-header-area d-flex justify-content-between align-items-center">
        </div> -->

        <!-- Navbar Area -->
        <div class="clever-main-menu">
            <div class="classy-nav-container breakpoint-off">
                <!-- Menu -->
                <nav class="classy-navbar justify-content-between" id="cleverNav">

                    <!-- Logo -->
                    <a class="nav-brand" href="${pageContext.request.contextPath}/indexx.jsp"><img src="${pageContext.request.contextPath}/img/core-img/logo.png" alt=""></a>

                    <!-- Navbar Toggler -->
                    <div class="classy-navbar-toggler">
                        <span class="navbarToggler"><span></span><span></span><span></span></span>
                    </div>

                    <!-- Menu -->
                    <div class="classy-menu">

                        <!-- Close Button -->
                        <div class="classycloseIcon">
                            <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
                        </div>

                        <!-- Nav Start -->
                        <div class="classynav">
                            <ul>
                                <li><a href="${pageContext.request.contextPath}/indexx.jsp">Home</a></li>
                                <li><a href="index.jsp">공지사항</a></li>
                                <li><a href="#">학습하기</a>
                                    <ul class="dropdown">
                                        <li><a href="index.jsp">기출문제</a></li>
                                        <li><a href="courses.html">모의고사</a></li>
                                        <li><a href="single-course.html">과목별</a></li>
                                        <li><a href="instructors.html">태그별</a></li>
                                    </ul>
                                </li>
                                <li><a href="lecture/lecture.jsp">동영상강의</a></li>
                                <li><a href="board/boardList.do">게시판</a>
                                	<ul class="dropdown">
                                        <li><a href="index.jsp">기출문제</a></li>
                                        <li><a href="courses.html">모의고사</a></li>
                                        <li><a href="single-course.html">과목별</a></li>
                                        <li><a href="instructors.html">태그별</a></li>
                                    </ul>
                                </li>
                              <c:if test="${not empty sessionScope.check && sessionScope.check != 'A'}">
                                <li><a href="instructors.html" >마이페이지</a>
                                	<ul class="dropdown">
                                        <li><a href="${pageContext.request.contextPath}/memberUpdate.do">개인정보수정</a></li>
                                        <li><a href="courses.html">모의고사</a></li>
                                        <li><a href="single-course.html">과목별</a></li>
                                        <li><a href="instructors.html">태그별</a></li>
                                        <li><a href="${pageContext.request.contextPath}/myLecture.do">나의 강의</a></li>
                                        <li><a href="${pageContext.request.contextPath}/insertLecForm.do">강의 등록</a></li>
                                        <li><a href="courses.html">오답노트</a></li>
                                        <li><a href="single-course.html">개인성적</a></li>
                                        <li><a href="instructors.html">즐겨찾기문제</a></li>
                                    </ul>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/payment/payment.jsp">멤버쉽</a></li>
                              </c:if>
                              <c:if test="${not empty sessionScope.check && sessionScope.check == 'A'}">
                                <li><a href="instructors.html">관리자메뉴</a>
                                	<ul class="dropdown">
                                        <li><a href="index.jsp">기출문제</a></li>
                                        <li><a href="courses.html">모의고사</a></li>
                                        <li><a href="single-course.html">과목별</a></li>
                                        <li><a href="instructors.html">태그별</a></li>
                                    </ul>
                                </li>
                              </c:if>
                            </ul>


                            <!-- Register / Login -->
                            <div class="register-login-area">
                                <c:if test="${not empty sessionScope.name}">
                                	<c:if test="${sessionScope.login.is_pay == 'Y' }">
                                		<span class="badge badge-pill badge-warning">VIP</span>
                                	</c:if>
	                                ${sessionScope.name}님  
	                                <a href="${pageContext.request.contextPath}/logout.do" class="btn active">Logout</a>
                                </c:if>
	                            <c:if test="${ empty sessionScope.name}">   
	                                <a href="${pageContext.request.contextPath}/member/login.jsp" class="btn active">Login</a>
                                </c:if>
                            </div>

                        </div>
                        <!-- Nav End -->
                    </div>
                </nav>
            </div>
        </div>
    </header>
    <!-- ##### Header Area End ##### -->

<decorator:body/>


   
   
   
    <!-- ##### All Javascript Script ##### -->


    <!-- All Plugins js -->
    <script src="${pageContext.request.contextPath}/js/plugins/plugins.js"></script>
    <!-- Active js -->
    <script src="${pageContext.request.contextPath}/js/active.js"></script>    
</body>

</html>