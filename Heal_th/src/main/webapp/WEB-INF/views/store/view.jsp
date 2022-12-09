<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../layout/header.jsp" %>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#btnList").click(function() {
		location.href = "/store/list"
	})
})
</script>
<script type="text/javascript">
$(document).ready(function() {
$(".addCart_btn").click(function(){
	console.log("addCart_btn click")
// 	   var prodNo = $("#prodNo").val();
// 	   var cartStock = $(".cart_stock").val();
// 	   var data = {
// 			     prodNo : prod_no,
// 			     cartStock : cart_stock
// 			     };
	   $.ajax({
		    type : "post", 
		    url : "/store/cart",
		    data : {},
		    success : function(result){
		     alert("카트 담기 성공");
		     $(".cart_stock").val("1");
		    },
		    error : function(){
		     alert("카트 담기 실패");
		    }
		   });
	});
});
</script>



<h1>상품 상세보기</h1>
<hr>

<!-- <div layout:fragment="content" style="margim-left:25%;margin-right:25%"> -->
<div style="margim-left:25%;margin-right:25%">

<table class="table table-bordered">

<tr>
	<td class="info">상품번호</td><td colspan="3">${viewStore.prodNo }</td>
</tr>
<tr>
	<td class="info">상품명</td><td>${viewStore.pName }</td>
	<td class="info">가격</td><td>${viewStore.pPrice }</td>
</tr>
<tr>
	<td class="info">등록일</td><td><fmt:formatDate value="${viewStore.pDate }" pattern="yy-MM-dd HH:mm:ss"/></td>
</tr>

<tr>
	<td class="info" colspan="4">상품 상세설명</td>
</tr>
<tr>
	<td colspan="4">${viewStore.pDetail }</td>
</tr>
</table>
		</div>	





<div class="text-center">
	<button id="btnList" class="btn btn-default">목록</button>
</div>

<div class="text-center">
	<button id="btnList" class="btn addCart_btn">장바구니에 담기</button>
</div>

</body>
</html>