<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
function ckdel() {
    var chk_obj = document.getElementsByName("chkDelete");
    var chk_leng = chk_obj.length;
    var checked = 0;
    for (i=0; i < chk_leng; i++) {
        if (chk_obj[i].checked == true) {
            checked += 1;
        }
    }
    if (checked < 1 ) {
        alert("삭제할 게시물을 선택해주십시오.");
        return;
    }

    if (confirm ("삭제하시겠습니까?")) {
    	frm.submit();
    	
    }
}
      

</script>

</head>
<body>
	<%request.getSession().setAttribute("pageName","나의 작성글"); %>
	<article>
		<div class="container">
			<div class="table-responsive">
				<br> <br>
				<form action="/cbtPz/mypage/myInputDel.do" name="frm">
					<table class="table table-hover">
						<thead>
							<tr align="center">
								<!-- <th></th> -->
								<th>NO</th>
								<th>제목</th>
								<th>작성자</th>
								<th>조회수</th>
								<th>작성일</th>
								<th></th>
							</tr>
						</thead>
						<tbody align="center">
							<c:choose>
								<c:when test="${empty board_list}">
									<tr>
										<td colspan="6" align="center">데이터가 없습니다.</td>
									</tr>
								</c:when>
								<c:when test="${!empty board_list}">
									<c:forEach items="${board_list}" var="board">
										<tr>

											<td>${board.board_id}</td>
											<td><a href="myInputSelect.do?board_id=${board.board_id}">${board.board_title}</a></td>
											<td>${board.member_id}</td>
											<td>${board.board_views}</td>
											<td>${board.board_date}</td>
											<td><input type="checkbox" id="" name="chkDelete"
												value="${board.board_id}"></td>
										</tr>

									</c:forEach>
								</c:when>
							</c:choose>

						</tbody>

					</table>
					<p align="right">
					<button type="button" onclick="ckdel()" class="btn btn-sm btn-primary">삭제</button>
					</p>
				</form>

				<!-- 페이징 처리 영역 -->
				<my:paging paging="${paging}" jsfunc="gopage" />
				<script>
					function gopage(p) {
						location.href = "${pageContext.request.contextPath}/mypage/myInput.do?p="
								+ p;
					};
				</script>
				<!-- 페이징 처리 영역 -->
			</div>
		</div>

	</article>
</body>
</html>