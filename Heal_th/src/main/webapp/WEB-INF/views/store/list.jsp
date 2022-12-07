<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../layout/header.jsp" %>

<!-- <div class="rewards-container"> -->
<!-- 	<a href="/store/view"> -->
<!-- 		<div class="thumbnail"> -->
<!-- 			<div onclick=""> -->
<!-- 			</div> -->
<!-- 			<div class="like-ani-default like-ani-6359">♥</div> -->
<!-- 			<div class="like-section like-section-6359" onclick="Landing.clickLike(6359)"> -->
<!-- 			<span id="likeCount">50</span> -->
<!-- 			" ♥ " -->
<!-- 		</div> -->
<!-- 		</div> -->
<!-- 	<input type="hidden" name="csrftoken" id="csrftoken" value="957ef7cb-4e22-401c-afd8-31a5d3db2cfc" /> -->
<!-- 	</a> -->


<h1>게시판 리스트</h1>
<hr>

<table class="table table-striped table-hover table-condensed">
<thead>
	<tr>
		<th style="width: 10%;">상품번호</th>
		<th style="width: 45%;">상품명</th>
		<th style="width: 20%;">가격</th>
		<th style="width: 10%;">조회수</th>
		<th style="width: 15%;">등록일</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${list }" var="StoreDto">
	<tr>
		<td>${StoreDto.prodNo }</td>
		<td><a href="/store/view?prodNo=${StoreDto.prodNo }">${Store.pName }</a></td>
		<td>${StoreDto.pPrice }</td>
		<td>${StoreDto.pHit }</td>
		<td><fmt:formatDate value="${StoreDto.pDate }" pattern="yy-MM-dd HH:mm:ss"/></td>
	</tr>
</c:forEach>
</tbody>
</table>



</div>
</body>
</html>