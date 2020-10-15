<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<style>

#payFrm{
	border : 1px grey;
}


.box {
	width:500px;
	height:200px;
	margin:0 auto;
	line-height:1em;
	position:relative;
	/* margin-top:100px; */
	background:#fff;
	border : black 1px solid;
}
.box p {
	position:absolute;
	top:50%;
	left:50%;
	width:100%;
	margin-top:-0.5em;
	margin-left:-50%;
	text-align:center;
}

.box2{
	width:500px;
	height:30px;
	margin:0 auto;
	 line-height:1em; 
	 position:relative; 
	 margin-top:100px;   
	background:#fff;
	/* border : black 1px solid; */
}
.box3 {
	width:500px;
	height:100px;
	margin:0 auto;
	line-height:1em;
	position:relative;
	/* margin-top:100px; */
	background:#fff;
}
.box3 p {
	position:absolute;
	top:50%;
	left:50%;
	width:100%;
	margin-top:-0.5em;
	margin-left:-50%;
	text-align:center;
}
.btn-login {
	background-color: #007BFF;
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

</style>
<meta charset="UTF-8">
<title>결제 페이지</title>
<script>

$(function(){
	var term;
	var payment;
	
	$('[name=term]').on("change",function(){
		console.log($(this).val());
		term = $(this).val();
		switch(term){
		case "30" :$(".price").html("30000원"); $("input[name=price]").val("30000");break;
		case "60" :$(".price").html("58000원"); $("input[name=price]").val("58000");break;
		case "90" :$(".price").html("85000원"); $("input[name=price]").val("85000");break;
		case "180" :$(".price").html("165000원"); $("input[name=price]").val("165000");break;
		default : break;
		}	
	});
	
	$('[name=payment]').on("change", function(){
		payment = $(this).val();
	})
	
	$(".btn-login").on("click", function(){
		if($("[name=is_payed]").prop("checked")){ //결제 동의여부 체크
			var confirmVal = confirm("결제하시겠습니까?");
			if(confirmVal){
				if(term != null && payment != null){//결제성공
					$("#payFrm").submit();
				}else if(payment != null){
					alert("가입기간 선택");
				}else if(term != null){
					alert("결제수단 선택");
				}else{
					alert("결제수단과 가입기간 선택");
				}
			}else{
				alert("결제 정보를 입력해주세요.")
			}
		}else{
			alert("구매에 동의하셔야 합니다.");
		}
	})
	
})


</script>
</head>
<body>

<div class="container">
<form id="payFrm" name="payFrm" action="<%=application.getContextPath()%>/payInsertCtrl.do">
	
	<div class="box2"><p><b>선택 옵션</b></p></div>
	<div class="box">
	<p>
	<!-- 유료회원 기간 선택 -->
	<input type="radio" name="term" value="30">1개월(30000원)
	<input type="radio" name="term" value="60">2개월(58000원)
	<input type="radio" name="term" value="90">3개월(85000원)<br><br>
	<input type="radio" name="term" value="180">6개월(165000원)
	</div>
	<!-- 지불 가격 선택 -->
	<div class="box2"><p><b>결제 가격</b></p></div>
	<div class="box">
	<p class="price"></p>
	<input type="hidden" name="price">
	</div>
	
	<div class="box2"><p><b>결제 수단</b></p></div>
	<div class="box">
	<p>
	<span class="aaa"></span>
	
		<input type="radio" name="payment" value="credit">신용카드
		<input type="radio" name="payment" value="realtime">실시간계좌이체
		<input type="radio" name="payment" value="bankbook">무통장입금
		<input type="radio" name="payment" value="kakaopay">카카오페이
	
	</p></div>
	<div class="box2">
		<p>
			구매 및 주문 처리에 대한 모든 약관에 동의합니다(필수)
			<input type="checkbox" name="is_payed" value="YES">
		</p>
	</div>
	<div class="box3">
	<input type="hidden" name ="payCheck" value="pay">
	<!-- 선택옵션은 회원정보에 결제여부가 no이면 yes로 바꾸고 만료기간을 sysdate+30일로 업데이트. 만약 유료회원이 결제한다면 만료일에 결제기간 + -->
	<!-- <input type="button" class="btnSubmit" value="결제하기"> -->
	<br>
		<div class="form-group">
			<!-- <div class="row">
				<div class="col-sm-6 col-sm-offset-3"> -->
					<input type="button" name="login-submit" id="tin-submit" tabindex="4" class="form-control btn btn-login" value="결제하기">
				<!-- </div>
			</div> -->
		</div>
	</div>
</form>	
</div>
</body>
</html>