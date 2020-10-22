<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.search-area input {
    width: 100%;
    border: 1px solid #ccc; 
    height: 40px;
    border-radius: 6px;
    border: 1px solid #ebebeb;
    padding: 0 15px 0 50px;
    font-size: 14px;
    color: rgba(0, 0, 0, 0.35);
    font-weight: 600;
    -webkit-transition-duration: 500ms;
    transition-duration: 500ms; 
}

.search-area button {
    position: absolute;
    width: 50px;
    height: 40px;
    background-color: transparent;
    top: 0;
    left: 0;
    z-index: 10;
    border: none;
    text-align: center;
    cursor: pointer;
    outline: none;
}

.mb-70 {
    margin-bottom: 30px !important;
}

.blog-content .badge {
	font-size: 20px;
	padding-top: .35em;
	margin-right: 10px;
}

.blog-c {
	padding-bottom: .25em;
}


/* [name=btnLink]{
	display:none;
} */
</style>


<script>
	$(document).ready(function(){
		
		$('.single-catagories').on("click", function(){
			$('#frmdiv').hide();
			var cateval = $(this).find("h6").text();
			location.href="${pageContext.request.contextPath}/lecturePage.do?subject=s" + cateval.substr(0,1)
			console.log(cateval.substr(0,1));
		});
			
		
		$('#searchbtn').on({
			click : function(){
				$('#frmdiv').hide();
				var searchval = $('#search').val();
				location.href="${pageContext.request.contextPath}/lectureSearch.do?search=" + searchval
		    }
	
		});
		
		$('#search').on({
	    keypress: function(key){
	    	console.log("hi")
		      if(key.keyCode==13){
	    	    $('#frmdiv').hide();
				var searchval = $('#search').val();
				location.href="${pageContext.request.contextPath}/lectureSearch.do?search=" + searchval
		      }
		    }
		});
		
		
		
		/* function tmemDelete() {
			var r = confirm("탈퇴하시겠습니까?");
			if (r == true) {
				tdfrm.submit()
			} else {
				// 취소
			}
		} */
		
		
		
		
		$('.blog-content button[name=btnLearn]').on("click", function(){
				var btn = $(this)
				var lecid = $(this).prev().prev().prev().val();
				var lecname = $(this).prev().prev().val();
				var lecon = $(this).prev().prev().prev().prev().val();
				
				var cnt = $(this).prev().prev().prev().children().eq(1).children(); //수강인원 카운트
				var mempay = "${sessionScope.login.is_pay}";
				var check = "${sessionScope.check}";
				//console.log(lecid);
				//console.log(mempay);
				//console.log(lecon);
				//if(check == "M"){
					if( mempay == "Y" ){
						
						if( lecon == "Y"){
							var r = confirm("선택하신 강의는 ' " + lecname + " ' 입니다  \n" + "해당 강의를 수강하시겠습니까?");
			    			if (r == true) {
								$.ajax({
							        type:"POST",
							        url:"${pageContext.request.contextPath}/ajax/lectureLearnInsert.do",
							        data : {lectureid : lecid},
							        dataType : "json",
							        success: function(data){
							        	if(data == 1){
							        		btn.text("수강중");
							        		var link = btn.prev().val();
							        		btn.parent().append('<a href='+link+' target="_blank"><button type="button" id="btn2" class="btn btn-outline-success" name=btnLink>강의 들으러 가기</button></a>');
							        		var cntUpd = cnt.html();
							        		cntUpd++;
							        		cnt.html(cntUpd);
							    			alert("수강되었습니다.");
							    			
							    		}else if(data == 0){
							    			alert("이미 등록된 강의입니다.");
							    		}
							        }
							    });
			    			}
						  }else if(lecon == "N"){
							  alert("폐강된 강의입니다.");
						  }
						} else {
							alert("                      동영상강의는 유료회원 전용입니다. \n                            멤버쉽 가입을 해주세요!");
						}
				//} 
				/* else if(check == "A" || check == "T") {
					alert("회원만 등록 가능합니다^^");
				} */
				
			
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

					<!-- Search Button -->
					<div class="search-area" style="margin-bottom: 50px;">
							<input type="search" name="search" id="search" placeholder="Search">
							<button type="button" id="searchbtn">
								<i class="fa fa-search" aria-hidden="true"></i>
							</button>
					</div>
					<div>${nodata}</div>


				</div>
            </div>

            <div class="row"  id="frmdiv">
                <!-- Single Blog Area -->
                <c:forEach items="${lecturelist}" var="lecture_list">
                <div class="col-12 col-lg-6" >
                    <div class="single-blog-area mb-100 wow fadeInUp">
	                        	<%-- <form id="frm" action="${pageContext.request.contextPath}/lecture/lectureDetailSelect.do">
	                        		<input type="text" name="lecture_id" value="${lecture_list.lecture_id}">
	                        	</form>
	                        		 <a href="${pageContext.request.contextPath}/lecture/lectureDetailSelect.do?lecture_id=${lecture_list.lecture_id}">
	                        		 	<img src="lectureSelect.do?lecture_image=${lecture_list.lecture_image }"
									data-title="${lecture_list.lecture_name }" data-desc="${lecture_list.lecture_info}">
								</a>
								 --%>
							<%-- <form id="frm" action="${pageContext.request.contextPath}/lecture/lectureDetailSelect.do">
	                        	<input type="text" name="lecture_id" value="${lecture_list.lecture_id}">
	                        	<input type="text" name="lecture_link" value="${lecture_list.lecture_link}">
	                        </form> --%>
							<a href="${pageContext.request.contextPath}/lecture/lectureDetailSelect.do?lecture_id=${lecture_list.lecture_id}">
	                        <img 
	                        	src="lectureSelect.do?lecture_image=${lecture_list.lecture_image }"
								data-title="${lecture_list.lecture_name }" data-desc="${lecture_list.lecture_info}"
								onerror="this.src='${pageContext.request.contextPath}/img/basicimage.png'">
							</a>
                
                		<!-- Blog Content -->
							<div class="blog-content">
								<div class="blog-c row">
									<c:if test="${lecture_list.lecture_on == 'N'}">
		                            	<span class="badge badge-danger">폐강</span>
		                            </c:if>
									<c:if
										test="${sessionScope.login != null && sessionScope.login.is_pay == 'Y' || sessionScope.check == 'A' || sessionScope.check == 'T'}">
										<a href="${lecture_list.lecture_link}" class="blog-headline"
											target="_blank">
											<h4>${lecture_list.lecture_name}</h4>
										</a>
									</c:if>
									<c:if
										test="${sessionScope.login == null || sessionScope.check == 'M' && sessionScope.login.is_pay != 'Y'}">
										<h4>${lecture_list.lecture_name}</h4>
									</c:if>
								</div>
								<div class="meta d-flex align-items-center">
									<span><i class="fa fa-circle" aria-hidden="true"></i></span>
									<div>담당 강사 : ${lecture_list.teacher_name}</div>
								</div>
								<div class="meta d-flex align-items-center">
									<span><i class="fa fa-circle" aria-hidden="true"></i></span>
									<div>현재 <a>${lecture_list.cnts}</a>명이 수강중.</div>
								</div>
								<div class="meta d-flex align-items-center">
									<p><a href="${pageContext.request.contextPath}/lecture/lectureDetailSelect.do?lecture_id=${lecture_list.lecture_id}"><button type="button" id="btn2" class="btn btn-info">강의 상세 정보</button></a></p>
								</div>

                           		<input type="hidden" name="lecture_on" value="${lecture_list.lecture_on}">
								<input type="hidden" value="${lecture_list.lecture_id}" name="lecid">
								<input type="hidden" value="${lecture_list.lecture_name}">
								
                           		<input type="hidden" name="lecture_link" value="${lecture_list.lecture_link}">
								<c:if test="${sessionScope.login == null || sessionScope.check == 'M'}">
									<button type="button" id="btn" class="btn btn-outline-success"  name="btnLearn">
										<c:if test="${lecture_list.lecture_yn == 1}">             
	                            						수강중
	                           			 </c:if>
										<c:if test="${lecture_list.lecture_yn == 0}">             
	                            						내 강좌에 등록
	                           			 </c:if>
									</button>
                           		</c:if>
                           		<c:if test="${lecture_list.lecture_yn == 1}">
                         				<a href="${lecture_list.lecture_link}" target="_blank"><button type="button" id="btn2" class="btn btn-outline-success" name="btnLink" >강의 들으러 가기</button></a>
                         		</c:if>
	
							</div>
						</div>
					</div>
				</c:forEach>
        	</div>

		</div>

    </section>
    <!-- ##### Blog Area End ##### -->
</body>
</html>