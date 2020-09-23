<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- jQuery -->

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>board.jsp</title>
<script>
/*-----------------------댓글 리스트 출력 기능 --------------------- */
$(function(){
	function boardList(){
		$.ajax("./commentList.do",{
			dataType : "json",
			data:{board_id : "${board.board_id}"},
			success : function(datas){
				for(i=0; i<datas.length; i++){
					$("<div>")
							.append(datas[i].comment_poster).append($("<br>"))
							.append(datas[i].comment_contents)
							.data("comment_id", datas[i].comment_id)
							.append($("<a href='javascript:void(0)'>").html("삭제").addClass("btnDel"))
							.appendTo($("#list"))
				}
			}
		
		})}

	boardList();// 댓글리스트 바로 실행
	
/*-----------------------댓글 삭제 버튼 기능 --------------------- */	
	$("#list").on("click",".btnDel", function(){
		comment_id = $(this).parent().data("comment_id");
		div = $(this).parent();
		$.ajax("./commentDelete.do", {
			method : "get",
			dataType : "json",
			data : {comment_id : comment_id},//"no="+no + "&name=" + name 
			success : function(data){
				alert("댓글이 삭제되었습니다.");
				div.remove();
			}
		});
	});
/*-----------------------댓글 저장 버튼 기능 --------------------- */	
		 $("#btnSave").on("click", function(){
				$.ajax("./commentInsert.do", {
					dataType:"json",
					data : $("form").serialize(),
					success : function(data){
						$("<div>")
						.append(data.comment_poster).append($("<br>"))
						.append(data.comment_contents)
						.data("comment_id", data.comment_id)
						.append($("<a href='javascript:void(0)'>").html("삭제").addClass("btnDel"))
						.appendTo($("#list"))
					}
				});
			}) 
			
		});	
</script>	
<style>
body {

	padding-top: 70px;

	padding-bottom: 30px;

}

.board_title {

	font-weight : 700;

	font-size : 22pt;

	margin : 10pt;

}

.board_info_box {

	color : #6B6B6B;

	margin : 10pt;

}

.board_member_id {

	font-size : 10pt;

	margin-right : 10pt;

}

.board_date {

	font-size : 10pt;

}

.board_content {

	color : #444343;

	font-size : 12pt;

	margin : 10pt;

}
</style>

</head>
<body>
<article>

		<div class="container" role="main">

			<h2 align="right" onclick="location.href='boardList.do'">자유게시판</h2>
			
			<div class="bg-white rounded shadow-sm">

				<div class="board_title"><c:out value="${board.board_title}"/></div>

				<div class="board_info_box">

					<span class="board_member_id">작성자: <c:out value="${board.member_id}"/>,</span><span class="board_date"><c:out value="${board.board_date}"/></span>

				</div>
				
				<div class="board_content">${board.board_contents}</div>

				</div>
			<div style="margin-top : 20px">
			 <p align="right">	
				<button type="button" onclick="location.href='boardUpdateForm.do?board_id='+${board.board_id}" class="btn btn-sm btn-primary" id="btnUpdate">수정</button>

				<button type="button" onclick="location.href='boardDelete.do?board_id='+${board.board_id}" class="btn btn-sm btn-primary" id="btnDelete">삭제</button>

				<button type="button" onclick="location.href='boardList.do'" class="btn btn-sm btn-primary" id="btnList">목록</button>
			</p>
			</div>
		<div data-id="4" data-goods="book" id="divid"></div>

<!---------------------댓글 입력폼------------------------->
<div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top: 10px">
<form>
<div class="row">
<div class="col-sm-10">
<textarea class="form-control" rows="3" placeholder="댓글을 입력해 주세요" name="comment_contents"></textarea>
</div>
<div class="col-sm-2">
	<input type="text" class="form-control" name="comment_poster" placeholder="작성자"/>
	<input type="hidden" name="board_id" value="${board.board_id}"/>
	<button type="button" class="btn btn-sm btn-primary" name="btnSave" style="width: 100%; margin-top: 10px" id="btnSave">저장</button>
</div>
</div>
</form>
</div>

<!--------------------댓글 리스트------------------------>
	<div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top: 10px">			
	<h6 class="border-bottom pb-2 mb-0">Reply list</h6>
	<div id="list"></div>
	</div>
<!--------------------댓글 리스트------------------------>			
		</div>
	</article>
</body>
</html>