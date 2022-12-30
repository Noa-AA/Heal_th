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

.boxArea {
/* 	height: 1200px; */
/*     width: 700; */
    position: relative;
    left: 45px;
    background-color: #F5F5F5;
    box-shadow: 0px 5px 25px 14px lightgrey;
    border-radius: 12px;
    padding: 20px;
}


.big2{
	text-align: center;
	height: 5%;
}


.mgb-15{
	margin-bottom:15px;
}

.mgt-30{
	margin-top:30px;
}
.mgt-50{
	margin-top:50px;
}


/* .repImgDiv{ */
/* 	margin-right: 15px; */
/* 	height: auto; */
/* 	width:50%; */
/* } */

/* .repImg{ */
/* width:100%; */
/* height: 400px; */
/* } */

.wd50{
	height:auto;
	width:50%;
}

.paymoney{
	margin-right: 25%;
}


.btn {
    width: 213px;
    height: 41px;
}

.btn {
    display: inline-block;
    padding: 6px 12px;
    margin-bottom: 0;
    font-size: 14px;
    font-weight: 400;
    line-height: 1.42857143;
    text-align: center;
    white-space: nowrap;
    vertical-align: middle;
    -ms-touch-action: manipulation;
    touch-action: manipulation;
    cursor: pointer;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    background-image: none;
    border: 1px solid transparent;
    border-radius: 4px;
}


.order_btn {
    height: 41px;
    border: 2px solid #7ca3f5;
    background: transparent;
}


.list_btn {
    background: #7ca3f5;
    border: none;
}

.order_text{
    color: #7ca3f5;
}
.list_text{
    color: white;
}


.repImgDiv{
    height: 300px;
    width:50%;
    margin: 40px;
    margin-left: 200px;
    
}

.price2{
	margin-right:14%;
}

</style>




<form>


<!-- <div layout:fragment="content" style="margin-left:25%;margin-right:25%"></div> -->
	<div style="margin-left: 25%; margin-right: 25%" class="big boxArea">
	<%-- <input type="hidden" id="itemId" th:value="${item.id}"> --%>
	<div class="d-flex">
		<div class="repImgDiv" style="border:1px solid #ccc;height:300px">
			<!-- 이미지 넣어야함 -->
		</div>
	<input type="hidden" id="itemId"><span>${viewStore.pName }</span>


	</div>


<div class="big2">
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
	
</div><!-- big2 -->	




	<div class="text-right mgt-50 paymoney price2" style="font-size:20px;">
		<h4 style="color:red;">결제금액</h4>

		<span id="totalPrice"  >${viewStore.pPrice}원</span>
		
	</div>
	
	<br>
	
	
<div class="text-center">
	<button type="button" class="addCart_btn btn"><a href="/store/cart?prodNo=${viewStore.prodNo }">장바구니에 담기</a></button>
	<button type="button" class="btn order_btn"  onclick="order()">
		<span class="order_text">주문하기</span>
	</button>
	<button type="button" id="btnList" class="btn list_btn" >
		<span class="list_text">목록</span>
	</button>

</div>



<div class="jumbotron jumbotron-fluid mgt-30">
	<div class="container ">
		<h4 class="dispaly-5">상품 상세 설명</h4>
		<hr class="my-4">
		<p class="lead">${viewStore.pDetail }</p>
	</div>

</div>

</div>
<!-- big 종료 -->
</form>
<%@include file="../layout/footer.jsp" %>

</body>
</html>