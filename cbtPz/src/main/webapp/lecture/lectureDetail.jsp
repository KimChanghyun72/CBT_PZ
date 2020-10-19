<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.leftColumn{
	float : "left";
	width : 50%;
}
.rightColumn{
	float : "right";
	width : 40%;
}

.thumb img {
    border-radius: 20px;
    padding: 8px;
}

.thumb2 img {
    border-radius: 5px;
        max-width: 60px;
}

/* .single-instructor .instructor-thumb {
    height: 0px;
} */

.single-instructor {
    background-color: white;
}
</style>
<script>

	function inputCheck() {
		
		if (frm1.comment_poster.value == "") {
			window.alert("회원전용 입니다.");
			frm1.comment_poster.focus();
			return;
			
		}
		if (frm1.comment_contents.value == "") {
			window.alert("댓글을 입력하세요.");
			frm1.comment_contents.focus();
			return;
			
		}else {		
			$.ajax("${pageContext.request.contextPath}/ajax/lec_commentInsert.do", {
				dataType:"json",
				data : $("form").serialize(),
				success : function(data){
					$("#text").val("")
					var del = "";
					if(data.lec_comments_poster =="${sessionScope.login.member_id}"){
						del=$("<a style='color:#007bff;'>").html("삭제").addClass("btnDel")
					}
					$("<div>").append($("<b>").append(data.lec_comments_poster))
					.append($("<br>"))
					.append(data.lec_comments_contents)
					.data("lec_comments_id", data.lec_comments_id)
					.append("&emsp;")
					.append(del)
					.append($("<h6 class='border-bottom pb-2 mb-0'/>"))
					.appendTo($("#list"))
				}
			});
		}
	}

/*-----------------------댓글 리스트 출력 기능 --------------------- */
$(function(){
	function boardList(){
		$.ajax("${pageContext.request.contextPath}/ajax/lec_commentList.do",{
			dataType : "json",
			data:{lecture_id : "${lectureInfo.lecture_id}"},
			success : function(datas){
				for(i=0; i<datas.length; i++){
							var del = "";
							if(datas[i].lec_comments_poster =="${sessionScope.login.member_id}"){
								del=$("<a style='color:#007bff;'>").html("삭제").addClass("btnDel")
							}
					
					$("<div>").append($("<b>").append(datas[i].lec_comments_poster))
							.append($("<br>"))
							.append(datas[i].lec_comments_contents)
							.data("lec_comments_id", datas[i].lec_comments_id)
							.append("&emsp;")
							.append(del)
							.append($("<h6 class='border-bottom pb-2 mb-0'/>"))
							.appendTo($("#list"))
				}
			}
		
		})}

	boardList();// 댓글리스트 바로 실행
	
/*-----------------------댓글 삭제 버튼 기능 --------------------- */	
	$("#list").on("click",".btnDel", function(){
		
		lec_comments_id = $(this).parent().data("lec_comments_id");
		div = $(this).parent();
		$.ajax("${pageContext.request.contextPath}/ajax/lec_commentDelete.do", {
			method : "get",
			dataType : "json",
			data : {lec_comments_id : lec_comments_id},//"no="+no + "&name=" + name 
			success : function(data){
				alert("댓글이 삭제되었습니다.");
				div.remove();
			}
		});
	});
	
	$(".btnLearn").on("click", function(){
		if("${login.is_pay}"=="Y"){
			location.href="${lectureInfo.lecture_link}";			
		}else{
			alert("유료회원 전용 서비스입니다.");
		}
	});
	
});

</script>
</head>
<body>
<article>
	<div class="container" role="main">
	<!-- <div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top: 10px"> -->
	<div>
	<div>
	<div>
	
	<br><br>
	<div class="tab-pane fade" id="tab3" role="tabpanel" aria-labelledby="tab--3">
                                    <div class="clever-review">
		
                                        <!-- 강의정보      Ratings -->
                                        <div class="clever-ratings d-flex align-items-center mb-30">

                                            <div class="total-ratings text-center d-flex align-items-center justify-content-center">
                                                <div class="ratings-text">
                                                   <!--  <h2>4.5</h2>
														<div class="about-course mb-30"> -->
													<h3>강의 정보</h3>
													<div class="thumb">
                                                    	<img src="${pageContext.request.contextPath}/nostms/profilepicSelect.do?teacher_picture=${lectureInfo.lecture_image}" height="250px" alt="">
                                                    </div>
														<!-- </div> -->
											<!-- <div class="ratings--">
                                                        <i class="fa fa-star" aria-hidden="true"></i>
                                                        <i class="fa fa-star" aria-hidden="true"></i>
                                                        <i class="fa fa-star" aria-hidden="true"></i>
                                                        <i class="fa fa-star" aria-hidden="true"></i>
                                                        <i class="fa fa-star-half-o" aria-hidden="true"></i>
                                                    </div> -->
                                                    <!-- <span>Rated 5 out of 3 Ratings</span> -->
                                                </div>
                                            </div>

                                            <div class="rating-viewer">
                                                <!-- Rating -->
                                                <div class="single-rating mb-15 d-flex align-items-center">
                                            		<!-- <p>Sed elementum lacus a risus luctus suscipit. Aenean sollicitudin sapien neque, in fermentum lorem dignissim a. Nullam eu mattis quam. Donec porttitor nunc a diam molestie blandit. Maecenas quis ultrices</p> -->
                                                   	<h5>강의명 : ${lectureInfo.lecture_name}</h5>
                                                </div>
                                                <div class="single-rating mb-15 d-flex align-items-center">
															<div>과목 : ${lectureInfo.lecture_subject}</div>
												</div>
												<div class="single-rating mb-15 d-flex align-items-center">
															<div>강의 정보 : ${lectureInfo.lecture_info}</div>
												</div>
												<div class="single-rating mb-15 d-flex align-items-center">
															<c:choose>
																<c:when test="${login.is_pay=='Y'}">
																	<div>
																		강의 링크 : <a href="#" class="btnLearn">수강하러가기</a>
																	</div>
																</c:when>
																<c:otherwise>
																	<div>강의 링크 : 수강하러가기</div>
																</c:otherwise>
															</c:choose>
                                                 </div>
                                            </div>
                                        </div>


                                        <!-- 강사정보    Single Review -->
                                        <div class="single-review mb-30">
                                            <div class="d-flex justify-content-between mb-30">
                                                <!-- Review Admin -->
                                                <div class="review-admin d-flex">
	                                                    <div class="thumb2">
	                                                        <img src="${pageContext.request.contextPath}/nostms/profilepicSelect.do?teacher_picture=${teacherInfo.teacher_picture}" height="50px" alt="">
	                                                    </div>
	                                                    <div class="text">
	                                                        <h6>강사명 :${teacherInfo.teacher_name}</h6>
	                                                        <!-- <span>Sep 29, 2017 at 9:48 am</span> -->
	                                                    </div>
                                                </div>
                                            </div>
                                            <div> 약력 : ${teacherInfo.teacher_record}</div>
											<div> 자격증 : ${teacherInfo.teacher_certificate}</div>
											<div> 이메일  : ${teacherInfo.teacher_email}</div>
                                        </div>
                                    </div>
                                </div>
	
								<%-- <div class="single-review mb-30">
                                            <div class="d-flex justify-content-between mb-30">
                                                <!-- Review Admin -->
                                                <div class="review-admin d-flex">
                                                    <div class="thumb2">
                                                        <img src="${pageContext.request.contextPath}/nostms/profilepicSelect.do?teacher_picture=${teacherInfo.teacher_picture}" height="50px" alt="">
                                                    </div>
                                                    <div class="text">
                                                        <h6>Sarah Parker</h6>
                                                        <span>Sep 29, 2017 at 9:48 am</span>
                                                    </div>
                                                </div>
                                                <!-- Ratings -->
                                                <div class="ratings">
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                </div>
                                            </div>
                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce enim nulla, mollis eu metus in, sagittis.</p>
                                        </div> --%>
	
	
	
	
	
	
	
	
	
   <!-- ##### Courses Content Start ##### -->
    <div class="single-course-content section-padding-100">
        <div class="container">
            <div class="row">
                <div class="col-12 col-lg-12">
                    <div class="course--content">

                        <div class="clever-tabs-content">

                            <div class="tab-content" id="myTabContent">
                                <!-- Tab Text -->
                                <div class="tab-pane fade show active" id="tab1" role="tabpanel" aria-labelledby="tab--1">
                                    <div class="clever-description">

                                        <!-- About Course -->
                                        

                                        <!-- All Instructors -->
                                        <%-- <div class="all-instructors mb-30">
                                            <h3>강사 정보</h3>

                                            <div class="row">
                                                <!-- Single Instructor -->
                                                <div class="col-lg-6">
                                                    <div class="single-instructor d-flex align-items-center mb-30">
                                                        <div class="instructor-thumb">
                                                            <img src="${pageContext.request.contextPath}/nostms/profilepicSelect.do?teacher_picture=${teacherInfo.teacher_picture}" height="250px" alt="">
                                                        </div>
                                                        <div class="instructor-info">
                                                            <h5>강사명 :${teacherInfo.teacher_name} </h5>
                                                            <span>Teacher</span>
                                                        </div>
                                                        
                                                    </div>
                                                    <div> 약력 : ${teacherInfo.teacher_record}</div>
													<div> 자격증 : ${teacherInfo.teacher_certificate}</div>
													<div> 이메일  : ${teacherInfo.teacher_email}</div>
													<br><br>
                                                </div>

                                                <!-- Single Instructor -->
                                                <!-- <div class="col-lg-6">
                                                        <div class="instructor-thumb">
                                                            <img src="img/bg-img/t2.png" alt="">
                                                        </div>
                                                        <div class="instructor-info">
                                                            <h5>Sarah Parker</h5>
                                                            <span>Teacher</span>
                                                        </div>
                                                </div> -->

                                            </div>
                                        </div> --%>

                                        <!-- FAQ -->
                                        <div class="clever-faqs">
                                            <h4>FAQs</h4>
<!---------------------댓글 입력폼------------------------->
	<c:if test="${sessionScope.check=='M'}"> 
<div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top: 10px">
<form id="frm1" name="frm1" >
<div class="row">
<div class="col-sm-10">
<textarea class="form-control" rows="3" placeholder="댓글을 입력해 주세요" id = "text" name="comment_contents"></textarea>
</div>
<div class="col-sm-2">
	<input type="text" class="form-control" id="comment_poster" name="comment_poster" value="${sessionScope.login.member_id}" readonly="readonly"/>	
	<input type="hidden" name="lecture_id" value="${lectureInfo.lecture_id}"/>
	<button type="button" onclick="inputCheck()"  class="btn btn-sm btn-primary" name="btnSave" style="width: 100%; margin-top: 10px" id="btnSave">저장</button>
</div>
</div>
</form>
</div>
	</c:if>
		<c:if test="${sessionScope.check=='T'}"> 
<div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top: 10px">
<form id="frm1" name="frm1" >
<div class="row">
<div class="col-sm-10">
<textarea class="form-control" rows="3" placeholder="댓글을 입력해 주세요" id = "text" name="comment_contents"></textarea>
</div>
<div class="col-sm-2">
	<input type="text" class="form-control" id="comment_poster" name="comment_poster" value="${sessionScope.login.teacher_id}" readonly="readonly"/>	
	<input type="hidden" name="lecture_id" value="${lectureInfo.lecture_id}"/>
	<button type="button" onclick="inputCheck()"  class="btn btn-sm btn-primary" name="btnSave" style="width: 100%; margin-top: 10px" id="btnSave">저장</button>
</div>
</div>
</form>
</div>
	</c:if>
<!--------------------댓글 리스트------------------------>
	<div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top: 10px">			
	<h6 class="border-bottom pb-2 mb-0">Reply list</h6>
	<div id="list"></div>
	</div>
                                            

                                        </div>
                                    </div>
                                </div>

                                
                                <!-- Tab Text -->
                                

                            </div>
                        </div>
                    </div>
                </div>


                       
                    </div>
                </div>
            </div>
		<div class="lec_comments"></div>
		</div>
	</div>
	</div>
	
	
</div>
</article>			
	
</body>
</html>