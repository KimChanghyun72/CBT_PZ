<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>

<title>/member/profInsert.jsp</title>

<script>
$(function(){
	if("${errorcode}"=="2"){
		alert("${errormsg}");		
	}
})


$(document).ready(function(){
	$('#confirm_password').focusout(function(){
		if($('#teacher_password').val() != $('#confirm_password').val()){
			$('#pw2_check').removeClass('hidden');
			$('#pw2_check').css('color', 'red');
			$('#confirm_password').val("");
		} else $('#pw2_check').addClass('hidden');
	});
	
	
	$('#teacher_id').on("focusout", function(){
		var memid = $('#teacher_id').val();
		$.ajax({
	        type:"POST",
	        url:"${pageContext.request.contextPath}/profIdCheck.do",
	        data : {id : memid},
	        dataType : "json",
	        success: function(data){
	            if(data != null){
	    			$('#id_check').css('color', 'red');
	    			$('#id_check').text('아이디 사용 불가');
	    		} 
	            else if(data == null && $('#teacher_id').val()==""){
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
		
		if(cnt == 2) {
			$('#frm').submit();
		} else {
			alert("모든 값을 입력하세요");
		}
		
	});
	
	$('#teacher_password').on("focusout", function(){
		var leng = $('#teacher_password').val();
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
					action="${pageContext.request.contextPath}/profInsert.do">
				<fieldset>
					<br>
					<h3>교사 회원가입</h3>
					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="Name">ID</label>
						<div class="col-md-5">
							<input id="teacher_id" name="teacher_id" type="text" placeholder="username"
								class="form-control input-md" required="required">
							<span id="id_check" class="help-block"></span>
						</div>
					</div>

					<!-- Password input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="passwordinput">Password</label>
						<div class="col-md-5">
							<input id="teacher_password" name="teacher_password" type="password"
								placeholder="" class="form-control input-md" required="required">
							<span class="help-block">max 16 characters</span>
						</div>
					</div>

					<!-- Password input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="confirm_password">Confirm
							Password</label>
						<div class="col-md-5">
							<input id="confirm_password" 
								type="password" placeholder="Re-type password"
								class="form-control input-md" required="required">
							<span id="pw2_check" class="hidden"> 비밀번호가 일치하지 않습니다.</span>

						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="Name">Name</label>
						<div class="col-md-5">
							<input id="Name" name="teacher_name" type="text" placeholder="username"
								class="form-control input-md" required="required">
						</div>
					</div>


					<!-- Email Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="emial">Email</label>
						<div class="col-md-5">
							<input id="email" name="teacher_email" type="text"
								placeholder="Email" class="form-control input-md"
								required="required">
						</div>
					</div>



					<div class="form-group">
					<label class="col-md-4 control-label" for="address">프로필 사진</label>
						<div>
							<label for="filename">Select a file:</label> 
							<input type="file" id="filename" name="teacher_picture">
						</div>
					</div>


					<!-- Textarea -->
					<div class="form-group">
						<label class="col-md-4 control-label" for="address">이력</label>
						<div class="col-md-4">
							<textarea class="form-control" id="address" name="teacher_record">default text</textarea>
						</div>
					</div>
					
					
					<!-- Textarea -->
					<div class="form-group">
						<label class="col-md-4 control-label" for="teacher_certificate">보유자격증</label>
						<div class="col-md-4">
							<textarea class="form-control" id="teacher_certificate" name="teacher_certificate">default text</textarea>
						</div>
					</div>
					
				</fieldset>
			</form>
				<fieldset>
					<!-- Button -->
					<div class="form-group">
						<label class="col-md-4 control-label" for="submit"></label>
						<div class="col-md-4">
							<button type="button" id="frmsubmit" name="submit" class="btn btn-success">Submit</button>
							<a href="${pageContext.request.contextPath}/member/login.jsp"><input value="취소" class="btn"></a>
						</div>
					</div>
				</fieldset>

		</div>
	</div>
</body>
</html>