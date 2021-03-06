<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>

<script
	src="https://cdn.jsdelivr.net/npm/fullcalendar@5.3.2/main.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/fullcalendar@5.3.2/main.css"
	rel="stylesheet">


<style>
.txt_line {
	width: 80%;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.txt_line2 {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.h3, h3 {
	font-size: 40px;
	text-shadow: 2px 2px 6px #F8F8FF;
}

</style>



<script>
	$(document)
			.ready(
					function() {

						$('.contact--info li')
								.on(
										"click",
										function() {
											console.log($(this).attr('id'));
											var b_id = $(this).attr('id');
											location.href = "${pageContext.request.contextPath}/board/noticeSelect.do?board_id="
													+ b_id;
										});
						var check = "${check}";
						console.log(check);
						if(check == 'M'){
							var is_pay = "${login.is_pay}";
							if(is_pay == 'Y'){
									
								var end_date = "${login.pay_enddate}";
								var dateArray = end_date.split("-");
								var dateObj = new Date(dateArray[0], Number(dateArray[1])-1, dateArray[2]); 
								var today = new Date();
								var betweenDay = ((today.getTime() - dateObj.getTime())/1000/60/60/24);
								//console.log(end_date);
								console.log(Math.floor(betweenDay));
								
								if(Math.floor(betweenDay) > -3){
									openPopup('${pageContext.request.contextPath}/nostms/payDatePopup.do');
								}
							}
						}

					});

	document
			.addEventListener(
					'DOMContentLoaded',
					function() {
						var calendarEl = document.getElementById('calendar');

						var calendar = new FullCalendar.Calendar(
								calendarEl,
								{
									initialView : 'dayGridMonth',
									/* events : function(info, successCallback,
											failureCallback) {
											$.ajax({
													url : '${pageContext.request.contextPath}/ajax/fullCalendar.do',
													type : 'POST',
													dataType : 'json',
													data : {
														start : info.start,
														end : info.end
													},
													success : function(doc) {
														console.log(doc);
														successCallback(doc);
													}
												}); */
									
									eventSources : [
														{
														url : '${pageContext.request.contextPath}/ajax/schedulerList.do',
														data: function() { return }
														//color : 'yellow',
														//timeZone : 'UTC',
														//editable : true,
														//selectable : true,
														}
													],displayEventTime: false

								});

						calendar.render();
	}); //캘린더
	
	
	function getCookie(name) { 
		var cookie = document.cookie; 
		if (document.cookie != "") { 
			var cookie_array = cookie.split("; "); 
			for ( var index in cookie_array) { 
				var cookie_name = cookie_array[index].split("="); 
				if (cookie_name[0] == "popupYN") { 
					return cookie_name[1]; } } } 
		return ; 
	} 
	
	function openPopup(url) { 
		var cookieCheck = getCookie("popupYN"); 
		var _width = '450';
	    var _height = '250';
		var _left = Math.ceil(( window.screen.width - _width )/2);
	    var _top = Math.ceil(( window.screen.width - _height )/7);
		if (cookieCheck != "N") window.open(url, 'payDatePopup', 'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top) 
	}
	
	
</script>

</head>

<body>




	<!-- ##### Hero Area Start ##### -->
	<section class="hero-area bg-img bg-overlay-2by 5">
		<div id="carouselExampleIndicators" class="carousel slide"
			data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#carouselExampleIndicators" data-slide-to="0"
					class="active"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner" role="listbox">
				<!-- Slide One - Set the background image for this slide in the line below -->
				<div class="carousel-item active"
					style="background-image: url(./img/computer1920.jpg)">
					<div class="carousel-caption d-none d-md-block">
						<img src="img/core-img/JJlogo.png" alt="" style="max-width: 28%;">
						<p style="text-shadow: 1px -1px white;">Hi, We are JJOCKJEBI-CBT!</p>
					</div>
				</div>
				<!-- Slide Two - Set the background image for this slide in the line below -->
				<div class="carousel-item"
					style="background-image: url(img/bg-img/bg1.jpg)">
					<div class="carousel-caption d-none d-md-block">
						<h3>#HASHTAG로 나에게 딱 맞는 맞춤 공부를 경험해보세요</h3>
						<p style="text-shadow: 1px -1px white;">Let's do it, HashTag
							Study!</p>
					</div>
				</div>
				<!-- Slide Three - Set the background image for this slide in the line below -->
				<div class="carousel-item"
					style="background-image: url(./img/architect1920.jpg)">
					<div class="carousel-caption d-none d-md-block">
						<h3>차별화된 쪽제비 CBT만의 문제를 만나보세요</h3>
						<!-- style="text-shadow: 1px -2px white;" -->
						<p style="text-shadow: 1px -1px white;">기출문제와 YDCBT만의 모의고사문제까지
							준비되어있습니다.</p>
					</div>
				</div>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleIndicators"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>

		<!-- <section class="popular-courses-area section-padding-100-0"> -->
		<section class="blog-area blog-page section-padding-100">

			<div class="row">
				<!-- 공지사항 -->
				<div class="col-12 col-lg-6">
					<div class="single-blog-area mb-100 wow fadeInUp"
						data-wow-delay="250ms">
						<img src="img/blog-img/1.jpg" alt="">
						<!-- Blog Content -->
						<div class="blog-content">
							<a href="${pageContext.request.contextPath}/board/noticeList.do"
								class="blog-headline">
								<h4>
									<i class="fa fa-clock-o" aria-hidden="true"></i> Notice
								</h4>
							</a>
							<div class="contact--info">
								<ul class="contact-list">
									<c:forEach items="${nlist}" var="notice_list">
										<li id="${notice_list.board_id}">
											<h6 class="txt_line">
												<i class="fa fa-map-pin" aria-hidden="true"></i>
												${notice_list.board_title}
											</h6>
											<h6 class="txt_line2">${notice_list.board_date}</h6>
										</li>
									</c:forEach>
								</ul>
							</div>
						</div>
					</div>
				</div>

				<!-- calendar -->
				<div class="col-12 col-lg-6">
					<div class="single-blog-area mb-100 wow fadeInUp"
						data-wow-delay="500ms">
						<div id='calendar'></div>
					</div>
				</div>

			</div>
<!-- 			<div class="section-heading">
				<h3></h3>
			</div> -->

		</section>

<!-- 		<section class="popular-courses-area section-padding-100-0">
			<div class="container">
				<div class="row">
					<div class="col-12">
						<div class="section-heading"></div>
					</div>
				</div>
			</div>
		</section> -->
		<!-- 	<section class="popular-courses-area section-padding-100-0">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="section-heading">
						<h3>Popular Online Courses</h3>
					</div>
				</div>
			</div>
		</div>
	</section> -->


		<!-- Top Footer Area -->
		<div class="top-footer-area">
			<div class="container">
				<div class="row">
					<div class="col-12">
						<!-- Footer Logo -->
						<div class="footer-logo">
							<a class="nav-brand" href="${pageContext.request.contextPath}/indexx.jsp"><img src="img/core-img/JJlogo_w.png" alt="" style="max-width: 12%;"></a>
						</div>
						<!-- Copywrite -->
						<p>
							<a href="#">
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
								Copyright &copy;2020 yedam vocational training institute | This
								template is made with <i class="fa fa-heart-o"
								aria-hidden="true"></i> by <a href="https://colorlib.com"
								target="_blank">Colorlib</a> <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						</p>
					</div>
				</div>
			</div>
		</div>


	</section>
	<!-- ##### Hero Area End ##### -->





	<!-- ##### Cool Facts Area Start ##### -->
<!-- 	<section class="cool-facts-area section-padding-100-0">
		<div class="container">
			<div class="row">
				Single Cool Facts Area
				<div class="col-12 col-sm-6 col-lg-3"></div>
			</div>
		</div>
	</section>
	##### Cool Facts Area End #####

	##### Footer Area Start #####
	<footer class="footer-area">
		<div></div>
	</footer>
	##### Footer Area End ##### -->



</body>

</html>
