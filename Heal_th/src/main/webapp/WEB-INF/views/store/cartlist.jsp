<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%@include file="../layout/header.jsp" %>

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#btnList").click(function() {
		location.href = "/store/list"
	})
})



function del(prodNo){
	
	console.log("삭제버튼 클릭" + prodNo);

	document.location.href="/cart/cartDelete?prodNo="+ prodNo

}




	
</script>

<style>
 table tr  th {
 border: 1px solid #ccc;
 margin-right: 25%;
 margin-left: 25%;
 }
 
 
.list{
	 margin-right: 25%;
 	margin-left: 25%;
 	text-align: center;
}

</style>

<body>
<h1>장바구니 목록</h1>



<div class="list">
<table border="1" >
<tr>
	<th style="width: 25%;">상품 번호</th>
	<th style="width: 25%;">상품이름</th>
	<th style="width: 25%;">상품가격</th>
	<th style="width: 25%;">상품 수량</th>
	<th></th>
</tr>
<c:forEach var="cartlist" items="${cartlist}">
<tr>
	<td>${cartlist.prodNo }</td>
	<td>${cartlist.pName }</td>
	<td>${cartlist.pPrice }</td>
	<td>${cartlist.cartStock }</td>
	<td><button type="button" id="btnDelete" class="btn" onclick="del(${cartlist.prodNo })">삭제</button></td>
</tr>
</c:forEach>
</table>
</div>

<br>




<h1>
cartlist 테스트

	<button type="button" id="btnList" class="btn btn-default btn-lg" >목록으로 돌아가기</button>	
</h1>

</body>
</html>