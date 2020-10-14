<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	<%request.getSession().setAttribute("pageName", "일정 관리");%>
</script>
<script
	src="https://cdn.jsdelivr.net/npm/fullcalendar@5.3.2/main.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/fullcalendar@5.3.2/main.css"
	rel="stylesheet">
<script>
	document.addEventListener('DOMContentLoaded',
		function() {
			var calendarEl = document.getElementById('calendar');

			var calendar = new FullCalendar.Calendar(calendarEl,
								    {
									initialView : 'dayGridMonth',
									headerToolbar : {
														center : 'addEventButton'
													},
									customButtons  : {
									addEventButton :  {
															text : 'add event...',
															click : function(info) {
																		var Str = prompt('Enter a event');
																		var dateStr = prompt('Enter a date in YYYY-MM-DD format');
																		  $.ajax({										 
																			url : '${pageContext.request.contextPath}/ajax/scheduler.do',
																			type : 'POST',
																			dataType : 'json',
																			data : { 
																				title : Str,
																				start : dateStr
																			},
																			success : function(scheduler) {
																			}
															
																				});   
																		var date = new Date(dateStr + 'T00:00:00');
																		if (!isNaN(date.valueOf())) {
																			calendar
																					.addEvent({
																						title : Str,
																						start : dateStr,
																						allDay : false
																					});
																			alert('Great. Now, update your database...');
																		} else {
																			alert('Invalid date.');
																		}
																}
															}
														},
									eventSources : [
														{
														url : '${pageContext.request.contextPath}/ajax/schedulerList.do',
														data: function() { return }
														//color : 'yellow',
														//timeZone : 'UTC'
														//editable : true,
														//selectable : true,
														}
													],
														displayEventTime: false
									});
						
							calendar.render();
					});
	
</script>
</head>

<body>
<br><br>
	<div class="regular-page-area">
		<div class="container">
			
				<div class="col-12">
					<div class="page-content">
						<br><br>
							<div class="single-blog-area mb-100 wow fadeInUp"
								data-wow-delay="500ms">
								<div id='calendar'></div>
							</div>
						
					</div>
					<div class="single-course-content section-padding-100"></div>
				</div>
			
		</div>
	</div>
</body>
</html>