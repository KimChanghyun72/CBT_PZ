<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

	#tdelete, #tdelete1 {
		display : block;
		margin : 0 auto;
		width : 160px;
	}




	/* .more {
		display:block;
		width:55 px;
		height: 16 px;
		background-image: url('/cbtPz/img/up-chevron.png');
	}

	.blind {

		overflow: hidden;


		width: 20px;
		height: 10px;
	}
	*/
	.more:hover, .close:hober {
		cursor:pointer;
	}
	/*
	.close {
		display:block;
		width: 42px;
		height: 16px;
		background-image:url('/cbtPz/img/down-chevron.png');
		background-position: -166px -78px;
	}
	*/
	.chevron {
		display: none;
	} */
	
</style>

<script>
<% request.getSession().setAttribute("pageName", "개인 정보 수정"); %>
	
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
	
	
	
	
	$(function(){
		$("[name=is_major]").val(["${member.is_major}"]);
		$("[name=member_job]").val(["${member.member_job}"]);
		$("[name=study_term]").val(["${member.study_term}"]);
		$("[name=tested_num]").val(["${member.tested_num}"]);
		//수정 상태 어럴트
		if("${errorcode}" > 0 && "${errorcode}" < 5 ){
			alert("${errormsg}");		
		}
		
		//수정버튼시 수정작동
		$('#tfrmsubmit').on("click", function(){
			var cnt = 0;
			$('#tfrm').find("input").each(function(){
				if($(this).val() == ""){
					cnt++;
				}
				console.log(cnt);
			});
			
			if($('#new_tpassword').val() == ""){
				if(cnt > 3 ){
					alert("모든 값을 입력하세요");
				} else {
					$('#tfrm').submit();
				}
			} else {
				if(cnt >= 2 ){
					alert("모든 값을 입력하세요");
				} else {
					$('#tfrm').submit();
				}
			}
		}); 
		
		
		
		//패스워드 재설정 버튼
		$('#newPwbtn').on("click", function(){
			$('#newPw_div').css("display", "block");
		}); 
		
		
		//뉴패스워드 길이체크
		$('#new_tpassword').on("focusout", function(){
			var leng = $('#new_tpassword').val();
			if (leng.length > 16){
				alert("비밀번호 최대 16자리입니다");
				$(this).val("");
			}
		});
		
		
		//뉴패스워드 확인 체크
		$('#confirm_password').on("focusout", function(){
			if($('#new_tpassword').val() != $('#confirm_password').val()){
				$('#pw2_check').css('color', 'red');
				$('#pw2_check').text('다시 확인해주세요');
				$('#pw2_check').show();
				$('#confirm_password').val("");
			} else $('#pw2_check').hide();
		});
		
		
		
		
		//이력
		$('#teacher_record').on({
			keypress : function(){
	 			var t = event.target.value;
				  console.log(t.length);
				  if( t.length > 1000){
					  event.preventDefault();
					  event.returnValue=false;
					  return false;
				}
			}
				
		});
				
				
		//자격증		
		$('#teacher_certificate').on("keypress", function(){
			var t = event.target.value;
			  console.log(t.length);
			  if( t.length > 400){
				  event.preventDefault();
				  event.returnValue=false;
				  return false;
			}
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
	
	
	//강사회원탈퇴 확인 메시지 창
	function tmemDelete() {
		var r = confirm("탈퇴하시겠습니까?");
		if (r == true) {
			tdfrm.submit()
		} else {
			// 취소
		}
	}
	
	
	//회원탈퇴 확인 메시지 창
	function memDelete() {
		var r = confirm("탈퇴하시겠습니까?");
		if (r == true) {
			memDeleteFrm.submit()
		} else {
			// 취소
		}
	}

	//회원탈퇴 메뉴 접기, 펼치기
	$(document).ready(function(){
		$('.more').click(function(){
			$('.chevron').toggle(400);
		
			if(   $('#open').attr("src") =='/cbtPz/img/up-chevron.png')
				$('#open').attr("src", "/cbtPz/img/down-chevron.png")
			else 
				$('#open').attr("src", "/cbtPz/img/up-chevron.png")
			
/* 			if($('.more').hasClass('more')){
				$('.more').addClass('close').removeClass('more');
				
				$('.chevron').css('display', 'block');
				} else if($('.close').hasClass('close')){
					$('.close').addClass('more').removeClass('close');
					
					$('.chevron').;
				} */
		});
	});
	
</script>
<style>
@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200;300;400;500;600;700;900&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');



#member_job
{
padding: 10px;
}

#MemberDeletefont p
{

}

#MemberDeleteFont2 span
{

}
</style>
</head>
<body>

<br><br>

	<c:if test="${sessionScope.check == 'M'}">
			<div class="container">
			<div class="row justify-content-center">
		<!-- Post A Comment -->
		<div class="col-12 col-lg-8">
			<div class="post-a-comments mb-70">
			
		<form method="post" name="frm" id="frm"
		action="<%=application.getContextPath()%>/mypage/memberUpdate.do"
			onsubmit="inputCheck()" enctype="multipart/form-data">
			<div class="row">
				<div class="col-12 col-lg-5">
					<div class="form-group" style="text-align: center;">
						<p>Id</p>
						</div>
					</div>
					<div class="col-12 col-lg-7">
						<div class="form-group">
						<input id="member_id" name="member_id"
						type="text" value="${member.member_id}" readonly="readonly" class="form-control">
			</div>
			</div>
			
			
			
			<div class="col-12 col-lg-5">
				<div class="form-group" style="text-align: center;">
					<p>Password</p>
				</div>
			</div>
			<div class="col-12 col-lg-7">
            	<div class="form-group">
					<input id="member_pw" name="member_pw"
					type="password" value="${member.member_pw}" readonly="readonly" class="form-control">
					<span id="newPwbtn" class="btn clever-btn btn-2">비밀번호 재설정</span>
			</div>
			</div>
			                  <!-- 비밀번호 재설정 -->
                              <div id="newPw_div" style="display: none;" class="col-12">
                              <div class="row">
                                <div class="col-12 col-lg-5">
                                    <div class="form-group" style="text-align: center;">
                                        <p>New Password (max 16)</p>
                                    </div>
                                </div>
                                <div class="col-12 col-lg-7">
                                    <div class="form-group">
										<input id="new_tpassword" name="new_password" type="password" class="form-control">
									</div>
                                </div>
                                <div class="col-12 col-lg-5">
                                    <div class="form-group" style="text-align: center;">
                                        <p>Confirm Password</p>
                                    </div>
                                </div>
                                <div class="col-12 col-lg-7">
                                    <div class="form-group">
										<input id="confirm_password" name="confirm_password" type="password" class="form-control">
										<span id="pw2_check"></span>
									</div>
                                </div>
                              </div>
                              </div>
                              <!-- 비밀번호 재설정 끝 -->
			
			
			
			
			
			<div class="col-12 col-lg-5">
				<div class="form-group" style="text-align: center;">
					<p>Name</p>
					</div>
				</div>
					<div class="col-12 col-lg-7">
                    	<div class="form-group">
					<input type="text" name="member_name" value="${member.member_name}" readonly="readonly" class="form-control">
				</div>
			</div>
			
			
			
			
		<div class="col-12 col-lg-5">
			<div class="form-group" style="text-align: center;">
				<p>Age</p>
		</div>
			</div>
			<div class="col-12 col-lg-7">
			<div class="form-group">
				<input type="text" name="member_age"
				value="${member.member_age }" readonly="readonly" class="form-control">
			</div>
			</div>
			
			
			

			
			
		<div class="col-12 col-lg-5">
		<div class="form-group" style="text-align: center;">
				<p>Phone number</p>
		</div>
		</div>
			<div class="col-12 col-lg-7">
			<div class="form-group">
				<input type="text" id="phone_number"
				name="phone_number" value="${member.phone_number}" class="form-control">
			</div>
			</div>
			
			
		<div class="col-12 col-lg-5">
		<div class="form-group" style="text-align: center;">
				<p>Email</p> 
			</div>
			</div>
		<div class="col-12 col-lg-7">
		<div class="form-group">
				<input type="text" id="email"
				name="email" value="${member.email }" class="form-control">
			</div>
			</div>
			
			
			
			
			
			
		<div class="col-12 col-lg-5">
		<div class="form-group" style="text-align: center;">
				<p>Job</p>
			</div>
			</div>
		<div class="col-12 col-lg-7">
        <div class="form-group">
        
				<select id="member_job" name="member_job" class="form-control" style ="padding:10px">
						<option value="학생" <c:if test="${login.member_job=='학생'}"> selected="selected"</c:if>>학생</option>
						<option value="취준생"<c:if test="${login.member_job=='취준생'}"> selected="selected"</c:if>>취준생</option>
						<option value="직장인"<c:if test="${login.member_job=='직장인'}"> selected="selected"</c:if>>직장인</option>
				</select>
			</div>
			</div>
			
			
			
			
		<div class="col-12 col-lg-5">
		<div class="form-group" style="text-align: center;">
				<p>전공 여부</p>
		</div>
        </div>
	        <div class="col-12 col-lg-7">
	        <div class="form-group">
		        <div class="form-check form-check-inline">
				  <input class="form-check-input" type="radio" name="is_major" value="Y"
				  <c:if test="${login.is_major=='Y'}"> checked="checked"</c:if>>
				  <label class="form-check-label" for="is_major">예</label>
				</div>
				<div class="form-check form-check-inline">
				  <input class="form-check-input" type="radio" name="is_major" value="N"
				  <c:if test="${login.is_major=='N'}"> checked="checked"</c:if>>
				  <label class="form-check-label" for="is_major">아니오</label>
				</div>
			</div>
			</div>	
			

			
			
			
			
		<div class="col-12 col-lg-5">
		<div class="form-group" style="text-align: center;">
				<p>공부기간</p>
		</div>
		</div>
		
			<div class="col-12 col-lg-7">
			<div class="form-group">
			
				<div class="form-check disabled">
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" id="study_term"
					name="study_term" value="1개월 미만"
					<c:if test="${login.study_term=='1개월 미만'}"> checked="checked"</c:if>>
					<label class="form-check-label">1개월 미만</label>
				</div>
				</div>
				
				<div class="form-check disabled">
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" id="study_term"
					name="study_term" value="1~3개월 미만"
					<c:if test="${login.study_term=='1~3개월 미만'}"> checked="checked"</c:if>>
					<label class="form-check-label">1~3개월 미만</label>
				</div>
				</div>
				
				<div class="form-check disabled">
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" id="study_term"
					name="study_term" value="3개월 이상"
					<c:if test="${login.study_term=='3개월 이상'}"> checked="checked"</c:if>>
					<label class="form-check-label">3개월 이상</label>
				</div>
				</div>
				
			</div>
			</div>
			

			
			
		<div class="col-12 col-lg-5">
		<div class="form-group" style="text-align: center;">
			<label class="col-md-5 control-label" for="tested_num">시험 응시 횟수</label>
			</div>
			</div>
		<div class="col-12 col-lg-7">
			<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" id="tested_num"
					name="tested_num" value="0"
					<c:if test="${login.tested_num=='0'}"> checked="checked"</c:if>> 
					<label class="form-check-label">0회</label>
			</div>	
			
			<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" id="tested_num"
					name="tested_num" value="1"
					<c:if test="${login.tested_num=='1'}"> checked="checked"</c:if>> 

					<label class="form-check-label">1회</label>
			</div>	
			
			<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" id="tested_num"
					name="tested_num" value="2"
					<c:if test="${login.tested_num=='2'}"> checked="checked"</c:if>> 

					<label class="form-check-label">2회</label>
			</div>	
			
			<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" id="tested_num"
					name="tested_num" value="3"
					<c:if test="${login.tested_num=='3'}"> checked="checked"</c:if>> 
 					<label class="form-check-label">3회 이상</label>
			</div>
		</div>
		<!-- tested_num, data type = number. value 값 숫자 -->
		<!-- name이 칼럼명과 같아야 함 -->

			
			
		<div class="col-12">
        	<button class="btn clever-btn w-100" id="tfrmsubmit">수정</button>
       </div>
			</div>
			</form>
			
	
		<div class="btnArea" >
		
			

			<form name="memDeleteFrm" action="memberDelete.do" method="post">
			
			
			<span class="more" id="MemberDeleteFont2">
				<span class="blind" style="font-size: 20px; font-weight: bold;">회원 탈퇴</span><span><img id="open" src="/cbtPz/img/up-chevron.png" width="14" height="14" style="float: right;"></span>
			</span>
			
			<div class="chevron" id="MemberDeletefont">
			<br>
			<p><b>회원 탈퇴 유의사항</b></p>
			<p>1. 회원 탈퇴 시 회원님의 개인 정보와 문제 이용 내역이 파기됩니다.</p>
			<p>2. 회원이 작성한 콘텐츠(동영상, 게시물, 댓글 등)는 자동적으로 삭제되지 않으며,
			만일 삭제를 원하시면 탈퇴 이전에 삭제가 필요합니다.</p>
			<p>3. 탈퇴 후 동일한 메일로 재가입이 가능하지만, 탈퇴 한 계정과 연동되지 않습니다.</p>
			<p>4. 환불 신청을 하지 않거나 환불이 처리되기 전에 탈퇴하면 환불이 불가능합니다.</p>
			<br>
			<p>회원 탈퇴 시 해당 내용에 동의하는 것으로 간주됩니다.</p>
			
				<input type="hidden" name="member_id" value="${login.member_id }" />
				<button id="tdelete" type="button" class="btn clever-btn" onclick="memDelete()">회원 탈퇴</button>
			
			</div>
			
			</form>
		</div>
		</div>
		</div>
		</div>
		</div>

	</c:if>
	
	
	
	
<!-- =============================== 교사 개인정보 수정  ========================================= -->	
	
	
	
	<c:if test="${sessionScope.check == 'T'}">
		<div class="container">
		<div class="row justify-content-center">
                <!-- Post A Comment -->
                <div class="col-12 col-lg-8">
                    <div class="post-a-comments mb-70">

                        <form action="${pageContext.request.contextPath}/mypage/proUpdate.do" method="post" 
                        	name="tfrm" id="tfrm" enctype="multipart/form-data">
                            <div class="row">
                                <div class="col-12 col-lg-5">
                                    <div class="form-group" style="text-align: center;">
                                        <p>Id</p>
                                    </div>
                                </div>
                                <div class="col-12 col-lg-7">
                                    <div class="form-group">
										<input id="teacher_id" name="teacher_id" type="text" value="${teacher.teacher_id}" readonly="readonly" class="form-control">
									</div>
                                </div>
                                <div class="col-12 col-lg-5">
                                    <div class="form-group" style="text-align: center;">
                                        <p>Password</p>
                                    </div>
                                </div>
                                <div class="col-12 col-lg-7">
                                    <div class="form-group">
										<input id="teacher_password" name="teacher_password" type="password" value="${teacher.teacher_password}" readonly="readonly" class="form-control">
										<span id="newPwbtn" class="btn clever-btn btn-2">비밀번호 재설정</span>
									</div>
                                </div>
                                <!-- 비밀번호 재설정 -->
                              <div id="newPw_div" style="display: none;" class="col-12">
                              <div class="row">
                                <div class="col-12 col-lg-5">
                                    <div class="form-group" style="text-align: center;">
                                        <p>New Password (max 16)</p>
                                    </div>
                                </div>
                                <div class="col-12 col-lg-7">
                                    <div class="form-group">
										<input id="new_tpassword" name="new_password" type="password" class="form-control">
									</div>
                                </div>
                                <div class="col-12 col-lg-5">
                                    <div class="form-group" style="text-align: center;">
                                        <p>Confirm Password</p>
                                    </div>
                                </div>
                                <div class="col-12 col-lg-7">
                                    <div class="form-group">
										<input id="confirm_password" name="confirm_password" type="password" class="form-control">
										<span id="pw2_check"></span>
									</div>
                                </div>
                              </div>
                              </div>
                              <!-- 비밀번호 재설정 끝 -->
                                
                                <div class="col-12 col-lg-5">
                                    <div class="form-group" style="text-align: center;">
                                        <p>Name</p>
                                    </div>
                                </div>
                                <div class="col-12 col-lg-7">
                                    <div class="form-group">
										<input type="text" name="teacher_name" value="${teacher.teacher_name}" readonly="readonly" class="form-control">
									</div>
                                </div>
                                <div class="col-12 col-lg-5">
                                    <div class="form-group" style="text-align: center;">
                                        <p>Email</p>
                                    </div>
                                </div>
                                <div class="col-12 col-lg-7">
                                    <div class="form-group">
                                    	<input type="text" id="teacher_email" name="teacher_email" value="${teacher.teacher_email }" readonly="readonly" class="form-control">
                                    	<!-- <span id="em_check"></span> -->
									</div>
                                </div>
                                <div class="col-12 col-lg-5">
                                    <div class="form-group" style="text-align: center;">
                                        <p>Profile picture</p>
                                    </div>
                                </div>
                                <div class="col-12 col-lg-7">
                                    <div class="form-group">
                                    	 <img id="preImage"
                                    	 	src="${pageContext.request.contextPath}/nostms/profilepicSelect.do?teacher_picture=${teacher.teacher_picture }"
											data-title="${teacher.teacher_name }" >
									</div>
                                </div>
                                <div class="col-12 col-lg-5">
                                    <div class="form-group">
                                        <p> </p>
                                    </div>
                                </div>
                                <div class="col-12 col-lg-7">
                                    <div class="form-group">
                                    	<input type="file" id="filename" name="teacher_picture">
									</div>
                                </div>
                                
                                <div class="col-12">
                                    <div class="form-group" >
                                        <p>이력 (max 1000 characters)</p>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <textarea name="teacher_record" class="form-control" id="teacher_record" cols="30" rows="10">${teacher.teacher_record }</textarea>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group" >
                                        <p>보유자격증 (max 400 characters)</p>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <textarea name="teacher_certificate" class="form-control" id="teacher_certificate" cols="30" rows="10" >${teacher.teacher_certificate }</textarea>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <span class="btn clever-btn w-100" id="tfrmsubmit">수정</span>
                                </div>
							</div>
                        </form>
                        	<div class="btnArea">



							<form action="${pageContext.request.contextPath}/mypage/proDelete.do" method="post"
									name="tdfrm">


								<span class="more"> <span class="blind"
									style="font-size: 20px; font-weight: bold;">회원 탈퇴</span><span><img
										id="open" src="/cbtPz/img/up-chevron.png" width="14"
										height="14" style="float: right;"></span>
								</span>

								<div class="chevron">
									<br>
									<p>
										<b>회원 탈퇴 유의사항</b>
									</p>
									<p>1. 회원 탈퇴 시 회원님의 개인 정보와 등록 강의 내역이 파기됩니다.</p>
									<p>2. 회원이 작성한 콘텐츠(게시물, 댓글 등)는 자동적으로 삭제되지 않으며, 만일 삭제를
										원하시면 탈퇴 이전에 삭제가 필요합니다.</p>
									<p>3. 탈퇴 후 동일한 메일로 재가입이 가능하지만, 탈퇴 한 계정과 연동되지 않습니다.</p>
									
									<br>
									<p>회원 탈퇴 시 해당 내용에 동의하는 것으로 간주됩니다.</p>

									<input type="hidden" name="member_id" />
									<button id="tdelete1" type="button" class="btn clever-btn" onclick="tmemDelete()">회원 탈퇴</button>

								</div>

							</form>



							<%-- <form
								action="${pageContext.request.contextPath}/mypage/proDelete.do"
								method="post" id="tdfrm">
								<!-- <input type="hidden" name="member_id" value="" /> -->
								<button id="tdelete" class="btn clever-btn">회원 탈퇴</button>
							</form> --%>
						</div>
                    </div>
                </div>
            </div>
         </div>
	</c:if>
	
	
</body>
</html>