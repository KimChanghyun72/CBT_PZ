<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section class="blog-area blog-page section-padding-100">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="blog-catagories mb-70 d-flex flex-wrap justify-content-between">

                        <!-- Single Catagories -->
                        <div class="single-catagories bg-img" style="background-image: url(img/bg-img/bc1.jpg);">
                            <a href="#">
                                <h6>Art &amp; Design</h6>
                            </a>
                        </div>

                        <!-- Single Catagories -->
                        <div class="single-catagories bg-img" style="background-image: url(img/bg-img/bc2.jpg);">
                            <a href="#">
                                <h6>Business</h6>
                            </a>
                        </div>

                        <!-- Single Catagories -->
                        <div class="single-catagories bg-img" style="background-image: url(img/bg-img/bc3.jpg);">
                            <a href="#">
                                <h6>IT &amp; Software</h6>
                            </a>
                        </div>

                        <!-- Single Catagories -->
                        <div class="single-catagories bg-img" style="background-image: url(img/bg-img/bc4.jpg);">
                            <a href="#">
                                <h6>Languages</h6>
                            </a>
                        </div>

                        <!-- Single Catagories -->
                        <div class="single-catagories bg-img" style="background-image: url(img/bg-img/bc5.jpg);">
                            <a href="#">
                                <h6>Programming Languages</h6>
                            </a>
                        </div>

                        <!-- Single Catagories -->
                        <div class="single-catagories bg-img" style="background-image: url(img/bg-img/bc6.jpg);">
                            <a href="#">
                                <h6>psychology</h6>
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <!-- Single Blog Area -->
                <c:forEach items="${lecturelist}" var="lecture_list">
                <div class="col-12 col-lg-6">
                    <div class="single-blog-area mb-100 wow fadeInUp" data-wow-delay="250ms">
                        <%-- <a href="${lecture_list.lecture_link}"><img src="../img/blog-img/1.jpg" ></a> --%>
                        <!-- Blog Content -->
                        <div class="blog-content">
                            <a href="#" class="blog-headline">
                                <h4>${lecture_list.lecture_name}</h4>
                            </a>
                            <div class="meta d-flex align-items-center">
                                <span><i class="fa fa-circle" aria-hidden="true"></i></span>
                                <a href="#">${lecture_list.teacher_id}</a>
                            </div>
                            <p>${lecture_list.lecture_info}</p>
                        </div>
                    </div>
                </div>
                </c:forEach>


            <div class="row">
                <div class="col-12">
                    <div class="load-more text-center mt-100 wow fadeInUp" data-wow-delay="1000ms">
                        <a href="#" class="btn clever-btn btn-2">Load More</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ##### Blog Area End ##### -->
</body>
</html>