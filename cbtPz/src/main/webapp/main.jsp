<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
 
 <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.3.2/main.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/fullcalendar@5.3.2/main.css" rel="stylesheet">


<script>

 document.addEventListener('DOMContentLoaded', function() {
	  var calendarEl = document.getElementById('calendar');

	  var calendar = new FullCalendar.Calendar(calendarEl, {
	    initialView: 'dayGridMonth',
	    initialDate: '2020-09-07',
	    headerToolbar: {
	      left: 'prev',
	      center: 'title',
	      right: 'next today'
	    },
	    events: [
	      {
	        title: 'All Day Event',
	        start: '2020-09-01'
	      },
	      {
	        title: 'Long Event',
	        start: '2020-09-07',
	        end: '2020-09-10'
	      },
	      {
	        groupId: '999',
	        title: 'Repeating Event',
	        start: '2020-09-09T16:00:00'
	      },
	      {
	        groupId: '999',
	        title: 'Repeating Event',
	        start: '2020-09-16T16:00:00'
	      },
	      {
	        title: 'Conference',
	        start: '2020-09-11',
	        end: '2020-09-13'
	      },
	      {
	        title: 'Meeting',
	        start: '2020-09-12T10:30:00',
	        end: '2020-09-12T12:30:00'
	      },
	      {
	        title: 'Lunch',
	        start: '2020-09-12T12:00:00'
	      },
	      {
	        title: 'Meeting',
	        start: '2020-09-12T14:30:00'
	      },
	      {
	        title: 'Birthday Party',
	        start: '2020-09-13T07:00:00'
	      },
	      {
	        title: 'Click for Google',
	        url: 'http://google.com/',
	        start: '2020-09-28'
	      }
	    ]
	  });

	  calendar.render();
	});
 
</script>

</head>

<body>
 


    <!-- ##### Hero Area Start ##### -->
    <section class="hero-area bg-img bg-overlay-2by 5">
	<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
      <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner" role="listbox">
        <!-- Slide One - Set the background image for this slide in the line below -->
        <div class="carousel-item active" style="background-image: url(./img/computer1920.jpg)">
          <div class="carousel-caption d-none d-md-block">
            <h3>First Slide</h3>
            <p>This is a description for the first slide.</p>
          </div>
        </div>
        <!-- Slide Two - Set the background image for this slide in the line below -->
        <div class="carousel-item" style="background-image: url(img/bg-img/bg1.jpg)">
          <div class="carousel-caption d-none d-md-block">
            <h3>Second Slide</h3>
            <p>This is a description for the second slide.</p>
          </div>
        </div>
        <!-- Slide Three - Set the background image for this slide in the line below -->
        <div class="carousel-item" style="background-image: url(./img/architect1920.jpg)">
          <div class="carousel-caption d-none d-md-block">
            <h3>Third Slide</h3>
            <p>This is a description for the third slide.</p>
          </div>
        </div>
      </div>
      <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
    
	<!-- <section class="popular-courses-area section-padding-100-0"> -->
	<section class="blog-area blog-page section-padding-100">
                <!-- Single Blog Area -->
		
			<div class="row">
				<div class="col-12 col-lg-6">
				<!-- 공지사항 캘린더 ㅓ넣을꺼임 -->
                    <div class="single-blog-area mb-100 wow fadeInUp" data-wow-delay="250ms">
                        <img src="img/blog-img/1.jpg" alt="">
                        <!-- Blog Content -->
                        <div class="blog-content">
                            <a href="#" class="blog-headline">
                                <h4>English Grammer</h4>
                            </a>
                            <div class="meta d-flex align-items-center">
                                <a href="#">Sarah Parker</a>
                                <span><i class="fa fa-circle" aria-hidden="true"></i></span>
                                <a href="#">Art &amp; Design</a>
                            </div>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce enim nulla, mollis eu metus in, sagittis</p>
                        </div>
                    </div>
                </div>

                <!-- Single Blog Area -->
                <div class="col-12 col-lg-6">
                    <div class="single-blog-area mb-100 wow fadeInUp" data-wow-delay="500ms">
          <div id='calendar'></div>
                    </div>
                </div>

            </div>
					<div class="section-heading">
						<h3>Popular Online Courses</h3>

	</section>

	<section class="popular-courses-area section-padding-100-0">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="section-heading">
						<h3>Popular Online Courses</h3>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="popular-courses-area section-padding-100-0">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="section-heading">
						<h3>Popular Online Courses</h3>
					</div>
				</div>
			</div>
		</div>
	</section>
    </section>
    <!-- ##### Hero Area End ##### -->





    <!-- ##### Cool Facts Area Start ##### -->
    <section class="cool-facts-area section-padding-100-0">
        <div class="container">
            <div class="row">
                <!-- Single Cool Facts Area -->
                <div class="col-12 col-sm-6 col-lg-3">
                    dfdfdf
                </div>
            </div>
        </div>
    </section>
    <!-- ##### Cool Facts Area End ##### -->

    <!-- ##### Footer Area Start ##### -->
    <footer class="footer-area">
		<div>footer</div>
    </footer>
    <!-- ##### Footer Area End ##### -->

 

</body>

</html>
