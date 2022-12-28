<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />


<!-- 페이지 이동 인터페이스 영역 -->
<div class="pageMaker_wrap" >

	<ul class="pageMaker">
	 
	 	<!-- 이전 버튼 -->
		<c:if test="${pageMaker.prev}">
		<li class="pageMaker_btn prev">
			<a href="${pageMaker.pageStart - 1}">이전</a>
		</li>
		</c:if>
		
		<!-- 페이지 번호 -->
		<c:forEach begin="${pageMaker.pageStart}" end="${pageMaker.pageEnd}" var="num">
		<li class="pageMaker_btn ${pageMaker.cri.pageNum == num ? "active":""}">
		<a href="${num}">${num}</a>
		</li>
		</c:forEach>
		
		<!-- 다음 버튼 -->
		<c:if test="${pageMaker.next}">
		<li class="pageMaker_btn next">
			<a href="${pageMaker.pageEnd + 1 }">다음</a>
		</li>
		</c:if>
	 	
	 </ul>
 
</div>
