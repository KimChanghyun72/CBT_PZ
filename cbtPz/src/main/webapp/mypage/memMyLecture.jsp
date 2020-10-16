<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="en">

<head>
<!--     <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"> -->
    <!-- The above 4 meta tags *Must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>Clever - Education &amp; Courses Template | Courses</title>

    <style>
	div.row2 {
		text-align: center;
	}
	
	h4{
		display : inline;
	}
	</style>
    
    
	<script>
	<% request.getSession().setAttribute("pageName", "나의 강의(학생)"); %>
	$(function(){

		$(".free").on("click", function(){
			var div = $(this).parent().parent().parent().parent();
			var learnCnt = $(".learnCnt").html();
			
			var cancelChk = confirm("수강을 취소하시겠습니까?");
			if(cancelChk){
				var lecture_id = $(this).prev().children().val();
				function lecDel(){
				$.ajax("${pageContext.request.contextPath}/ajax/deleteMemLearn.do",{
					dataType : "json",
					data : {lecture_id : lecture_id},
					success : function(data){
						alert("수강이 취소되었습니다.");
						div.remove();
						learnCnt--;
						$(".learnCnt").html(learnCnt);
					}
				
				});
				}
				
				lecDel();
			}
			
			
		});
	})
	</script>
</head>

<body>
<%request.getSession().setAttribute( "pageName","나의 강의"); %>
    <!-- Preloader -->
    <!-- <div id="preloader">
        <div class="spinner"></div>
    </div> -->

    <!-- ##### Header Area Start ##### -->
    <header class="header-area">

        <!-- Navbar Area -->
        
    </header>
    <!-- ##### Header Area End ##### -->

    
    <!-- ##### Breadcumb Area End ##### -->

    <!-- ##### Popular Course Area Start ##### -->
    <section class="popular-courses-area section-padding-100">
        <div class="container">
        
        <div class="row2">
        <h4>수강한 총 강의 수는 </h4><h4 class="learnCnt">${fn:length(st_lecture_list)}</h4> <h4>건 입니다.</h4>
        </div>
        <br> <br>
        
            <div class="row">
    <c:forEach items="${ st_lecture_list }" var="lecture">
                <!-- Single Popular Course -->
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="single-popular-course mb-100 wow fadeInUp" data-wow-delay="250ms">
                        <img src="${pageContext.request.contextPath}/lectureSelect.do?lecture_image=${lecture.lecture_image}"
                        	onerror="this.src='${pageContext.request.contextPath}/img/cottonbro.jpg'">
                        <!-- Course Content -->
                        <div class="course-content">
                            <h4></h4>
                            <div class="meta d-flex align-items-center">
                            <c:if test="${lecture.lecture_on == 'N'}">
                            	<p>|| 폐강 ||</p>
                            </c:if>
                                <a>멤버십 만료일 : ${sessionScope.login.pay_enddate}</a>
                                <span><i class="fa fa-circle" aria-hidden="true"></i></span>
                            </div>
                            <p>${lecture.lecture_info}</p>
                        </div>
                        <!-- Seat Rating Fee -->
                        <div class="seat-rating-fee d-flex justify-content-between">
                        	 <div class="seat-rating h-100 d-flex align-items-center">
                        		<div class="seat">
                                	<i class="fa fa-user" aria-hidden="true"></i> 수강인원 : ${lecture.cnts} 명
                            	</div>
                            </div>

                            <div class="course-fee h-100">
                            	<form id="lecDel">
                            		<input type="hidden" name="lecture_id" value="${lecture.lecture_id}" >
                                </form>
                                	<a class="free">수강취소</a> 
                            </div>
                        </div>
                    </div>
                </div>
        </c:forEach>
            </div>
        </div>
    </section>
    <!-- ##### Popular Course Area End ##### -->

    <!-- ##### Footer Area End ##### -->

    
</body>

</html>

<%-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* 수정중ㅠ */
/*
.grid-item {
	border: 1px outset black;
	background-color: white;
	text-align: center;
}
.grid-item { width: 200px; }
*/
.relocator {
	width: 1200px;
	margin-top: 10px;
	height: auto;
	display: inline-block;
}

.relocator ul {
	list-style: none;
	margin: 0px;
	padding: 0px;
	height: auto;
}

.relocator ul li {
	width: 300px;
	height: 200px;
	overflow: visible;
	position: relative;
	float: left;
	margin-left: 20px;
	margin-bottom: 15px;
	padding: 10px;
	background: #ffffff;
}
/*overflow: visible 글 내용이 완전히 보이게 그대로 출력 */
.relocator ul li a {
	width: 300px;
	height: 200px;
	overflow: hidden;
	display: block;
	position: relative;
}

.title_bg {
	background: rgba(255, 255, 255, .7);
	padding: 5px;
	width: 300px;
	height: 200px;
}

#highlighter {
	background: rgba(255, 255, 255, .7);
}

.title_txt {
	color: #ff6c00;
	text-decoration: none;
}

.hig_content {
	text-decoration: none;
	color: #ff6c00;
	overflow: hidden;
	padding: 5px;
}

a {
	text-decoration: none;
	color: #000;
}

</style>

<!-- jQuery Relocator.js Plugin Demo -->


<script>
	$(document).ready(function() {
		$('#relocator').relocate({
			title : true,
			highlight : true,
			direction : "bottom",
			speed : 250,
		});
	});
</script>

</head>

<body>
	<h3>수강한 강의</h3>
<!--

썸네일 이미지를 클릭했을 때 강의 상세 정보 띄움.

강의명, 강의 설명, 링크, 썸네일 이미지

컨테이너 박스에 이미지 비율 맞춤
강의 소개 컨테이너 화면 비율 맞춤
-->
	<!--<form action="lectureSearch.do" method="post"></form>  -->

	<form action="<%=application.getContextPath()%>/lectureSearch.do"
		method="post"></form>



	<div class="relocator" id="relocator">
		<ul>
			<c:forEach items="${ st_lecture_list }" var="lecture">
				<li><a href="${lecture.lecture_link }"> <img style="width: 300px; height: 200px;"
						src="${pageContext.request.contextPath}/lectureSelect.do?lecture_image=${lecture.lecture_image}"
						data-title="${lecture.lecture_name}" data-desc="${lecture.lecture_info}">
				</a></li>
			</c:forEach>
		</ul>
	</div>
	
	
</body>
</html> --%>