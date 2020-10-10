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

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="fancymetags.jQuery.js"></script>
    

<style>    
	.center {
	  padding: 30px;
	  text-align: center;
	  background: white;
	}
	
	.header h1 {
	  font-size: 50px;
	}    
	
	ul {
        padding: 16px 0;
    }

    ul li {
        display: inline-block;
        margin: 0 5px;
        font-size: 14px;
        letter-spacing: -.5px;
    }
    
    form {
        padding-top: 16px;
    }

    ul li.tag-item {
        padding: 4px 8px;
        background-color: #5F8AF8;
        color: #fff;
    }

    .tag-item:hover {
        background-color: #70E0F1;
        color: #fff;
    }

    .del-btn {
        font-size: 12px;
        font-weight: bold;
        cursor: pointer;
        margin-left: 8px;
    }
	
</style>

    
<script>  
$(document).on("click", ".del-btn", function (e) {
    var index = $(this).attr("idx");    
    $(this).parent().remove();
});


$(function(){
	$(document).on("click", "#hashbtn", function () {
		var list = $(".tag-item")
		var listAry = "";
		for(i=0; i<list.length; i++) {
			listAry += "\'"+ $(list[i]).find(".hashtext").html()+"\',";
			$("#hashlist").val(listAry);
		}
		console.log(listAry);
		$("#hash").submit();
	});
	
	$("#testInput").autocomplete({
		source : function(request, response) {
			$.ajax({
				url : "${pageContext.request.contextPath}/ajax/hashtagAutoSearch.do",
				type : "GET",
				dataType : "json",
				data : {hashtag_name : $("#testInput").val()},	 // 검색 키워드
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
			
			$("#tag-list").append("<li class='tag-item'><span class='hashtext'>"+ui.item.value+"</span><span class='del-btn' idx='"+ui.item.idx+"'>x</span></li>");
			console.log("전체 data: " + JSON.stringify(ui));
			console.log("db Index : " + ui.item.idx);
			console.log("검색 데이터 : " + ui.item.value);
		},
		focus : function(evt, ui) {
		return false;
		},
		close : function(evt) {
			$("#testInput").val("");
		}
	});

});

</script>
<script>

</script>
</head>

<body>
<% request.getSession().setAttribute("pageName", "HashTag"); %>
 <section class="cool-facts-area section-padding-100-0">
        <div class="container">
			<!-- <div class="center"><h1>HashTag</h1></div> -->
            <div class="row">
                <!-- Single Cool Facts Area -->
                <div class="col-12 col-sm-6 col-lg-3">
                    <div class="single-cool-facts-area text-center mb-100 wow fadeInUp" data-wow-delay="250ms">
	                    <!-- Search Button -->
	                    <div class="search-area">
	                       	<form>
	  	                        <input type="text" id="testInput"  placeholder="Search" >
	                            <button type="button"><i class="fa fa-search" aria-hidden="true"></i></button>
	                        </form>
	                    </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
     
    <div class="center">
    <ul id="tag-list"></ul>
    <form id="hash" action="${pageContext.request.contextPath}/hashtagSelect.do">
	    <input type="hidden" id="hashlist" name="hashtag_name">
	    <input type="button" value="제출" id="hashbtn">
    </form>
	</div>
</body>
</html>