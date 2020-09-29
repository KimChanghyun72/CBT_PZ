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
		
		$('#catediv').on("click", function(){
			$('#frmdiv').hide();
			var cateval = $('#catediv').val();
			console.log(cateval);
	 		$.ajax({
		        type:"POST",
		        url:"${pageContext.request.contextPath}/ajax/lectureCategorySelect.do",
		        data : {cate : cateval},
		        dataType : "json",
		        success: function(data){
		        	console.log(data);
		        	for(i=0; i<Object.keys(data).length; i++){
		        		$('#frmdivcate_link').attr("href", data.lecture_link).append("<h4>data.lecture_name</h4>");
		        		$('#frmdivcate_tname').text(data.teacher_name);
		        		$('#frmdivcate_info').text(data.lecture_info);
		        	}
		        	
		        	$('#frmdivcate').show();
		        }
		    });
		});
			
	});
</script>

</head>
<body>
	<section class="blog-area blog-page section-padding-100">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="blog-catagories mb-70 d-flex flex-wrap justify-content-between" id="divfrm">

                        <!-- Single Catagories -->
	                      <div class="single-catagories bg-img" style="background-color: blue;">
	                                <h6>전체</h6>
	                      </div>
	                      <c:forEach items="${clist}" var="catelist">
	                        <div class="single-catagories bg-img" style="background-image: url(img/bg-img/bc2.jpg);" id="catediv">
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
                    <div class="single-blog-area mb-100 wow fadeInUp" data-wow-delay="250ms">
                        <%-- <a href="${lecture_list.lecture_link}"><img src="../img/blog-img/1.jpg" ></a> --%>
                        <!-- Blog Content -->
                        <div class="blog-content">
                            <a href="${lecture_list.lecture_link}" class="blog-headline" target="_blank">
                                <h4>${lecture_list.lecture_name}</h4>
                            </a>
                            <div class="meta d-flex align-items-center">
                                <span><i class="fa fa-circle" aria-hidden="true"></i></span>
                                <div>${lecture_list.teacher_name}</div>
                            </div>
                            <p>${lecture_list.lecture_info}</p>
                        </div>
                    </div>
                </div>
                </c:forEach>
        	</div>

			<div class="row" id="frmdivcate" hidde="hidden">
				<!-- Single Blog Area -->
				
					<div class="col-12 col-lg-6">
						<div class="single-blog-area mb-100 wow fadeInUp"
							data-wow-delay="250ms">
							<%-- <a href="${lecture_list.lecture_link}"><img src="../img/blog-img/1.jpg" ></a> --%>
							<!-- Blog Content -->
							<div class="blog-content">
								<a href="" class="blog-headline" target="_blank" id="frmdivcate_link">
									<h4></h4>
								</a>
								<div class="meta d-flex align-items-center">
									<span><i class="fa fa-circle" aria-hidden="true"></i></span>
									<div id="frmdivcate_tname"></div>
								</div>
								<p id="frmdivcate_info"></p>
							</div>
						</div>
					</div>
			
			</div>

		</div>
            <div class="row">
                <div class="col-12">
                    <div class="load-more text-center mt-100 wow fadeInUp" data-wow-delay="1000ms">
                        <a href="#" class="btn clever-btn btn-2">Load More</a>
                    </div>
                </div>
            </div>
    </section>
    <!-- ##### Blog Area End ##### -->
</body>
</html>