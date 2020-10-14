<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>

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
	        url:"${pageContext.request.contextPath}/ajax/memIdCheck.do",
	        data : {id : memid},
	        dataType : "json",
	        success: function(data){
	        	console.log(data);
	            if(data == 1){
	    			$('#id_check').css('color', 'red');
	    			$('#id_check').text('아이디 사용 불가');
	    			$('#member_id').val("");
	    		}else if(data == 0 && $('#member_id').val()==""){
	            	$('#id_check').css('color', 'red');
	        		$('#id_check').text('아이디를 입력하세요');
	    			
	    		}else{
	    			$('#id_check').css('color', 'gray');
	    			$('#id_check').text('사용 가능한 아이디입니다.');
	    		}
	        }
	    });
	}); //아이디체크
	
	

	
	
	
	$('#frmsubmit').on("click", function(){
		var cnt = 0;
		$('#frm').find("input").each(function(){
			if($(this).val() == ""){
				cnt++;
			}
		});
 		if(cnt >=1 && cnt <= 8) {
			alert("모든 값을 입력하세요");
		} else {
			$('#frm').submit();
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
			         var leng3 = $('#member_age3').val();
			         var age2 = $('#member_age2').val();
			         
			         
			         var age3day = 0;
			         var yy = 0;
		         var leng = $('#member_age1').val();
		         var today = new Date();
		         var yearNow = today.getFullYear();
		         
		         
		         if (leng.length != 4){
		            var regexp = /^[0-9]*$/
		            if(!regexp.test(leng)){
		               alert("숫자만 입력하세요");
		               $('#member_age1').val("");
		            } else if(parseInt(leng) > yearNow || parseInt(leng) < 1900){
		               alert("정확한 연도를 입력하세요");
		               $('#member_age1').val("");
		            }
		         }
		         if (leng.length == 4){
		            if(parseInt(leng) < 1900 || parseInt(leng) > yearNow){
		               alert("정확한 연도를 입력하세요");
		               $('#member_age1').val("");
		            }
		            
		            
		            
		            if (leng3 != null){
			        	 age3day = 0;
			        	 
			        	if(leng % 4 == 0 && leng % 100 != 0 || leng % 400 == 0) {
			        		yy = 1;
			        	} else {
			        		yy = 0;
			        	}; //윤달+ 체크
			        	
			        	if(age2 == 01){
			        		age3day = 31;
			        	}else if(age2 == 03){
			        		age3day = 31;
			        	}else if(age2 == 05){
			        		age3day = 31;
			        	}else if(age2 == 07){
			        		age3day = 31;
			        	}else if(age2 == 08){
			        		age3day = 31;
			        	}else if(age2 == 10){
			        		age3day = 31;
			        	}else if(age2 == 12){
			        		age3day = 31;
			        	}else if(age2 == 04){
			        		age3day = 30;
			        	}else if(age2 == 06){
			        		age3day = 30;
			        	}else if(age2 == 09){
			        		age3day = 30;
			        	}else if(age2 == 11){
			        		age3day = 31;
			        	}else {
			        		age3day = 28 + yy;
			        	}//한달에 몇일 있는지 계산
			            
			        	console.log(age3day);
					
			            
			         		

			      	if (leng3.length == 2){
				            if(leng3 > age3day){
				               alert("정확한 날짜를 입력하세요");
				               $('#member_age3').val("");
				               console.log(age3day);
				            }
				         }
		            
			      	}//일자가 있으면 계산
		            
		            
		            
		         }
		      }
		   }); //생년월일 연도 체크
		      
		   
		   
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
		         var age2 = $('#member_age2').val();
		         var age1 = $('#member_age1').val();
		         
		         var age3day = 0;
		         var yy = 0;
		         
		         if (leng.length != 2){
		            var regexp = /^[0-9]*$/
		            if(!regexp.test(leng)){
		               alert("숫자만 입력하세요");
		               $('#member_age3').val("");
		            } else if(parseInt(leng) < 9){
		               alert("2자리의 날짜로 입력하세요");
		               $('#member_age3').val("");
		            }
		         }//2자리 아니면 알림
		         
		         
		         
		         if (age1 != null){
		        	 age3day = 0;
		        	 
		        	if(age1 % 4 == 0 && age1 % 100 != 0 || age1 % 400 == 0) {
		        		yy = 1;
		        	} else {
		        		yy = 0;
		        	}; //윤달+ 체크
		        	
		        	if(age2 == 01){
		        		age3day = 31;
		        	}else if(age2 == 03){
		        		age3day = 31;
		        	}else if(age2 == 05){
		        		age3day = 31;
		        	}else if(age2 == 07){
		        		age3day = 31;
		        	}else if(age2 == 08){
		        		age3day = 31;
		        	}else if(age2 == 10){
		        		age3day = 31;
		        	}else if(age2 == 12){
		        		age3day = 31;
		        	}else if(age2 == 04){
		        		age3day = 30;
		        	}else if(age2 == 06){
		        		age3day = 30;
		        	}else if(age2 == 09){
		        		age3day = 30;
		        	}else if(age2 == 11){
		        		age3day = 31;
		        	}else {
		        		age3day = 28 + yy;
		        	}//한달에 몇일 있는지 계산
		            
		        	console.log(age3day);
				
		            
		         		
		      	}//연도가 있으면 계산
		        
		         	
		        
		      	
		      	
		         if (leng.length == 2){
			            if(leng > age3day){
			               alert("정확한 날짜를 입력하세요");
			               $('#member_age3').val("");
			               console.log(age3day);
			            }
			         } //2자리인데 31일 넘기면 알림
		      	
		      	
		         
		      }
		   }); //생년월일 일 체크
	
	
	
		   
		   $('#member_age2').on({
			      focusout: function(){
			         var leng = $('#member_age3').val();
			         var age2 = $('#member_age2').val();
			         var age1 = $('#member_age1').val();
			         
			         var age3day = 0;
			         var yy = 0;			         
			         
			         if (age1 != null ){
			        	 age3day = 0;
			        	 
			        	if(age1 % 4 == 0 && age1 % 100 != 0 || age1 % 400 == 0) {
			        		yy = 1;
			        	} else {
			        		yy = 0;
			        	}; //윤달+ 체크
			        	
			        	if(age2 == 01){
			        		age3day = 31;
			        	}else if(age2 == 03){
			        		age3day = 31;
			        	}else if(age2 == 05){
			        		age3day = 31;
			        	}else if(age2 == 07){
			        		age3day = 31;
			        	}else if(age2 == 08){
			        		age3day = 31;
			        	}else if(age2 == 10){
			        		age3day = 31;
			        	}else if(age2 == 12){
			        		age3day = 31;
			        	}else if(age2 == 04){
			        		age3day = 30;
			        	}else if(age2 == 06){
			        		age3day = 30;
			        	}else if(age2 == 09){
			        		age3day = 30;
			        	}else if(age2 == 11){
			        		age3day = 31;
			        	}else {
			        		age3day = 28 + yy;
			        	}//한달에 몇일 있는지 계산
			            
			        	console.log(age3day);
			         		
			      	}//연도가 있으면 계산
			        
			      	
			         if (leng.length == 2){
				            if(leng > age3day){
				               alert("정확한 날짜를 입력하세요");
				               $('#member_age3').val("");
				               console.log(age3day);
				            }
				         } //2자리인데 31일 넘기면 알림
			      	
			         
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
		}else {
			$.ajax({
		        type:"POST",
		        url:"${pageContext.request.contextPath}/ajax/memEmailCheck.do",
		        data : {email : v},
		        dataType : "json",
		        success: function(data){
		        	console.log(data);
		            if(data == 1){
		    			$('#em_check').css('color', 'red');
		    			$('#em_check').text('가입한 이력이 있습니다.');
		    			$('#email').val("");
		    		}else if(data == 0){
		    			$('#em_check').text('사용 가능한 이메일입니다.');
		    		}
		        }
		    });
		};
	});
	
	
	$('#phone_number').on("focusout", nCheck);
	
	
	
	
});


function nCheck(){
    var numCheck = $(this).val();
    if(/[^0123456789]/g.test(numCheck)){
        alert("번호는 숫자만 입력이 가능합니다.");
        $(this).val("");
    }
}



</script>


</head>

<body>

<br><br>

	<div class="container">
		<div class="row">
			<form class="form-horizontal" name="frm" method="post" id="frm" 
					action="${pageContext.request.contextPath}/nostms/memInsert.do">
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
						
					
<!-- 						<label class="col-md-4 control-label" for="passwordinput"></label>
						<div class="col-md-5">
							<span id="birth_check" class="help-block">dd</span>
						</div> -->
						
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
						<label class="col-md-4 control-label" for="email">Email</label>
						<div class="col-md-5">
							<input id="email" name="email" type="text"
								placeholder="Email" class="form-control input-md"
								required="required">
							<span id="em_check" class="help-block"></span>
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
							<label class="radio-inline" for="is_major">
								<input type="radio" name="is_major" id="gender-0" value="Y" checked="checked"> 예
							</label> 
							<label class="radio-inline" for="is_major">
								<input type="radio" name="is_major" id="gender-1" value="N">아니오
							</label>
						</div>
					</div>


					<!-- Multiple Radios (inline) --> 
					<div class="form-group">
						<label class="col-md-4 control-label" for="study_term">공부기간</label>
						<div class="col-md-5">
							<label class="radio-inline" for="study_term"> 
								<input type="radio" name="study_term" id="study_term-0" value="1개월 미만" checked="checked">1개월 미만
							</label> 
							<label class="radio-inline" for="study_term">
								<input type="radio" name="study_term" id="study_term-1" value="1~3개월 미만">1~3개월 미만
							</label>
							<label class="radio-inline" for="study_term">
								<input type="radio" name="study_term" id="study_term-2" value="3개월 이상">3개월 이상
							</label>
							<!-- <label class="radio-inline" for="gender-1">
								<input type="radio" name="study_term" id="study_term-3" value="1년이상">1년 이상
							</label> -->
						</div>
					</div>

					<!-- Multiple Radios (inline) --> 
					<div class="form-group">
						<label class="col-md-4 control-label" for="tested_num">시험횟수</label>
						<div class="col-md-5">
							<label class="radio-inline" for="tested_num"> 
								<input type="radio" name="tested_num" id="tested_num-0" value="0" checked="checked"> 0회
							</label> 
							<label class="radio-inline" for="tested_num">
								<input type="radio" name="tested_num" id="tested_num-1" value="1">1회
							</label>
							<label class="radio-inline" for="tested_num">
								<input type="radio" name="tested_num" id="tested_num-2" value="2">2회
							</label>
							<label class="radio-inline" for="tested_num">
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