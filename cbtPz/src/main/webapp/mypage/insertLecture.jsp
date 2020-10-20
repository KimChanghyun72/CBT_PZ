<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

p {
	padding: 10px 20px;
}

</style>
<script>
// 파일 업로드 이미지 미리보기
function setThumbnail(event) {
	var reader = new FileReader();
	
	reader.onload = function(event) {
		var img = document.createElement("img");
		img.setAttribute("src", event.target.result);
		document.querySelector("div#image_container").appendChild(img);
	};
	
	reader.readAsDataURL(event.target.files[0]);
}

$(function(){
	$('#lecture_info').on({
		keypress : function(){
				var t = event.target.value;
			  console.log(t.length);
			  if( t.length > 250){
				  event.preventDefault();
				  event.returnValue=false;
				  return false;
			}
		}
			
	});
	
	$('#lecbtn').on("click", function(){
		var cnt = 0;
		$('#lecfrm').find("input").each(function(){
			if($(this).val() == ""){
				cnt++;
			}
			console.log(cnt);
			
		});
		
		if(cnt==0){
			var r = confirm("등록하시겠습니까?");
			if (r == true) {
				$('#lecfrm').submit();
				alert("등록되었습니다");
			}
		} else {
			alert("모든 값을 입력하세요");
		}
		
	}); 
	
	
	
	
	
});

</script>

</head>
<body>
<%request.getSession().setAttribute("pageName","강의 등록"); %>
	<div class="container">
            <div class="row justify-content-center">
                <!-- Post A Comment -->
                <div class="col-12 col-lg-8">
                    <div class="post-a-comments mb-70">
						<br> <br>

                        <form action="${pageContext.request.contextPath}/mypage/insertLecture.do" method="post" enctype="multipart/form-data" id="lecfrm">
                            <div class="row">
                            
                            	<div class="col-12 col-lg-3">
                                    <div class="form-group" style="text-align: center;">
                                        <p >강의 제목</p>
                                    </div>
                                </div>
                                <div class="col-12 col-lg-7">
                                    <div class="form-group">
                                        <input type="text" class="form-control" name="lecture_name" placeholder="Lecture Name">
                                    </div>
                                </div>
                                
                            	
                            	<div class="col-12 col-lg-3">
                                    <div class="form-group" style="text-align: center;">
                                        <p >강의 url</p>
                                    </div>
                                </div>
                                <div class="col-12 col-lg-7">
                                    <div class="form-group">
                                        <input type="url" class="form-control" name="lecture_link" placeholder="Lecture Link">
                                    </div>
                                </div>
                                
                                 
                                 <div class="col-12 col-lg-3">
                                    <div class="form-group" style="text-align: center;">
                                        <p >강의 과목</p>
                                    </div>
                                </div>
                                <div class="col-12 col-lg-7">
                                <div class="form-group">
	                                <select id="lecture_subject" name="lecture_subject" class="form-control" style ="padding:10px; color:gray;">
											<option value="s1">1과목(소프트웨어 설계)</option>
											<option value="s2">2과목(소프트웨어 개발)</option>
											<option value="s3">3과목(데이터베이스 구축)</option>
											<option value="s4">4과목(프로그래밍 언어 활용)</option>
											<option value="s5">5과목(정보시스템 구축관리)</option>
									</select>
								</div>
								</div>
								
                                 
                                 <div class="col-12 col-lg-3">
                                    <div class="form-group" style="text-align: center;">
                                        <p >강의 썸네일</p>
                                    </div>
                                </div>
                                <div class="col-12 col-lg-6">
                                    <div class="form-group">
                                        <input type="file" id="lecture_image" name="lecture_image" accept="image/*" onchange="setThumbnail(event);">
                                        <div id="image_container"></div>
                                        
                                    </div>
                                </div>
                               
                                
                                <div class="col-12 col-lg-10">
                                    <div class="form-group" style="text-align: left;">
                                        <p >강의 설명 (max 250 characters)</p>
                                    </div>
                                </div>
                                
                                <div class="col-12">
                                    <div class="form-group">
                                        <textarea class="form-control" id="lecture_info" cols="30" rows="10" name="lecture_info"></textarea>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <span class="btn clever-btn w-100" id="lecbtn">강의 등록</span>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
		</div>

</body>
</html>