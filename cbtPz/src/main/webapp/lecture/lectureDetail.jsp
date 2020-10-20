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
<% request.getSession().setAttribute("pageName", "동영상 강의 상세"); %>

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
			var newWindow = window.open("about:blank");
			newWindow.location.href="${lectureInfo.lecture_link}";			
		}else{
			alert("유료회원 전용 서비스입니다.");
		}
	});
	
});

</script>
</head>
<body>


<!-- ##### Courses Content Start ##### -->
    <div class="single-course-content section-padding-100">
        <div class="container">
            <div class="row">
                <div class="col-12 col-lg-8">
                    <div class="course--content">

                     <!--    <div class="clever-tabs-content">

                            <div class="tab-content" id="myTabContent"> -->

                                <!-- Tab Text -->
                                <div class="tab-pane fade" id="tab3" role="tabpanel" aria-labelledby="tab--3">
                                    <div class="clever-review">

                                        <!-- Ratings -->
                                        <div class="clever-ratings d-flex align-items-center mb-30">

                                            <div class="total-ratings text-center d-flex align-items-center justify-content-center">
                                                <div class="ratings-text">
                                                    <h3>강의정보</h3>
                                                    <div class="thumb">
                                                    	<img src="${pageContext.request.contextPath}/nostms/profilepicSelect.do?teacher_picture=${lectureInfo.lecture_image}" height="250px"
                                                    		onerror="this.src='${pageContext.request.contextPath}/img/basicimage.png'">
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="rating-viewer">
                                                <!-- Rating -->
                                                <div class="single-rating mb-15 d-flex align-items-center">
                                                   	<h5>강의명 : ${lectureInfo.lecture_name}</h5>
                                                </div>
                                                <div class="single-rating mb-15 d-flex align-items-center">
															<div>과목 : ${lectureInfo.lecture_subject}</div>
												</div>
												<div class="single-rating mb-15 d-flex align-items-center">
															<div>강의 정보 : </div>
												</div>
												<div class="single-rating mb-15 d-flex align-items-center">
															<div>${lectureInfo.lecture_info}</div>
												</div>
                                            </div>
                                        </div>


									<c:choose>
										<c:when test="${login.is_pay=='Y'}">
											<div>
												<!-- 강의 링크 : <a href="#" class="btnLearn">수강하러가기</a> -->
												<a href="#" class="btnLearn btn clever-btn mb-30 w-100">수강하러가기</a>
											</div>
										</c:when>
										<c:otherwise>
											<a href="#" class="btnLearn btn clever-btn mb-30 w-100">수강하러가기</a>
										</c:otherwise>
									</c:choose>
                                        
                                        
                                    </div>
                                </div>
                                
                        <!--     </div>
                        </div> -->
                    </div>
                </div>

                <div class="col-12 col-lg-4">
                    <div class="course-sidebar">
                        
                        <!-- Widget -->
                        <div class="sidebar-widget">
                            <h4>강사 정보</h4>

                            <!-- Single Courses -->
                            <div class="single--courses d-flex align-items-center">
                                <div class="thumb">
                                    <img src="${pageContext.request.contextPath}/nostms/profilepicSelect.do?teacher_picture=${teacherInfo.teacher_picture}" height="50px"
                                    	onerror="this.src='${pageContext.request.contextPath}/img/bg-img/t5.png'">
                                </div>
                                <div class="content">
                                    <h5>강사명 :${teacherInfo.teacher_name}</h5>
                                    <h6>${teacherInfo.teacher_email}</h6>
                                </div>
                            </div>

                            <!-- Single Courses -->
                            <div class="single--courses d-flex align-items-center">
                                <div class="content">
                                	<div> 약력 : ${teacherInfo.teacher_record}</div>
                                    <!-- <h5>Expository writing</h5>
                                    <h6>$45</h6> -->
                                </div>
                            </div>

                            <!-- Single Courses -->
                            <div class="single--courses d-flex align-items-center">
                                <div class="content">
                                    <div> 자격증 : ${teacherInfo.teacher_certificate}</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Courses Content End ##### -->




	
	
	
	
	
   <!-- ##### Courses Content Start ##### -->
    <div class="single-course-content section-padding-50">
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
		
	
</body>
</html>