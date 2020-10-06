<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
	$(document).ready(function(){
		
		$('.single-catagories').on("click", function(){
			$('#frmdiv').hide();
			var cateval = $(this).find("h6").text();
			location.href="${pageContext.request.contextPath}/lecturePage.do?subject=" + cateval
		});
			
		
		$('.blog-content button').on("click", function(){
			var lecid = $(this).next().val();
			var mempay = "${sessionScope.login.is_pay}";
			console.log(lecid);
			console.log(mempay);
			if( mempay == "Y" ){
				$.ajax({
			        type:"POST",
			        url:"${pageContext.request.contextPath}/ajax/lectureLearnInsert.do",
			        data : {lectureid : lecid},
			        dataType : "json",
			        success: function(data){
			        	if(data == 1){
			    			alert("수강되었습니다.");
			    		}else if(data == 0){
			    			alert("이미 수강한 강의입니다.");
			    			$('#btn').onchange.val("수강중")
			    		}
			        }
			    });
				
			} else {
				alert("                      동영상강의는 유료회원 전용입니다. \n                            멤버쉽 가입을 해주세요!");
			}
		});
		
		
	});
</script>

</head>
<body>
	<section class="blog-area blog-page section-padding-100">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="blog-catagories mb-70 d-flex flex-wrap justify-content-between" >

                        <!-- Single Catagories -->
	                      <div class="single-catagories bg-img" style="background-color: blue;">
	                                <h6>전체</h6>
	                      </div>
 	                      <c:forEach items="${clist}" var="catelist">
	                        <div class="single-catagories bg-img" style="background-image: url(img/bg-img/bc2.jpg);">
	                                <h6>${catelist}</h6>
	                        </div>
	                      </c:forEach>

						
                       
                    </div>
                </div>
            </div>

            <div class="row"  id="frmdiv">
                <!-- Single Blog Area -->
                <c:forEach items="${lecturelist}" var="lecture_list">
                <div class="col-12 col-lg-6" >
                    <div class="single-blog-area mb-100 wow fadeInUp">
	                        <img 
	                        	src="lectureSelect.do?lecture_image=${lecture_list.lecture_image }"
								data-title="${lecture_list.lecture_name }" data-desc="${lecture_list.lecture_info}">
                        <!-- Blog Content -->
                        <div class="blog-content">
                        <c:if test="${sessionScope.login != null && sessionScope.login.is_pay == 'Y'}">
                            <a href="${lecture_list.lecture_link}" class="blog-headline" target="_blank">
                                <h4>${lecture_list.lecture_name}</h4>
                            </a>
                        </c:if>
                        <c:if test="${sessionScope.login == null || sessionScope.login.is_pay != 'Y'}">
                                <h4>${lecture_list.lecture_name}</h4>
                        </c:if>
                            <div class="meta d-flex align-items-center">
                                <span><i class="fa fa-circle" aria-hidden="true"></i></span>
                                <div>${lecture_list.teacher_name}</div>
                            </div>
                            <div class="meta d-flex align-items-center">
                            	<p>${lecture_list.lecture_info}</p>
                            </div>
<<<<<<< HEAD
                            <button type="button" class="btn btn-outline-success">내 강좌에 넣기</button>
=======
                           
                            <button type="button" id="btn" class="btn btn-outline-success">수강하기</button>
>>>>>>> branch 'master' of https://github.com/KimChanghyun72/CBT_PZ.git
                            <input type="hidden" value="${lecture_list.lecture_id}">
                            
                        </div>
                    </div>
                </div>
                </c:forEach>
        	</div>

		</div>
<!--             <div class="row">
                <div class="col-12">
                    <div class="load-more text-center mt-100 wow fadeInUp" data-wow-delay="1000ms">
                        <a href="#" class="btn clever-btn btn-2">Load More</a>
                    </div>
                </div>
            </div> -->
    </section>
    <!-- ##### Blog Area End ##### -->
</body>
</html>