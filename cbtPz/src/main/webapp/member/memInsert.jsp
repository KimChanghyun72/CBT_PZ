<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<title>/member/memInsert.jsp</title>



<script>
$(function(){
	if("${errorcode}"=="2"){
		alert("${errormsg}");
	}
})


$(document).ready(function(){
	$('#confirm_password').focusout(function(){
		if($('#member_pw').val() != $('#confirm_password').val()){
			$('#pw2_check').removeClass('hidden');
			$('#pw2_check').css('color', 'red');
			$('#confirm_password').val("");
		} else $('#pw2_check').addClass('hidden');
	});
	
	$('#member_id').on("focusout", function(){
		var memid = $('#member_id').val();
		$.ajax({
	        type:"POST",
	        url:"${pageContext.request.contextPath}/memIdCheck.do",
	        data : {id : memid},
	        dataType : "json",
	        success: function(data){
	            if(data != null){
	    			$('#id_check').css('color', 'red');
	    			$('#id_check').text('아이디 사용 불가');
	    		} 
	            else if(data == null && $('#member_id').val()==""){
	            	$('#id_check').css('color', 'red');
	        		$('#id_check').text('아이디를 입력하세요');
	            } else {
	            	$('#id_check').css('color', 'gray');
	    			$('#id_check').text('아이디 사용 가능');
	    		}
	        }
	    });
	
	});
	
	

	
	
	
	$('#frmsubmit').on("click", function(){
		var cnt = 0;
		$('#frm').find("input").each(function(){
			
			if($(this).val() == null){
				cnt++;
			}
		});
		
		if(cnt == 5) {
			$('#frm').submit();
		} else {
			alert("모든 값을 입력하세요");
		}
		
	});
	
	$('#member_age1').on({
		keyup : function(){
			var regexp = /^[0-9]*$/
			var v = $(this).val();
				if( !regexp.test(v) ) {
					alert("숫자만 입력하세요");
					$(this).val("");
				};
		},
		focusout: function(){
			var leng = $('#member_age1').val();
			if (leng.length != 4){
				alert("4자리를 입력하세요");
				$(this).val("");
			}
		}
	});
	
	$('#member_age3').on({
		keyup : function(){
			var regexp = /^[0-9]*$/
			var v = $(this).val();
				if( !regexp.test(v) ) {
					alert("숫자만 입력하세요");
					$(this).val("");
				};
		},
		focusout: function(){
			var leng = $('#member_age3').val();
			if (leng.length != 2){
				alert("2자리를 입력하세요");
				$(this).val("");
			}
		}
	});
	
	$('#member_pw').on("focusout", function(){
		var leng = $('#member_pw').val();
		if (leng.length > 16){
			alert("비밀번호 최대 16자리입니다");
			$(this).val("");
		}
	});
	
	
	$('#email').on("focusout", function(){
		var regex=/^[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[@]{1}[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[.]{1}[A-Za-z]{1,5}$/;
		var v = $(this).val();
		if( !regex.test(v) ) {
			alert("정확한 email을 입력하세요");
			$(this).val("");
		};
	});
	
	
});



</script>


</head>

<body>
	<div class="container">
		<div class="row">
			<form class="form-horizontal" name="frm" method="post" id="frm" 
					action="${pageContext.request.contextPath}/memInsert.do">
				<fieldset>
					<br>
					<h3>회원가입</h3>
					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="Name">ID</label>
						<div class="col-md-5">
							<input id="member_id" name="member_id" type="text" placeholder="username"
								class="form-control input-md" required="required">
							<span id="id_check" class="help-block"></span>
						</div>
					</div>

					<!-- Password input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="passwordinput">Password</label>
						<div class="col-md-5">
							<input id="member_pw" name="member_pw" type="password"
								placeholder="" class="form-control input-md" required="required">
							<span class="help-block">max 16 characters</span>
						</div>
					</div>

					<!-- Password input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="confirm_password">Confirm
							Password</label>
						<div class="col-md-5">
							<input id="confirm_password" name="confirm_password"
								type="password" placeholder="Re-type password"
								class="form-control input-md" required="required">
							<span id="pw2_check" class="hidden"> 비밀번호가 일치하지 않습니다.</span>
						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="Name">Name</label>
						<div class="col-md-5">
							<input id="member_name" name="member_name" type="text" placeholder="username"
								class="form-control input-md" required="required">
						</div>
					</div>

					
					<!-- age -->
					<div class="form-group">
						<label class="col-md-4 control-label" for="member_age">생년월일</label>
						<div class="col-md-5">
							<div class="form-row">
								<div class="col-md-4">
									<input type="text" class="form-control input-sm" placeholder="년(4자)" name="member_age1" id="member_age1">
								</div>
								<div class="col-md-4">
									<select id="member_age2" name="member_age2" class="form-control" >
										<option value="01">1월</option>
										<option value="02">2월</option>
										<option value="03">3월</option>
										<option value="04">4월</option>
										<option value="05">5월</option>
										<option value="06">6월</option>
										<option value="07">7월</option>
										<option value="08">8월</option>
										<option value="09">9월</option>
										<option value="10">10월</option>
										<option value="11">11월</option>
										<option value="12">12월</option>
									</select>
								</div>
								<div class="col-md-4">
									<input type="text" class="form-control input-sm" placeholder="일" name="member_age3" id="member_age3">
								</div>
							</div>
						</div>
					</div>



					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="mobilenumber">Phone Number</label>
						<div class="col-md-5">
							<input id="phone_number" name="phone_number" type="text"
								placeholder="Phone Number" class="form-control input-md"
								required="required">
						</div>
					</div>
					
					
					<!-- Email Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="emial">Email</label>
						<div class="col-md-5">
							<input id="email" name="email" type="text"
								placeholder="Email" class="form-control input-md"
								required="required">
						</div>
					</div>
					

					<!-- Select Basic job -->
					<div class="form-group">
						<label class="col-md-4 control-label" for="member_job">Job</label>
						<div class="col-md-5">
							<select id="member_job" name="member_job" class="form-control">
								<option value="학생">학생</option>
								<option value="취준생">취준생</option>
								<option value="직장인">직장인</option>
							</select>
						</div>
					</div>


					<!-- Multiple Radios (inline) --> 
					<div class="form-group">
						<label class="col-md-4 control-label" for="is_major">전공확인</label>
						<div class="col-md-5">
							<label class="radio-inline" for="is_major-0">
								<input type="radio" name="is_major" id="gender-0" value="Y" checked="checked"> 예
							</label> 
							<label class="radio-inline" for="is_major-1">
								<input type="radio" name="is_major" id="gender-1" value="N">아니오
							</label>
						</div>
					</div>


					<!-- Multiple Radios (inline) --> 
					<div class="form-group">
						<label class="col-md-4 control-label" for="study_term">공부기간</label>
						<div class="col-md-5">
							<label class="radio-inline" for="gender-0"> 
								<input type="radio" name="study_term" id="study_term-0" value="1일" checked="checked"> 1일-1개월
							</label> 
							<label class="radio-inline" for="gender-1">
								<input type="radio" name="study_term" id="study_term-1" value="2개월-6개월">2개월-6개월
							</label>
							<label class="radio-inline" for="gender-1">
								<input type="radio" name="study_term" id="study_term-2" value="6개월-1년">6개월-1년
							</label>
							<label class="radio-inline" for="gender-1">
								<input type="radio" name="study_term" id="study_term-3" value="1년이상">1년 이상
							</label>
						</div>
					</div>

					<!-- Multiple Radios (inline) --> 
					<div class="form-group">
						<label class="col-md-4 control-label" for="tested_num">시험횟수</label>
						<div class="col-md-5">
							<label class="radio-inline" for="gender-0"> 
								<input type="radio" name="tested_num" id="tested_num-0" value="0" checked="checked"> 0회
							</label> 
							<label class="radio-inline" for="gender-1">
								<input type="radio" name="tested_num" id="tested_num-1" value="1">1회
							</label>
							<label class="radio-inline" for="gender-1">
								<input type="radio" name="tested_num" id="tested_num-2" value="2">2회
							</label>
							<label class="radio-inline" for="gender-1">
								<input type="radio" name="tested_num" id="tested_num-3" value="3">3회 이상
							</label>
						</div>
					</div>


				</fieldset>
			</form>
				
				<fieldset>
					<!-- Button -->
					<div class="form-group">
						<label class="col-md-4 control-label" for="submit"></label>
						<div class="col-md-4">
							<button type="button" id="frmsubmit" class="btn btn-success">Submit</button>
							<a href="${pageContext.request.contextPath}/member/login.jsp"><input value="취소" class="btn"></a>
						</div>
					</div>

				</fieldset>
		</div>
	</div>
</body>
</html>