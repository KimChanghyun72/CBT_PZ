<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="paging" type="common.Paging" %>
<%@ attribute name="jsfunc" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="pagination">
<p align="center">
<c:if test="${paging.startPage>1}">
	<button onclick= "location.href='javascript:${jsfunc}(${paging.startPage-1})'" class="btn btn-sm btn-primary">이전</button>
</c:if>
<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i">
	<c:if test="${i != paging.page}">
		<button onclick= "location.href='javascript:${jsfunc}(${i})'" class="btn btn-sm btn-primary">${i}</button>
	</c:if>
	<c:if test="${i == paging.page}">
		<button class="btn btn-sm btn-primary">${i}</button>
	</c:if>
</c:forEach>
<c:if test="${paging.endPage<paging.totalPageCount}" >
	<button onclick= "location.href='javascript:${jsfunc}(${paging.endPage+1})'" class="btn btn-sm btn-primary">다음</button>
</c:if>
</p>
</div>