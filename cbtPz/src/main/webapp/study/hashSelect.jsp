<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
 	<meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <!-- Title -->
    <title>hash select</title>

    <!-- Favicon -->
    <link rel="icon" href="./img/core-img/favicon.ico">

    <!-- Stylesheet -->
    <link rel="stylesheet" href="./style.css">
    
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    
<script>
$(function(){
	$("#testInput").autocomplete({
		source : function(request, response) {
			$.ajax({
				url : "${pageContext.request.contextPath}/hashtagSearch.do",
				type : "GET",
				dataType : "json",
				data : {data : $("#testInput").val()},	 // 검색 키워드
				success : function(data) { // 성공
					response($.map(data, function(item) {
							return {
								label : item.hashtag_name, //목록에 표시되는 값
								value : item.hashtag_name, //선택 시 input창에 표시되는 값	
								idx : item.testIdx};
					})); //response
				},//success
				error : function() { //실패
					//alert("통신에 실패했습니다.");
				}
			});
		},
		minLength : 1,
		autoFocus : false,
		select : function(evt, ui) {
			console.log("전체 data: " + JSON.stringify(ui));
			console.log("db Index : " + ui.item.idx);
			console.log("검색 데이터 : " + ui.item.value);
		},
		focus : function(evt, ui) {
		return false;
		},
		close : function(evt) {
		}
	});
});
</script>
</head>
<style>    
	.header {
	  padding: 30px;
	  text-align: center;
	  background: white;
	}
	
	.header h1 {
	  font-size: 50px;
	}    
</style>
<body>
 <section class="cool-facts-area section-padding-100-0">
        <div class="container">
			<div class="header"><h1>HashTag</h1></div>
            <div class="row">
                <!-- Single Cool Facts Area -->
                <div class="col-12 col-sm-6 col-lg-3">
                    <div class="single-cool-facts-area text-center mb-100 wow fadeInUp" data-wow-delay="250ms">
	                    <!-- Search Button -->
	                    <div class="search-area">
	                        <form action="${pageContext.request.contextPath}/hashtagSearch.do">
	                            <input type="text"  id="testInput"  placeholder="Search" />  
	  	                        <!-- <input type="search" name="hashtag_name" id="testInput"  placeholder="Search">-->
	                            <!-- value="${param.hashtag_name} -->
	                            <button type="submit"><i class="fa fa-search" aria-hidden="true"></i></button>
	                        </form>
	                    </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <c:forEach items="${hashSelect}" var="hashSelect">	
			문제:${hashSelect.problem_text} <br>	
			${hashSelect.ans_1}<br>
			${hashSelect.ans_2}<br> 
			${hashSelect.ans_3}<br> 
			${hashSelect.ans_4}<br>
			정답:${hashSelect.ans_correct}<br>        
			해설:${hashSelect.haeseol}<br>
			<br><br> 
	</c:forEach>
</body>
</html>