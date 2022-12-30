<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />


<!-- 페이지 이동 인터페이스 영역 -->
<div class="pageMaker_wrap" >

	<ul class="pageMaker">
	 
			<!-- 이전페이지 버튼 -->
			<c:if test="${page.prev}">
				<li class="pageInfo_btn previous"><a href="${page.pageStart - 1}">Previous</a></li>
			</c:if>
			
			<!-- 각 번호 페이지 버튼 -->
			<c:forEach var="num" begin="${page.pageStart}" end="${page.pageEnd}">
				<li class="pageInfo_btn ${page.cri.pageNum == num ? 'active':'' }"><a href="${num}">${num}</a></li>
			</c:forEach>
			
			<!-- 다음페이지 버튼 -->
			<c:if test="${page.next}">
				<li class="pageInfo_btn next"><a href="${page.pageEnd + 1 }">Next</a></li>
			</c:if>	
	 	
	 </ul>
 
</div>
