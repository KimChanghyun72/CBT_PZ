<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%request.getSession().setAttribute("pageName","강의 등록"); %>
	<div class="container">
            <div class="row justify-content-center">
                <!-- Post A Comment -->
                <div class="col-12 col-lg-8">
                    <div class="post-a-comments mb-70">
						<br> <br>

                        <form action="${pageContext.request.contextPath}/mypage/insertLecture.do" method="post" enctype="multipart/form-data">
                            <div class="row">
                                <div class="col-12 col-lg-7">
                                    <div class="form-group">
                                        <input type="text" class="form-control" name="lecture_name" placeholder="Lecture Name">
                                    </div>
                                </div>
                                <div class="col-12 col-lg-7">
                                    <div class="form-group">
                                        <input type="url" class="form-control" name="lecture_link" placeholder="Lecture Link">
                                    </div>
                                </div>
                                <div class="col-12 col-lg-6">
                                    <div class="form-group">
                                        <input type="file" id="lecture_image" name="lecture_image">
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <textarea class="form-control" id="lecture_info" cols="30" rows="10" name="lecture_info"></textarea>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <button class="btn clever-btn w-100">강의 등록</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
		</div>

</body>
</html>