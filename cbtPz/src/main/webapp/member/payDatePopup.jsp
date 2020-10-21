<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JJOKJEBI_Popup</title>
<style>
h3{
	color: tomato;
	text-align: center;
}

h4{
	text-align: center;
}
</style>
<script>

$(window).load(function(){
	var strWidth=$('#container').outerWidth() + (window.outerWidth - window.innerWidth);
	var strHeight=$('#container').outerHeight() + (window.outerHeight - window.innerHeight);

	window.resizeTo(strWidth, strHeight);

});


function setCookie(name, value, expiredays) {
    var date = new Date();
    date.setDate(date.getDate() + expiredays);
    document.cookie = escape(name) + "=" + escape(value) + "; expires=" + date.toUTCString();
}

function closePopup() {
    if (document.getElementById("check").value) {
        setCookie("popupYN", "N", 1);
        self.close();
    }
}



</script>


<!-- Favicon -->
<link rel="shortcut icon" href="${pageContext.request.contextPath}/img/core-img/JJlogoicon.ico">


</head>

<body>
    <div class="container">
	    <br />
	    <h3> 회원님의 멤버쉽 만료날짜가 곧 만료됩니다.</h3>
	    <h4>( "${name}"님의 만료날짜 : ${login.pay_enddate} )</h4> 
	    <h3>서비스를 계속 이용하시려면 연장해주세요!</h3>
	    <br />
	    <div class="col-12">
			<div class="row">

					<input type="checkbox" id="check" onclick="closePopup();">
					오늘하루동안 닫기
					<a href="${pageContext.request.contextPath}/pay/payment.jsp" target="_blank">결제페이지로 가기</a>
					<button type="button" id="exit" onclick="closePopup();">
					창 닫기
					</button>
			</div>
		</div>
	</div>

</body>
</html>