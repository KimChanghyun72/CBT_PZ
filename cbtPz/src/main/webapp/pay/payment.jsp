<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<style>
/* #payFrm{
    box-shadow: 0 3px 20px rgba(0, 0, 0, 0.15);
    padding: 35px 50px;
    border-radius: 6px;
    background:#f7f7f7;
}

.box {
	
	width:500px;
	height:200px;
	margin:0 auto;
	line-height:1em;
	position:relative;
	background:#fff;
	border-color: #f1f1f1;
	box-shadow: 0 3px 20px rgba(0, 0, 0, 0.15);
}
.box p {
	font-size : 130%;
	position:absolute;
	top:50%;
	left:50%;
	width:100%;
	margin-top:-0.5em;  
	margin-left:-50%;
	
	text-align:center;
	
	
}
.box p.p1 {
	
	margin-top:-2.0em;  
	
	
}

.box2{
	width:500px;
	height:30px;
	margin:0 auto;
	line-height:1em; 
	 position:relative; 
	 margin-top:100px;   
	background:#fff;
}
.box3 {
	width:500px;
	height:100px;
	margin:0 auto;
	line-height:1em;
	position:relative;
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
} */


.single-cool-facts-area {
border: 1px solid rgba(214, 223, 251, 0.7);
}
input[type=checkbox] {

zoom: 1.5;

}
 p {
	font-size : 130%;
}
 .checkArea:hover,
 .checkArea:focus {
 	
	color: #fff;
	background-color: #3762F0;
	border-color: #53A3CD;
 }
 .checkArea:hover span,
 .checkArea:focus span{
 	
 	color: #fff;
 }
 .checkArea2{
	background-color: #3762F0;
	border-color: #53A3CD;
 }
 .checkArea2 span{
 	color: #fff;
 }
​
</style>
<meta charset="UTF-8">
<title>결제 페이지</title>

<script>
 <% request.getSession().setAttribute("pageName", "멤버쉽"); %>

$(function(){
	var term;
	var payment;
	
	var IMP = window.IMP;
	IMP.init('imp68502592');
		
	/* $(".btnSubmit").on("click", function(){
	IMP.request_pay({
	    pg : 'inicis', // version 1.1.0부터 지원.
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : '주문명:결제테스트',
	    amount : 100,
	    buyer_email : 'iamport@siot.do',
	    buyer_name : '구매자이름',
	    buyer_tel : '010-2953-6675',
	    buyer_addr : '서울특별시 강남구 삼성동',
	    buyer_postcode : '123-456',
	    //m_redirect_url : 'https://www.yourdomain.com/payments/complete'
	}, function(rsp) {
	    if ( rsp.success ) {
	        var msg = '결제가 완료되었습니다.';
	        msg += '고유ID : ' + rsp.imp_uid;
	        msg += '상점 거래ID : ' + rsp.merchant_uid;
	        msg += '결제 금액 : ' + rsp.paid_amount;
	        msg += '카드 승인번호 : ' + rsp.apply_num;
	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
	    }
	    alert(msg);
	});
		
	}); */
//결제api 종료
	
 	 $(document).on("click",".btnSubmit", function(){
 		 if($("input[name=price]").val()==""){
 			 alert("멤버십 기간을 선택하세요.");
 		 }else{
 			 if($("[name=is_pay]").prop("checked")){
 				 var confirmVal = confirm("결제 하시겠습니까?");
 				 if(confirmVal==1){
 					$("#payFrm").submit();
 				 }
 			 }else{
 				 alert("결제 조건에 동의하십시오.");
 			 }
 		 }
		/* if($("[name=is_payed]").prop("checked")){ //결제 동의여부 체크
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
		} */
	});  
	
	
	
});
	$(document).on("click",".checkArea", function(){
		
		$(".checkArea2").attr("class","checkArea single-cool-facts-area text-center mb-100 wow fadeInUp");
		$(this).addClass("checkArea2");
		var price = $(this).find(".counter").text().replace(",","");
		var term = $(this).find("input").val();
		$("input[name=price]").val(price);
		$("input[name=term]").val(term);
	})

</script>
</head>

<section class="cool-facts-area section-padding-100-0">
	<div class="container">
		<div class="row">
			<!-- Single Cool Facts Area -->
			<div class="col-12 col-sm-6 col-lg-3">
				<div class="checkArea single-cool-facts-area text-center mb-100 wow fadeInUp"
					data-wow-delay="150ms">
					<h2>
						<span class="counter">30,000</span>
					</h2>
					<h5>1개월(30일)</h5><input type="hidden" value="30">
				</div>
			</div>

			<!-- Single Cool Facts Area -->
			<div class="col-12 col-sm-6 col-lg-3">
				<div class="checkArea single-cool-facts-area text-center mb-100 wow fadeInUp"
					data-wow-delay="500ms">
					<h2>
						<span class="counter">58,000</span>
					</h2>
					<h5>2개월(60일)</h5><input type="hidden" value="60">
				</div>
			</div>

			<!-- Single Cool Facts Area -->
			<div class="col-12 col-sm-6 col-lg-3">
				<div class="checkArea single-cool-facts-area text-center mb-100 wow fadeInUp"
					data-wow-delay="750ms">
					<h2>
						<span class="counter">85,000</span>
					</h2>
					<h5>3개월(90일)</h5><input type="hidden" value="90">
				</div>
			</div>

			<!-- Single Cool Facts Area -->
			<div class="col-12 col-sm-6 col-lg-3">
				<div class="checkArea single-cool-facts-area text-center mb-100 wow fadeInUp"
					data-wow-delay="1000ms">
					<h2>
						<span class="counter">150,000</span><input type="hidden" value="180">
					</h2>
					<h5>6개월(180일)</h5>
				</div>
			</div>
		</div>
	</div>
</section>


<!-- ##### Register Now Start ##### -->
    <section class="register-now section-padding-100-0 d-flex justify-content-between align-items-center" style="background-image: url(img/core-img/texture.png);">
        <!-- Register Contact Form -->
        <div class="register-contact-form mb-100 wow fadeInUp" data-wow-delay="250ms">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="forms">
                            <h4>상품 결제</h4>
                            <form id="payFrm" name="payFrm" action="${pageContext.request.contextPath}/payInsertCtrl.do">
                            	<input type="hidden" name="price">
                            	<input type="hidden" name="term">
                            	<input type="hidden" name ="pay" value="pay">
                            	<p>구매 및 주문 처리에 대한 모든 약관에 동의합니다(필수)&nbsp;&nbsp;<input type="checkbox" name="is_pay" value="YES"></p>
                            	<br>
                            </form>
                            <div class="col-12">
                                        <button class="btnSubmit btn clever-btn w-100">결 제 하 기</button>
                                        
                                    </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Register Now Countdown -->
        <div class="register-now-countdown mb-100 wow fadeInUp" data-wow-delay="500ms">
            <h4>YDCBT의 프리미엄 회원이 되어 훌륭한 서비스를 누리십시오.</h4>
            <p>다양한 유형의 문제들을 손쉽게 검색해서 풀 수 있는 일반회원의 혜택에서 과목별, 테마별 맞춤식으로 제공되는 인터넷 강의 서비스와 시험에 대비하여 요점만 콕 찝어주는 족집게 강의를 제공받으실 수 있습니다.</p>
            <!-- Register Countdown -->
            <div class="register-countdown">
                <div class="events-cd d-flex flex-wrap" data-countdown="2019/03/01"></div>
            </div>
        </div>
    </section>













<%-- <div class="container">
<form id="payFrm" name="payFrm" action="<%=application.getContextPath()%>/payInsertCtrl.do">
	
	<div class="box2" style = background:#f7f7f7><p><b>선택 옵션</b></p></div>
	<div class="box">
	<p class="p1">
	<!-- 유료회원 기간 선택 -->
	<input type="radio" name="term" value="30">1개월(30000원)
	<input type="radio" name="term" value="60">2개월(58000원)<br><br>
	<input type="radio" name="term" value="90">3개월(85000원)
	<input type="radio" name="term" value="180">6개월(165000원)
	</p>
	</div>
	<!-- 지불 가격 선택 -->
	<div class="box2" style = background:#f7f7f7><p><b>결제 가격</b></p></div>
	<div class="box">
	<p class="price"></p>
	<input type="hidden" name="price">
	</div>
	
	<div class="box2" style = background:#f7f7f7><p><b>결제 수단</b></p></div>
	<div class="box">
	<p>
	<span class="aaa"></span>
	
		<input type="radio" name="payment" value="credit">신용카드
		<input type="radio" name="payment" value="realtime">실시간계좌이체
		<input type="radio" name="payment" value="bankbook">무통장입금
		<input type="radio" name="payment" value="kakaopay">카카오페이
	
	</p></div>
	<div class="box2"  style = background:#f7f7f7;>
		<p>
			구매 및 주문 처리에 대한 모든 약관에 동의합니다(필수)
			<input type="checkbox" name="is_payed" value="YES">
		</p>
	</div>
	<div class="box3" style = background:#f7f7f7 >
	<input type="hidden" name ="payCheck" value="pay">
	<!-- 선택옵션은 회원정보에 결제여부가 no이면 yes로 바꾸고 만료기간을 sysdate+30일로 업데이트. 만약 유료회원이 결제한다면 만료일에 결제기간 + -->
	<!-- <input type="button" class="btnSubmit" value="결제하기"> -->
	<br>
		<div class="form-group" >
			<!-- <div class="row">
				<div class="col-sm-6 col-sm-offset-3"> -->
					<input type="button" name="login-submit" id="tin-submit" tabindex="4" class="form-control btn btn-login" value="결제하기">
				<!-- </div>
			</div> -->
		</div>
	</div>
</form>	
</div> --%>

</body>
</html>