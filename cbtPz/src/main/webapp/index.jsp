<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *Must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>Clever - Education &amp; Courses Template | Home</title>

    <!-- Favicon -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Stylesheet -->
    <link rel="stylesheet" href="style.css">

</head>

<body>
    <!-- Preloader -->
    <div id="preloader">
        <div class="spinner"></div>
    </div>

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
                    <a class="nav-brand" href="index.jsp"><img src="img/core-img/logo.png" alt=""></a>

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
                        	<!-- layout에서 복붙해온 태그 내용. -->
                        	<ul>
                        	<li><a href="${pageContext.request.contextPath}/indexx.jsp">Home</a></li>
                                <li><a href="${pageContext.request.contextPath}/board/noticeList.do">공지사항</a></li>
                                <li><a href="${pageContext.request.contextPath}/study/studymain.jsp">학습하기</a>
                                    <ul class="dropdown">
                                        <li><a href="${pageContext.request.contextPath}/haederSearch.do?paper_type_cd=기출">기출문제</a></li>
                                        <li><a href="${pageContext.request.contextPath}/haederSearch.do?paper_type_cd=모의">모의고사</a></li>
                                        <li><a href="${pageContext.request.contextPath}/subjectSearch.do">과목별</a></li>
                                        <li><a href="/cbtPz/hashtagPage.do">태그별</a></li>
                                    </ul>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/lecturePage.do">동영상강의</a></li>
                                <li><a href="${pageContext.request.contextPath}/board/boardList.do">게시판</a>
                                	<ul class="dropdown">
                                        <li><a href="${pageContext.request.contextPath}/board/boardList.do">자유게시판</a></li>
                                        <li><a href="${pageContext.request.contextPath}/board/qaboardList.do">Q&A</a></li>                                 
                                   </ul>
                                </li>
                              <c:if test="${not empty sessionScope.check && sessionScope.check != 'A'}">
                                <li><a href="instructors.html" >마이페이지</a>
                                	<ul class="dropdown">
                                        <li><a href="${pageContext.request.contextPath}/myInfo.do">개인정보수정</a></li>
                                        <c:if test="${not empty sessionScope.check && sessionScope.check == 'T'}">
                                        <li><a href="${pageContext.request.contextPath}/myLecture.do">나의 강의</a></li>
                                        </c:if>
                                        <c:if test="${not empty sessionScope.check && sessionScope.check == 'M'}">
                                        <li><a href="${pageContext.request.contextPath}/memLecture.do">나의 강의</a></li>
                                        </c:if>
                                        <c:if test="${not empty sessionScope.check && sessionScope.check == 'T'}">
                                        <li><a href="${pageContext.request.contextPath}/insertLecForm.do">강의 등록</a></li>
                                        </c:if>
                                        <li><a href="courses.html">오답노트</a></li>
                                        <li><a href="single-course.html">개인성적</a></li>
                                        <li><a href="instructors.html">즐겨찾기문제</a></li>
                                        <li><a href="${pageContext.request.contextPath}/myInput.do">작성글</a></li>
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
                        	
                        	<!-- 
                        	
                            <ul>
                                <li><a href="index.jsp">Home</a></li>
                                <li><a href="index.jsp">공지사항</a></li>
                                <li><a href="#">학습하기</a>
                                    <ul class="dropdown">
                                        <li><a href="index.jsp">Home</a></li>
                                        <li><a href="courses.html">Courses</a></li>
                                        <li><a href="single-course.html">Single Courses</a></li>
                                        <li><a href="instructors.html">Instructors</a></li>
                                        <li><a href="blog.html">Blog</a></li>
                                        <li><a href="blog-details.html">Single Blog</a></li>
                                        <li><a href="regular-page.html">Regular Page</a></li>
                                        <li><a href="contact.html">Contact</a></li>
                                    </ul>
                                </li>
                                <li><a href="courses.html">게시판</a></li>
                                <li><a href="instructors.html">Instructors</a></li>
                                <li><a href="blog.html">Blog</a></li>
                            </ul>
 -->
                            <!-- Search Button -->

                            <!-- Register / Login -->
                            <div class="register-login-area">
                                <a href="#" class="btn">Register</a>
                                <a href="index-login.html" class="btn active">Login</a>
                            </div>

                        </div>
                        <!-- Nav End -->
                    </div>
                </nav>
            </div>
        </div>
    </header>
    <!-- ##### Header Area End ##### -->

    <!-- ##### Hero Area Start ##### -->
    <section class="hero-area bg-img bg-overlay-2by5" style="background-image: url(img/bg-img/bg1.jpg);">
        <div class="container h-100">
            <div class="row h-100 align-items-center">
                <div class="col-12">
                    <!-- Hero Content -->
                    <div class="hero-content text-center">
                        <h2>Let's Study Together</h2>
                        <a href="#" class="btn clever-btn">Get Started</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ##### Hero Area End ##### -->

    <!-- ##### Cool Facts Area Start ##### -->
    <section class="cool-facts-area section-padding-100-0">
        <div class="container">
            <div class="row">
                <!-- Single Cool Facts Area -->
                <div class="col-12 col-sm-6 col-lg-3">
                    <div class="single-cool-facts-area text-center mb-100 wow fadeInUp" data-wow-delay="250ms">
                             <!-- Search Button -->
                            <div class="search-area">
                                <form action="#" method="post">
                                    <input type="search" name="search" id="search" placeholder="Search">
                                    <button type="submit"><i class="fa fa-search" aria-hidden="true"></i></button>
                                </form>
                            </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ##### Cool Facts Area End ##### -->

    <!-- ##### Footer Area Start ##### -->
    <footer class="footer-area">
 
    </footer>
    <!-- ##### Footer Area End ##### -->

    <!-- ##### All Javascript Script ##### -->
    <!-- jQuery-2.2.4 js -->
    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="js/bootstrap/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="js/bootstrap/bootstrap.min.js"></script>
    <!-- All Plugins js -->
    <script src="js/plugins/plugins.js"></script>
    <!-- Active js -->
    <script src="js/active.js"></script>
</body>

</html>
