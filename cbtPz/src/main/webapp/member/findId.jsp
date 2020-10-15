<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>findId.jsp</title>
<style>
body {
    padding-top: 90px;
}
.panel-login {
	border-color: #ccc;
	-webkit-box-shadow: 0px 2px 3px 0px rgba(0,0,0,0.2);
	-moz-box-shadow: 0px 2px 3px 0px rgba(0,0,0,0.2);
	box-shadow: 0px 2px 3px 0px rgba(0,0,0,0.2);
}
.panel-login>.panel-heading {
	color: #00415d;
	background-color: #fff;
	border-color: #fff;
	text-align:center;
}
.panel-login>.panel-heading a{
	text-decoration: none;
	color: #666;
	font-weight: bold;
	font-size: 15px;
	-webkit-transition: all 0.1s linear;
	-moz-transition: all 0.1s linear;
	transition: all 0.1s linear;
}
.panel-login>.panel-heading a.active{
	color: #029f5b;
	font-size: 18px;
}
.panel-login>.panel-heading hr{
	margin-top: 10px;
	margin-bottom: 0px;
	clear: both;
	border: 0;
	height: 1px;
	background-image: -webkit-linear-gradient(left,rgba(0, 0, 0, 0),rgba(0, 0, 0, 0.15),rgba(0, 0, 0, 0));
	background-image: -moz-linear-gradient(left,rgba(0,0,0,0),rgba(0,0,0,0.15),rgba(0,0,0,0));
	background-image: -ms-linear-gradient(left,rgba(0,0,0,0),rgba(0,0,0,0.15),rgba(0,0,0,0));
	background-image: -o-linear-gradient(left,rgba(0,0,0,0),rgba(0,0,0,0.15),rgba(0,0,0,0));
}
.panel-login input[type="text"],.panel-login input[type="email"],.panel-login input[type="password"] {
	height: 45px;
	border: 1px solid #ddd;
	font-size: 16px;
	-webkit-transition: all 0.1s linear;
	-moz-transition: all 0.1s linear;
	transition: all 0.1s linear;
}
.panel-login input:hover,
.panel-login input:focus {
	outline:none;
	-webkit-box-shadow: none;
	-moz-box-shadow: none;
	box-shadow: none;
	border-color: #ccc;
}
.btn-login {
	background-color: #59B2E0;
	outline: none;
	color: #fff;
	font-size: 14px;
	height: auto;
	font-weight: normal;
	padding: 14px 0;
	text-transform: uppercase;
	border-color: #59B2E6;
}
.btn-login:hover,
.btn-login:focus {
	color: #fff;
	background-color: #53A3CD;
	border-color: #53A3CD;
}
.forgot-password {
	text-decoration: underline;
	color: #888;
}
.forgot-password:hover,
.forgot-password:focus {
	text-decoration: underline;
	color: #666;
}

.btn-register {
	background-color: #1CB94E;
	outline: none;
	color: #fff;
	font-size: 14px;
	height: auto;
	font-weight: normal;
	padding: 14px 0;
	text-transform: uppercase;
	border-color: #1CB94A;
}
.btn-register:hover,
.btn-register:focus {
	color: #fff;
	background-color: #1CA347;
	border-color: #1CA347;
}
	
.form-group-cate {
	text-align:center;
}


</style>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>

<script>

$(function() {
	
    $('#login-form-link').click(function(e) {
		$("#IdFind-frm").delay(100).fadeIn(100);
 		$("#login2-form").fadeOut(100);
		$('#login2-form-link').removeClass('active');
		$(this).addClass('active');
		e.preventDefault();
	});
	$('#login2-form-link').click(function(e) {
		$("#login2-form").delay(100).fadeIn(100);
 		$("#IdFind-frm").fadeOut(100);
		$('#login-form-link').removeClass('active');
		$(this).addClass('active');
		e.preventDefault();
	});


	$('#find-submit').on("click", function(){
		var idf = "";
		if($('input:checkbox[id="member"]').is(":checked") == true){
			idf = 0;
		} else if ($('input:checkbox[id="teacher"]').is(":checked") == true) {
			idf = 1;
		} else {
			alert("카테고리를 선택해주세요");
			return;
		}

		var username = $('#username').val();
		var email = $('#email').val();
		console.log(email);
		$.ajax({
			type:"POST",
	        url:"${pageContext.request.contextPath}/ajax/memIdFind.do",
	        data : {idfind : idf, name : username, em : email},
	        dataType : "json",
	        success: function(data){
	        	if(data != null){
	        		if(data.member_id != null){
			    		$('#findmyidmodal').text("회원가입시 사용한 아이디는 " + data.member_id + " 입니다.");
	        		} else if(data.teacher_id != null) {
			    		$('#findmyidmodal').text("회원가입시 사용한 아이디는 " + data.teacher_id + " 입니다.");
	        		}
	        	} else {
		    		$('#findmyidmodal').text("해당하는 아이디가 없습니다.");
	        	}
			    	$('#myModal').modal();
			    	$('#username').val("");
			    	$('#email').val("");
			    	$('.category').prop('checked', false);
			    	
	        }
			
		});
	});  //id find func end
	
	
	$('#pwfind-submit').on("click", function(){
		var idf = "";
		if($('input:checkbox[id="member"]').is(":checked") == true){
			idf = 0;
		} else if ($('input:checkbox[id="teacher"]').is(":checked") == true) {
			idf = 1;
		} else {
			alert("카테고리를 선택해주세요");
			return;
		}

		var userid = $('#userid').val();
		var pemail = $('#pemail').val();
		//console.log(email);
		$.ajax({
			type:"POST",
	        url:"${pageContext.request.contextPath}/ajax/memPwFind.do",
	        data : {idfind : idf, id : userid, em : pemail},
	        dataType : "json",
	        success: function(data){
	        	if(data != null){
	        		if(data.member_pw != null){
			    		$('#findmyidmodal').text("새로 발급받은 비밀번호는 " + data.member_pw + " 입니다." + " 로그인 후 비밀번호를 변경해주시기 바랍니다.");
	        		} else if(data.teacher_password != null) {
			    		$('#findmyidmodal').text("새로 발급받은 비밀번호는 " + data.teacher_password + " 입니다." + " 로그인 후 비밀번호를 변경해주시기 바랍니다.");
	        		}
	        	} else {
		    		//$('#myModal').modal();
		    		$('#findmyidmodal').text("해당하는 유저가 없습니다.");
	        	}
			    	$('#myModal').modal();
			    	$('#userid').val("");
			    	$('#pemail').val("");
	        }
			
		});
	}); // pw find func end
	
	
	
	
	

}); //func End


	
	


</script>


</head>
<body>

	<div class="container">
    	<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="panel panel-login">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-6">
								<a href="#" class="active" id="login-form-link">아이디 찾기</a>
							</div>
							<div class="col-xs-6">
								<a href="#" id="login2-form-link">비밀번호 찾기</a>
							</div>
						</div>
						<hr>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-lg-12">
								<div class="form-group-cate">
									<div class="col-xs-3"></div>
									<div class="col-xs-3">
										<input type="checkbox" tabindex="3" class="category" name="idfind" id="member" value="0">
										<label for="remember">일반회원</label>
									</div>
									
									<div class="col-xs-3">
										<input type="checkbox" tabindex="3" class="category" name="idfind" id="teacher" value="1">
										<label for="remember">강사회원</label>
									</div>
									<div class="col-xs-3"></div>
								</div>
								
								<form id="IdFind-frm" method="post" role="form" style="display: block;">

									<script>
										$('.category').on('change', function() {
											$('.category').not(this).prop('checked', false);
										});
									</script>


									<div class="form-group">
										<input type="text" name="member_name" id="username" tabindex="1" class="form-control" placeholder="Username" value="" required="required">
									</div>
									<div class="form-group">
										<input type="text" name="email" id="email" tabindex="2" class="form-control" placeholder="Email" required="required">
									</div>
<!-- 									<div class="form-group text-center">
										<input type="checkbox" tabindex="3" class="" name="admin" id="remember" value="admin">
										<label for="remember"> Admin</label>
									</div> -->
									
									<!-- 찾기 버튼 -->
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3" >
												<button type="button" id="find-submit" class="form-control btn btn-login">찾기</button>
											</div>
										</div>
									</div>
								</form>
<%-- 									<!-- 가입버튼 -->
									<form id="userRegister" action="${pageContext.request.contextPath}/member/memInsert.jsp">
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<input type="submit" name="login-submit" id="in-submit" tabindex="4" class="form-control btn btn-login" value="Register">
											</div>
										</div>
									</div>
									</form> --%>
									

								
								<!-- pw찾기~~~~~ -->
								<form id="login2-form" method="post" role="form" style="display: none;">
<!-- 									<div class="form-group-cate">
										<div class="col-xs-3"></div>
										<div class="col-xs-3">
											<input type="checkbox" tabindex="3" class="category" name="remember" id="member" value="0">
											<label for="remember">일반회원</label>
										</div>
										
										<div class="col-xs-3">
											<input type="checkbox" tabindex="3" class="category" name="remember" id="teacher" value="1">
											<label for="remember">강사회원</label>
										</div>
										<div class="col-xs-3"></div>
									</div> -->
									
									<div class="form-group">
										<input type="text" name="userid" id="userid" tabindex="1" class="form-control" placeholder="UserId" required="required">
									</div>
									<div class="form-group">
										<input type="text" name="pemail" id="pemail" tabindex="2" class="form-control" placeholder="Email" required="required">
									</div>
									
<!-- 									<div class="form-group text-center">
										<input type="checkbox" tabindex="3" class="" name="remember" id="remembert">
										<label for="remember"> Admin</label>
									</div> -->
									
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<input type="button" name="pwfind-submit" id="pwfind-submit" tabindex="4" class="form-control btn btn-login" value="찾기">
											</div>
										</div>
									</div>
								</form>
									
						<%-- 			<form id="user2Register" action="${pageContext.request.contextPath}/member/profInsert.jsp" style="display: none;">
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<input type="submit" name="login-submit" id="tlogin-submit" tabindex="4" class="form-control btn btn-login" value="Register">
											</div>
										</div>
									</div>
									</form> --%>
									

					<!-- 			<div class="form-group">
									<div class="row">
										<div class="col-lg-12">
											<div class="text-center">
												<a href="https://phpoll.com/recover" tabindex="5"
													class="forgot-password">Forgot Password?</a>
											</div>
										</div>
									</div>
								</div> -->

 									<form id="user2Register2" action="${pageContext.request.contextPath}/member/login.jsp" style="display: block;">
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<input type="submit" name="login-submit" id="tlogin-submitc" tabindex="4" class="form-control btn btn-login" value="취소">
											</div>
										</div>
									</div>
									</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	
	
	  <!-- The Modal -->
  <div class="modal" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">찾기</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          	<div id="dialog-message" title="ID검색" >
 				<span id="findmyidmodal" class="findmyidmodal_span"></span>
			</div>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
	
	
</body>
</html>