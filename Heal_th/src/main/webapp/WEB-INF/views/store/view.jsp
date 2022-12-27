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



$(document).ready(function(){
	
	
	$("#count").change(function() {
		console.log("수량확인")
		calculateToalPrice();
	});
});

function calculateToalPrice(){ //현재 주문할 수량과 상품 한 개당 가격을 곱해서 결제 금액을 구해주는 함수
	var count =$("#count").val();
	var price =$("#price").val();
	var totalPrice = price*count;
	console.log("함수확인")
	$("#totalPrice").html(totalPrice + '원');
}


/* 바로구매 버튼 */
function order(){
	
	
	
	
	location.href="/store/payment?amount=" + $("#count").val() *$("#price").val()+"&count="+$("#count").val()+"&price="+$("#price").val();
};


// $(".addCart_btn").click(function(){
//  var gdsNum = $("#prodNo").val();
//  var cartStock = $(".numBox").val();
    
//  var data = {
// 		 prodNo : prodNo,
//    cartStock : cartStock
//    };




</script>

<style>

.mgb-15{
	margin-bottom:15px;
}

.mgt-30{
	margin-top:30px;
}
.mgt-50{
	margin-top:50px;
}


.repImgDiv{
	margin-right: 15px;
	height: auto;
	width:50%;
}

.repImg{
width:100%;
height: 400px;
}

.wd50{
	height:auto;
	width:50%;
}

.paymoney{
	margin-right: 25%;
}

</style>



<form>


<!-- <div layout:fragment="content" style="margin-left:25%;margin-right:25%"></div> -->
<div style="margin-left: 25%; margin-right: 25%" class="big">
	<%-- <input type="hidden" id="itemId" th:value="${item.id}"> --%>
	<input type="hidden" id="itemId"><span>${viewStore.pName }</span>
	<div class="d-flex">
		<div class="repImgDiv">
			<!-- 이미지 넣어야함 -->
		</div>


	</div>



	<div class="text-right">
		<div class="h4 text-danger text-left">
			<input type="hidden" value="${viewStore.pPrice}" id="price"name="price"> 
			<span>${viewStore.pPrice}</span>원
		</div>
	</div>




	<div class="input-group w-50">
		<div class="input-group-prepend">
			<span class="input-group-text button_quantity">수량</span>
		</div>
		<input type="number" name="count" id="count" class="form-control"
			value="1" min="1" onchange="calculateToalPrice()">
	</div>
	
	
</div>
<!-- big 종료 -->
<hr class="my-4">
<div class="text-right mgt-50 paymoney">
	<h5>결제금액</h5>
	<h3 class="font-weight-bold"></h3>
</div>
<div class="text-right paymoney">

	<span id="totalPrice"  class="paymoney">${viewStore.pPrice}원</span>
</div>
<div class="text-center">
	<button type="button" class="addCart_btn"><a href="/store/cart?prodNo=${viewStore.prodNo }">장바구니에 담기</a></button>
	<button type="button" class="btn btn-primary btn-lg"  onclick="order()">주문하기</button>
	<button type="button" id="btnList" class="btn btn-default btn-lg" >목록</button>

</div>



<div class="jumbotron jumbotron-fluid mgt-30">
	<div class="container ">
		<h4 class="dispaly-5">상품 상세 설명</h4>
		<hr class="my-4">
		<p class="lead">${viewStore.pDetail }</p>
	</div>

</div>
</form>
<%@include file="../layout/footer.jsp" %>

</body>
</html>