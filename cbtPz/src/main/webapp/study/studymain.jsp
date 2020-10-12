<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">		
<title>Insert title here</title>
<style>
	.area:hover,
	.area:focus {
	color: #fff;
	background-color: #53A3CD;
	border-color: #53A3CD;
	
}

</style>
<script>
</script>
</head>
<% request.getSession().setAttribute("pageName", "학습하기-메인"); %>
<body>
 <section class="contact-area">
        <div class="container">
            <div class="row">
                <!-- 기출문제 -->
                	<div class="col-12 col-lg-6" >
                	<a href="${pageContext.request.contextPath}/study/haederSearch.do?paper_type_cd=기출">
                    	<div class="area contact--info mt-30 mb-25" style="text-align : center">
                        	<br><br><br>
                			<form action = "${pageContext.request.contextPath}/study/haederSearch.do">
                				<input type="hidden" name="paper_type_cd" value="기출">
                        	<!-- <button name="paper_type_cd" value="모의">기출문제</button> -->
                			</form>
                        	<h1 class="submit">기출문제</h1>
                        	<br><br><br>
                    	</div>
                    	</a>
                	</div>
                <!-- 모의고사 -->
                	<div class="col-12 col-lg-6">
                	<a href="${pageContext.request.contextPath}/study/haederSearch.do?paper_type_cd=모의">
                    	<div class="area contact--info mt-30 mb-25" style="text-align : center">
                        	 <br><br><br>
                        	 <form action = "${pageContext.request.contextPath}/study/haederSearch.do">
                        	 	<input type="hidden" name="paper_type_cd" value="모의">
                        	<!--  <div><button name="paper_type_cd" value="기출">모의고사</button></div> -->
                     	    	<h1 class="submit">모의고사</h1>
                     	    </form>
                        	<br><br><br>
                    	</div>
                    	</a>
                	</div>
                
                <!-- 과목별 -->
                	<div class="col-12 col-lg-6">
                	<a href="${pageContext.request.contextPath}/study/subjectSearch.do">
                    	<div class="area contact--info mt-30 mb-25" style="text-align : center">
                         	<br><br><br>
                			<form action ="${pageContext.request.contextPath}/study/subjectSearch.do">
                        	<%-- <a href="${pageContext.request.contextPath}/study/subjectSearch.do"></a> --%>
                        		<input type="hidden" name="subject" value="subject">
                        	
                        	<h1 class="submit">과목별</h1>
                			</form>	
                        	<br><br><br>
                    	</div>
                    	</a>
                	</div>
                <!-- 해시태그 -->
                	<div class="col-12 col-lg-6">
                	<a href="${pageContext.request.contextPath}/study/hashtagPage.do">
                    	<div class="area contact--info mt-30 mb-25" style="text-align : center">
                    	<br><br><br>
                    		<!-- <div><button name="subject" value="subject">과목별</button></div> -->
                        	<h1>태그별</h1>
                        <br><br><br>
                    	</div>
                    	</a>
                	</div>
                
     		 </div>
        </div>
    </section>
  
<form action = "${pageContext.request.contextPath}/study/haederSearch.do">
		<div><button name="paper_type_cd" value="모의">모의고사</button></div>
		<div><button name="paper_type_cd" value="기출">기출문제</button></div>
</form>
		<div><a href="/cbtPz/study/hashtagPage.do"><button name="paper_type_cd" value="태그">태그별</button></a></div>
<form action ="${pageContext.request.contextPath}/study/subjectSearch.do"> 		
		<div><button name="subject" value="subject">과목별</button></div>
</form>		
</body>
</html>