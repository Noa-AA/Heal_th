<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../layout/adminheader.jsp" />

<script type="text/javascript">
$(document).ready(function () {
	let eResult = '<c:out value="${enroll_result}"/>';
	checkResult(eResult);
	function checkResult(result) {
		if(result ==''){
			return;
		}
		alert("상품 ' "+eResult+" '을 등록하였습니다.");
	}
	
})

$(document).ready(function() { 
	
	$("#btnEnroll").click(function() {
		$(location).attr("href", "./enroll")
	})
})
</script>
</script>
<style type="text/css">
h1{text-align: center;}

</style>

<body>

<h1>상품 목록</h1>
<div class="container">
<table class="table table-hover">
<thead>
	<tr>
		<th style="width: 10%;">카테고리</th>
		<th style="width: 10%;">상품번호</th>
		<th style="width: 15%;">이미지</th>
		<th style="width: 30%;">상품명</th>
		<th style="width: 10%;">상품가격</th>
		<th style="width: 15%;">등록일</th>
		<th style="width: 10%;">재고수량</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${list }" var="product">
	<tr>
		<td>${product.pCateNo }</td>
		<td>${product.prodNo }</td>
		<td>${product.pImage1 }</td>
		<td><a href="/product/view?prodNo=${product.prodNo }" >${product.pName }</td>
		<td>${product.pPrice }</td>
		<td><fmt:formatDate value="${product.pDate }" pattern="yyyy-MM-dd" /></td>
		<td>${product.pStock }</td>
	</tr>
</c:forEach>
</tbody>
</table>
<hr>

<button id="btnEnroll">상품등록</button>
</div>
<%@include file="../layout/paging.jsp" %>
</body>
</html>




