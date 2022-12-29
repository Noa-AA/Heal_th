<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- <script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script> -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach items="${scrapList }" var="scrap">
	<div id="scrapOne">
		<span>${scrap.categoryName } 게시판</span>
			<c:choose>
				<c:when test="${scrap.categoryNo eq 1}"> <!-- bf 게시판 -->
					<a href="/board/bfView?bfNo=${scrap.boardNo}"> ${scrap.title }</a>
				</c:when>
				<c:when test="${scrap.categoryNo eq 2}"> <!-- 운동인증 게시판 -->
					<a href="/board/verifyView?verifyNo=${scrap.boardNo}"> ${scrap.title }</a>
				</c:when>
				<c:when test="${scrap.categoryNo eq 3}"> <!-- 식단공유 게시판 -->
					<a href="/board/dView?dietNo=${scrap.boardNo}"> ${scrap.title }</a>
				</c:when>
				<c:otherwise>	<!-- 후기, 시설리뷰 게시판 -->
					<a href="/board/rView?reviewNo=${scrap.boardNo}"> ${scrap.title }</a>
				</c:otherwise>
			</c:choose>
			<button class="scrapDelete" value="${scrap.scrapNo}">삭제</button>
	</div>
</c:forEach>
<c:choose>
	<c:when test="${scrapEmpty eq false }">
		<div id="scrapEmpty">
			<p>스크랩 목록이 존재하지 않습니다</p>
		</div>
	</c:when>
</c:choose>
    