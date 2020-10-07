<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
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
		/* if (frm.member_job.selectedIndex == 0) { //
			window.alert("job 선택");
			frm.member_job.focus();
			return false;
		} */
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
		$("[name=is_major]").val(["${member.is_major}"]);
		$("[name=study_term]").val(["${member.study_term}"]);
		$("[name=tested_num]").val(["${member.tested_num}"]);
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
			<div class="container">
			<div class="row justify-content-center">
		<!-- Post A Comment -->
		<div class="col-12 col-lg-8">
			<div class="post-a-comments mb-70">
			
		<form method="post" name="frm" id="frm"
		action="<%=application.getContextPath()%>/memberUpdate.do"
			onsubmit="inputCheck()" enctype="multipart/form-data">
			<div class="row">
				<div class="col-12 col-lg-6">
					<div class="form-group" style="text-align: center;">
						<p>ID</p>
						</div>
					</div>
					<div class="col-12 col-lg-6">
						<div class="form-group">
						<input id="member_id" name="member_id"
						type="text" value="${member.member_id}" readonly="readonly">
			</div>
			</div>
			
			
			
			<div class="col-12 col-lg-6">
				<div class="form-group" style="text-align: center;">
					<p>Password</p>
				</div>
			</div>
			<div class="col-12 col-lg-6">
            	<div class="form-group">
					<input id="member_pw" name="member_pw"
					type="password" value="${member.member_pw}">
			</div>
			</div>
			
			
			<div class="col-12 col-lg-6">
				<div class="form-group" style="text-align: center;">
					<p>Name</p>
					</div>
				</div>
					<div class="col-12 col-lg-6">
                    	<div class="form-group">
					<input type="text" name="member_name" value="${member.member_name}">
				</div>
			</div>
			
			
			
			
		<div class="col-12 col-lg-6">
			<div class="form-group" style="text-align: center;">
				<p>Age</p>
		</div>
			</div>
			<div class="col-12 col-lg-6">
			<div class="form-group">
				<input type="text" name="member_age"
				value="${member.member_age }" readonly>
			</div>
			</div>
			
			
			

			
			
		<div class="col-12 col-lg-6">
		<div class="form-group" style="text-align: center;">
				<p>Phone number</p>
		</div>
		</div>
			<div class="col-12 col-lg-6">
			<div class="form-group">
				<input type="text" id="phone_number"
				name="phone_number" value="${member.phone_number}">
			</div>
			</div>
			
			
		<div class="col-12 col-lg-6">
		<div class="form-group" style="text-align: center;">
				<p>Email</p> 
			</div>
			</div>
		<div class="col-12 col-lg-6">
		<div class="form-group">
				<input type="text" id="email"
				name="email" value="${member.email }">
			</div>
			</div>
			
			
			
			
			
			
		<div class="col-12 col-lg-6">
		<div class="form-group" style="text-align: center;">
				<p>Job</p>
			</div>
			</div>
		<div class="col-12 col-lg-6">
        <div class="form-group">
        
				<select id="member_job" name="member_job" class="form-control">
						<option value="학생">학생</option>
						<option value="취준생">취준생</option>
						<option value="직장인">직장인</option>
				</select>
			</div>
			</div>
			
			
			
			
		<div class="col-12 col-lg-6">
		<div class="form-group" style="text-align: center;">
				<p>전공 여부</p>
		</div>
        </div>
	        <div class="col-12 col-lg-6">
	        <div class="form-group">
		        <div class="form-check form-check-inline">
				  <input class="form-check-input" type="radio" name="is_major" value="Y">
				  <label class="form-check-label" for="is_major">예</label>
				</div>
				<div class="form-check form-check-inline">
				  <input class="form-check-input" type="radio" name="is_major" value="N">
				  <label class="form-check-label" for="is_major">아니오</label>
				</div>
			</div>
			</div>	
			

			
			
			
			
		<div class="col-12 col-lg-6">
		<div class="form-group" style="text-align: center;">
				<p>공부기간</p>
		</div>
		</div>
		
			<div class="col-12 col-lg-6">
			<div class="form-group">
			
				<div class="form-check disabled">
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" id="study_term"
					name="study_term" value="1개월 미만" checked="checked">
					<label class="form-check-label">1개월 미만</label>
				</div>
				</div>
				
				<div class="form-check disabled">
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" id="study_term"
					name="study_term" value="1~3개월 미만">
					<label class="form-check-label">1~3개월 미만</label>
				</div>
				</div>
				
				<div class="form-check disabled">
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" id="study_term"
					name="study_term" value="3개월 이상">
					<label class="form-check-label">3개월 이상</label>
				</div>
				</div>
				
			</div>
			</div>
			

			
			
		<div class="col-12 col-lg-6">
		<div class="form-group" style="text-align: center;">
			<label class="col-md-4 control-label" for="tested_num">시험 응시 횟수</label>
			</div>
			</div>
		<div class="col-12 col-lg-6">
			<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" id="tested_num"
					name="tested_num" value="0" checked="checked"> 
					<label class="form-check-label">0회</label>
			</div>	
			
			<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" id="tested_num"
					name="tested_num" value="1"> 
					<label class="form-check-label">1회</label>
			</div>	
			
			<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" id="tested_num"
					name="tested_num" value="2"> 
					<label class="form-check-label">2회</label>
			</div>	
			
			<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" id="tested_num"
					name="tested_num" value="3"> 
					<label class="form-check-label">3회 이상</label>
			</div>
		</div>


			
			
		<div class="col-12">
        	<button class="btn clever-btn w-100" id="tfrmsubmit">수정</button>
       </div>
			</div>
			</form>
			

		<form action="memberDelete.do" method="post">
			<input type="hidden" name="member_id" value="${login.member_id }" />
			<button id="tdelete" class="btn clever-btn">회원 탈퇴</button>
		</form>
		</div>
		</div>
		</div>
		</div>
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