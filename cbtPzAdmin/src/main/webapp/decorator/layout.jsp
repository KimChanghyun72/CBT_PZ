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
    <title>JJOKJEBI</title>


	<!-- Bootstrap core CSS -->
	<!-- <link rel="stylesheet1" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"> -->
	<link href="/cbtPz/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	
	
  	<!-- Custom styles for this template -->
  	<link href="/cbtPz/css/modern-business.css" rel="stylesheet">

    <!-- Favicon -->
	<link rel="shortcut icon" href="./images/JJlogoicon.ico">
	
	
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">    
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    
<!-- studyPaper datatable link -->
	<!-- <link rel="stylesheet" href="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.css"/> -->
	<link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.min.css">    
    
    <script src="/cbtPz/js/jquery/jquery-2.2.4.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<script type="text/javascript" src="/cbtPz/js/jquery.relocator.1.0.0.js"></script>
	
		<!-- studyPaper datatable link -->
    <script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
    <!-- bootstrap -->
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    
<decorator:head/>   

<style>
	.blank{
	height : 150px;

	//clear:both;
	
}
	
	ul {
        padding: 16px 0;
    }

    ul li {
        display: inline-block;
        margin: 0 5px;
        font-size: 14px;
        letter-spacing: -.5px;
    }
</style>
    

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
                    <a class="nav-brand" href="/cbtPz/indexx.jsp"><img src="./images/JJlogo.png" alt="" style="max-width: 35%;"></a>

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
                                <li><a href="/cbtPz/indexx.jsp">Home</a></li>
                                <li><a href="/cbtPz/board/noticeList.do">공지사항</a></li>
                                <li><a href="/cbtPz/study/studymain.jsp">학습하기</a>
                                    <ul class="dropdown">
                                        <li><a href="/cbtPz/study/haederSearch.do?paper_type_cd=a1">기출문제</a></li>
                                        <li><a href="/cbtPz/study/haederSearch.do?paper_type_cd=a2">모의고사</a></li>
                                        <li><a href="/cbtPz/study/subjectSearch.do">과목별</a></li>
                                        <li><a href="/cbtPz/study/hashtagPage.do">태그별</a></li>
                                    </ul>
                                </li>
                                <li><a href="/cbtPz/lecturePage.do">동영상강의</a></li>
                                <li><a href="/cbtPz/board/boardList.do">게시판</a>
                                	<ul class="dropdown">
                                        <li><a href="/cbtPz/board/boardList.do">자유게시판</a></li>
                                        <li><a href="/cbtPz/board/qaboardList.do">Q&A</a></li>                                 
                                   </ul>
                                </li>
                              <c:if test="${not empty sessionScope.check && sessionScope.check != 'A'}">
                                <li><a href="/cbtPz/mypage/myInfo.do" >마이페이지</a>
                                	<ul class="dropdown">
                                        	<li><a href="/cbtPz/mypage/myInfo.do">개인정보수정</a></li>
                                        <c:if test="${not empty sessionScope.check && sessionScope.check == 'T'}">
                                        	<li><a href="/cbtPz/mypage/myLecture.do">나의 강의</a></li>
                                        </c:if>
                                        <c:if test="${not empty sessionScope.check && sessionScope.check == 'M'}">
                                        	<li><a href="/cbtPz/mypage/memLecture.do">나의 강의</a></li>
                                        </c:if>
                                        <c:if test="${not empty sessionScope.check && sessionScope.check == 'T'}">
	                                        <li><a href="/cbtPz/mypage/insertLecForm.do">강의 등록</a></li>
	                                    </c:if>
                                        <c:if test="${not empty sessionScope.check && sessionScope.check == 'M'}">
	                                        <li><a href="/cbtPz/mypage/myRetestList.do">응시이력</a></li>
	                                        <li><a href="/cbtPz/mypage/myRetestStat.do">개인통계</a></li>
	                                        <li><a href="/cbtPz/mypage/myFavorite.do">즐겨찾기문제</a></li>
                                        </c:if>
                                        <c:if test="${not empty sessionScope.check && sessionScope.check == 'M'}">    
	                                        <li><a href="/cbtPz/mypage/myInput.do">나의 작성글</a></li>
                                        </c:if>
                                       	<c:if test="${not empty sessionScope.check && sessionScope.check == 'T'}">    
	                                        <li><a href="/cbtPz/mypage/myInput.do">나의 작성글</a></li>
                                        </c:if>

                                    </ul>
                                </li>
                              </c:if>
					          <c:if test="${not empty sessionScope.check && sessionScope.check == 'M'}">
                                <li><a href="/cbtPz/pay/payment.jsp">멤버쉽</a></li>
                              </c:if>  
                              <%-- <c:if test="${not empty sessionScope.check && sessionScope.check == 'A'}"> --%>
                                <li><a href="/cbtPz/admin/memberList.do">관리자메뉴</a>
                                 	<ul class="dropdown">
                                        <li><a href="/insa/insertProForm">개별문제</a></li>
                                        <li><a href="/cbtPz/admin/headInsert.jsp">회차문제</a></li>
                                        <li><a href="/cbtPz/admin/adminChart.jsp">회원통계</a></li>
                                        <li><a href="/cbtPz/admin/memberList.do">회원관리</a></li>
                                        <li><a href="/cbtPz/admin/scheduler.jsp">일정관리</a></li>
                                    </ul>
                                </li>
                             
                            </ul>


                            <!-- Register / Login -->
                            <div class="register-login-area">
                            	<c:if test="${ not empty sessionScope.name}">
	                               	 ${name}님  
	                                <a href="/cbtPz/logout.do" class="btn active">Logout</a>
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

<div class = "blank">
   </div>

		<div class="top-footer-area">
			<div class="container">
				<div class="row">
					<div class="col-12">
						<!-- Footer Logo -->
						<div class="footer-logo">
							<a class="nav-brand"
								href="${pageContext.request.contextPath}/indexx.jsp"><img
								src="./images/JJlogo_w.png"
								alt="" style="max-width: 12%;"></a>
						</div>
						<!-- Copywrite -->
						<p>
							<a href="#"> <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
								Copyright &copy;2020 yedam vocational training institute | This
								template is made with <i class="fa fa-heart-o"
								aria-hidden="true"></i> by <a href="https://colorlib.com"
								target="_blank">Colorlib</a> <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						</p>
					</div>
				</div>
			</div>
		</div>



   
   

    <!-- ##### All Javascript Script ##### -->

    <!-- All Plugins js -->
    <script src="/cbtPz/js/plugins/plugins.js"></script>
    <!-- Active js -->
    <script src="/cbtPz/js/active.js"></script>    
</body>

</html>