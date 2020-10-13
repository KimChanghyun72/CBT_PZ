<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board.jsp</title>
<script>

	function inputCheck() {
		
		if (frm1.comment_poster.value == "") {
			window.alert("회원전용 입니다.");
			frm1.comment_poster.focus();
			return;
			
		}
		if (frm1.comment_contents.value == "") {
			window.alert("댓글을 입력하세요.");
			frm1.comment_contents.focus();
			return;
			
		}else {		
			$.ajax("${pageContext.request.contextPath}/ajax/commentInsert.do", {
				dataType:"json",
				data : $("form").serialize(),
				success : function(data){
					$("#text").val("")
					var del = "";
					if(data.comment_poster =="${sessionScope.login.member_id}"){
						del=$("<a style='color:#007bff;'>").html("삭제").addClass("btnDel")
					}
					$("<div>").append($("<b>").append(data.comment_poster))
					.append($("<br>"))
					.append(data.comment_contents)
					.data("comment_id", data.comment_id)
					.append("&emsp;")
					.append(del)
					.append($("<h6 class='border-bottom pb-2 mb-0'/>"))
					.appendTo($("#list"))
				}
			});
		}
	}

/*-----------------------댓글 리스트 출력 기능 --------------------- */
$(function(){
	function boardList(){
		$.ajax("${pageContext.request.contextPath}/ajax/commentList.do",{
			dataType : "json",
			data:{board_id : "${board.board_id}"},
			success : function(datas){
				for(i=0; i<datas.length; i++){
							var del = "";
							if(datas[i].comment_poster =="${sessionScope.login.member_id}"){
								del=$("<a style='color:#007bff;'>").html("삭제").addClass("btnDel")
							}
					
					$("<div>").append($("<b>").append(datas[i].comment_poster))
							.append($("<br>"))
							.append(datas[i].comment_contents)
							.data("comment_id", datas[i].comment_id)
							.append("&emsp;")
							.append(del)
							.append($("<h6 class='border-bottom pb-2 mb-0'/>"))
							.appendTo($("#list"))
				}
			}
		
		})}

	boardList();// 댓글리스트 바로 실행
	
/*-----------------------댓글 삭제 버튼 기능 --------------------- */	
	$("#list").on("click",".btnDel", function(){
		comment_id = $(this).parent().data("comment_id");
		div = $(this).parent();
		$.ajax("${pageContext.request.contextPath}/ajax/commentDelete.do", {
			method : "get",
			dataType : "json",
			data : {comment_id : comment_id},//"no="+no + "&name=" + name 
			success : function(data){
				alert("댓글이 삭제되었습니다.");
				div.remove();
			}
		});
	});
});

</script>

<style>
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
	<!-- 자유게시판 상세조회 페이지  -->
<article>

		<div class="container" role="main">

				<br><br>
			<input type="hidden" id="title" value="자유게시판">
			
			<div class="bg-white rounded shadow-sm">

				<div class="board_title"><c:out value="${board.board_title}"/></div>

				<div class="board_info_box">

					<span class="board_member_id">작성자: <c:out value="${board.member_id}"/></span><span class="board_date"><c:out value="${board.board_date}"/></span>

				</div>
				
				<div class="board_content">${board.board_contents}</div>
				<c:if test="${board.board_file != null}">
				<div class="board_file"><img src="${pageContext.request.contextPath}/filenameDownload.do?board_file=${board.board_file}" style="width:500px"/></div>
				</c:if>	
				</div>
			<div style="margin-top : 20px">
			 <p align="right">	
				<c:if test="${sessionScope.login.member_id == board.member_id}">
				<button type="button" onclick="location.href='${pageContext.request.contextPath}/board/boardUpdateForm.do?board_id='+${board.board_id}" class="btn btn-sm btn-primary" id="btnUpdate">수정</button>
				<button type="button" onclick="location.href='${pageContext.request.contextPath}/board/boardDelete.do?board_id='+${board.board_id}" class="btn btn-sm btn-primary" id="btnDelete">삭제</button>
				</c:if>
				<button type="button" onclick="location.href='${pageContext.request.contextPath}/board/boardList.do'" class="btn btn-sm btn-primary" id="btnList">목록</button>
			</p>
			</div>
		<div data-id="4" data-goods="book" id="divid"></div>

<!---------------------댓글 입력폼------------------------->
<div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top: 10px">
<form id="frm1" name="frm1" >
<div class="row">
<div class="col-sm-10">
<textarea class="form-control" rows="3" placeholder="댓글을 입력해 주세요" id = "text" name="comment_contents"></textarea>
</div>
<div class="col-sm-2">
	<input type="text" class="form-control" id="comment_poster" name="comment_poster" value="${sessionScope.login.member_id}" readonly="readonly"/>
	<input type="hidden" name="board_id" value="${board.board_id}"/>
	<button type="button" onclick="inputCheck()"  class="btn btn-sm btn-primary" name="btnSave" style="width: 100%; margin-top: 10px" id="btnSave">저장</button>
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