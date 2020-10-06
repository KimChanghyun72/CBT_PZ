<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	
	function inputCheck() {
		if (frm.member_id.value == "") {
			window.alert("id 입력");
			frm.member_id.focus();
			return;
		}
		if (frm.member_pw.value == "") {
			window.alert("pw 입력");
			frm.member_pw.focus();
			return false;
		}
		//if(frm.job.value == ""){
		if (frm.member_job.selectedIndex == 0) { //
			window.alert("job 선택");
			frm.member_job.focus();
			return false;
		}
		return true;
	};
	/**/
	
	
	
	//교사 업데이트
	//$(document).ready(function(){
		/* $('#confirm_password').focusout(function(){
			if($('#teacher_password').val() != $('#confirm_password').val()){
				$('#pw2_check').removeClass('hidden');
				$('#pw2_check').css('color', 'red');
				$('#confirm_password').val("");
			} else $('#pw2_check').addClass('hidden');
		}); */
	
	//});
	
	
	$(function(){
		
		//수정 상태 어럴트
		if("${errorcode}" > 0 && "${errorcode}" < 5 ){
			alert("${errormsg}");		
		}
		
		//수정버튼시 수정작동
		$('#tfrmsubmit').on("click", function(){
			$('#tfrm').submit();
		}); 
		
		
		//탈퇴
		$('#tdelete').on("click", function(){
			$('#tdfrm').submit();
		});
		
		
		//이미지 미리보기
		$("#filename").on('change', function(){
            readURL(this);
        });
		
		
	});
	
	
	//이미지 미리보기 func
	function readURL(input) {
        if (input.files && input.files[0]) {
           var reader = new FileReader();
           reader.onload = function (e) {
              $('#preImage').attr('src', e.target.result);
           }
           reader.readAsDataURL(input.files[0]);
        }
    }
	
</script>
</head>
<body>
	
	<h1 class="page_title">개인 정보 수정</h1>
	<c:if test="${sessionScope.check == 'M'}">
		<form method="post" name="frm" id="frm" action="<%=application.getContextPath()%>/memberUpdate.do"
			onsubmit="inputCheck()">
		<div class="regist">
			<div>
				<label for="member_id">ID</label> <input id="member_id"
					name="member_id" type="text" value="${login.member_id}"
					readonly="readonly">
			</div>
			<div>
				<label for="member_pw">Password</label> <input id="member_pw"
					name="member_pw" type="password" value="${login.member_pw}">
			</div>
			<div>
				<label for="member_name">이름</label> <input type="text"
					name="member_name" value="${login.member_name}">
			</div>
			<div>
				<label for="member_age">나이</label> <input type="text"
					name="member_age" value="${login.member_age }">
			</div>
			<div>
				<label for="member_job">직업</label> <input type="text"
					name="member_job" value="${login.member_job}">
					
					<select id="member_job" name="member_job" class="form-control" value="${login.member_job}">
								<option value="학생">학생</option>
								<option value="취준생">취준생</option>
								<option value="직장인">직장인</option>
					</select>
			</div>
			<div>
				<label for="study_term">공부기간</label> <input type="text"
					id="study_term" name="study_term" value="${login.study_term }">
			</div>
			<div>
				<label for="phone_number">전화번호</label> <input type="text"
					id="phone_number" name="phone_number"
					value="${login.phone_number }">
			</div>
			<div>
				<label for="is_major">전공 여부</label> <input type="checkbox"
					name="is_major" value="y">
				<!-- yes or no -->
			</div>
			<div>
				<label for="tested_num">시험 응시 횟수</label> <input type="text"
					id="tested_num" name="tested_num" value="${login.tested_num }">
			</div>
			<div>
				<label for="email">이메일</label> <input type="text"
					id="email" name="email" value="${login.email }">
			</div>
			<div>
				<button type="reset">초기화</button>
				<button>등록</button>
			</div>
		</div>
		</form>
		<form action="memberDelete.do" method="post">
			<input type="hidden" name="member_id" value="${login.member_id }" />
			<button>회원 탈퇴</button>
		</form>
	</c:if>
	
	
	
	<c:if test="${sessionScope.check == 'T'}">
		<div class="container">
		<div class="row justify-content-center">
                <!-- Post A Comment -->
                <div class="col-12 col-lg-8">
                    <div class="post-a-comments mb-70">

                        <form action="${pageContext.request.contextPath}/mypage/proUpdate.do" method="post" 
                        	name="tfrm" id="tfrm" enctype="multipart/form-data">
                            <div class="row">
                                <div class="col-12 col-lg-6">
                                    <div class="form-group" style="text-align: center;">
                                        <p>Id</p>
                                    </div>
                                </div>
                                <div class="col-12 col-lg-6">
                                    <div class="form-group">
										<input id="teacher_id" name="teacher_id" type="text" value="${teacher.teacher_id}" readonly="readonly">
									</div>
                                </div>
                                <div class="col-12 col-lg-6">
                                    <div class="form-group" style="text-align: center;">
                                        <p>Password</p>
                                    </div>
                                </div>
                                <div class="col-12 col-lg-6">
                                    <div class="form-group">
										<input id="teacher_password" name="teacher_password" type="password" value="${teacher.teacher_password}">
									</div>
                                </div>
                                <div class="col-12 col-lg-6">
                                    <div class="form-group" style="text-align: center;">
                                        <p>Name</p>
                                    </div>
                                </div>
                                <div class="col-12 col-lg-6">
                                    <div class="form-group">
										<input type="text" name="teacher_name" value="${teacher.teacher_name}" readonly="readonly">
									</div>
                                </div>
                                <div class="col-12 col-lg-6">
                                    <div class="form-group" style="text-align: center;">
                                        <p>Email</p>
                                    </div>
                                </div>
                                <div class="col-12 col-lg-6">
                                    <div class="form-group">
                                    	<input type="text" id="teacher_email" name="teacher_email" value="${teacher.teacher_email }">
									</div>
                                </div>
                                <div class="col-12 col-lg-6">
                                    <div class="form-group" style="text-align: center;">
                                        <p>Profile picture</p>
                                    </div>
                                </div>
                                <div class="col-12 col-lg-6">
                                    <div class="form-group">
                                    	 <img id="preImage"
                                    	 	src="${pageContext.request.contextPath}/nostms/profilepicSelect.do?teacher_picture=${teacher.teacher_picture }"
											data-title="${teacher.teacher_name }" >
									</div>
                                </div>
                                <div class="col-12 col-lg-6">
                                    <div class="form-group">
                                    	<input type="file" id="filename" name="teacher_picture">
									</div>
                                </div>
                                
                                <div class="col-12">
                                    <div class="form-group" >
                                        <p>이력</p>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <textarea name="teacher_record" class="form-control" id="teacher_record" cols="30" rows="10">${teacher.teacher_record }</textarea>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group" >
                                        <p>자격증</p>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <textarea name="teacher_certificate" class="form-control" id="teacher_certificate" cols="30" rows="10" >${teacher.teacher_certificate }</textarea>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <button class="btn clever-btn w-100" id="tfrmsubmit">수정</button>
                                </div>
							</div>
                        </form>
								<form action="${pageContext.request.contextPath}/mypage/proDelete.do" method="post"
									id="tdfrm">
									<!-- <input type="hidden" name="member_id" value="" /> -->
									<button id="tdelete" class="btn clever-btn">회원 탈퇴</button>
								</form>
                    </div>
                </div>
            </div>
         </div>
	</c:if>
	
	
</body>
</html>