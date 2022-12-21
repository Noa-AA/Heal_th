<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />


<style type="text/css">

/* 페이징 부분 */

.text-center {
	display: flex;
	justify-content: center;
	margin-top: 40px;
}

.pagination {
	display: flex;
	margin: 0;
}

.pagination > li{
	display: flex;
}

.pagination > li > a {
	display: flex;
	margin: 0 4px;
	width: 40px;
	height: 40px;
	border-radius: 20px !important;
	font-size: 16px;
	justify-content: center;
	align-items: center;
}

.none:hover {
	cursor: default;
}


.material-symbols-outlined {
	font-variation-settings:
	'FILL' 0,
	'wght' 400,
	'GRAD' 0,
	'opsz' 48
}

.pagination>li>a, .pagination>li>span {
	color: #999999;
}

.pagination>.active>a,
.pagination>.active>a:focus,
.pagination>.active>a:hover,
.pagination>.active>span,
.pagination>.active>span:focus,
.pagination>.active>span:hover {
	
    border-color: #7ca3f5;
    background-color: #7ca3f5;
    font-weight: 700;

}

.pagination>li>a:focus, .pagination>li>a:hover, .pagination>li>span:focus, .pagination>li>span:hover {
    color: #7ca3f5;
    background-color: #fff;
    border-color: #7ca3f5;
}

</style>



<div class="text-center">
		<ul class="pagination pagination-sm">
	
		<%-- 첫 페이지로 이동 (이동할게 없을때) --%>
		<c:if test="${paging.curPage eq 1 }">
			<li><a class="none"><span class="material-symbols-outlined">keyboard_double_arrow_left</span></a></li>	
		</c:if>
	
		<%-- 첫 페이지로 이동 --%>
		<c:if test="${paging.curPage ne 1 }">
			<li><a href="/notice/list"><span class="material-symbols-outlined">keyboard_double_arrow_left</span></a></li>	
		</c:if>
		
		
		<%-- 이전 페이지로 가기 --%>
		<c:if test="${paging.curPage > 1 }">
			<li><a href="/notice/list?curPage=${paging.curPage - 1 }"><span class="material-symbols-outlined">navigate_before</span></a></li>
		</c:if>
		
		<%-- 이전 페이지로 가기 (이전으로 갈 페이지 없을때)--%>
		<c:if test="${paging.curPage <= 1 }">
			<li><a class="none"><span class="material-symbols-outlined">navigate_before</span></a></li>
		</c:if>
		
			
		<%-- 페이징 리스트 --%>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="i">
		<c:if test="${paging.curPage eq i }">
			<li class="active"><a href="/chat/intro?curPage=${i }">${i }</a></li>
		</c:if>
		<c:if test="${paging.curPage ne i }">
			<li><a href="/notice/list?curPage=${i }">${i }</a></li>
		</c:if>
		</c:forEach>
	
		
		
		<%-- 다음 페이지로 가기 --%>
		<c:if test="${paging.curPage < paging.totalPage }">
			<li><a href="/notice/list?curPage=${paging.curPage + 1 }"><span class="material-symbols-outlined">navigate_next</span></a></li>
		</c:if>
		
		<%-- 다음 페이지로 가기 (다음으로 갈 페이지 없을때) --%>
		<c:if test="${paging.curPage >= paging.totalPage }">
			<li><a class="none"><span class="material-symbols-outlined">navigate_next</span></a></li>
		</c:if>
		
	
		<%-- 끝 페이지로 이동 --%>
		<c:if test="${paging.curPage ne paging.totalPage }">
			<li><a href="/notice/list?curPage=${paging.totalPage }" ><span class="material-symbols-outlined">keyboard_double_arrow_right</span></a></li>	
		</c:if>
		
		</ul><i class="fa-solid fa-chevrons-right"></i>
	</div>