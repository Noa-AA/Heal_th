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
// $(document).ready(function() {
// $(".addCart_btn").click(function(){
// 	console.log("addCart_btn click")
// 	   	var prodNo = ${viewStore.prodNo}
// 		var uesrNo = ${viewStore.userNo}
// // 		var pName = ${viewStore.pName}
// // 	   var cartStock = $("#cart_stock").val();

// 	console.log("prod_no : "+ prodNo)
// // 	console.log("cartStock : "+ cartStock)
// 	   $.ajax({
// 		    type : "post", 
// 		    url : "/store/cart", 
// 		    dataType : "json",
// 		    data : {
// 		    	prodNo : prodNo,
// 		    	userNo : userNo
// // 		    	pName : pName
// // 			     cartStock : cartStock
// 			     },
// 		    success : function(result){
// 		     alert("카트 담기 성공");
// // 		     $("#cart_stock").val("1");
// 		    },
// 		    error : function(){
// 		     alert("카트 담기 실패");
// 		    }
// 		   });
// 	});
// });

$(document).ready(function(){
	
	calculteTotalPrice();
	
	$("#count").change(function() {
		calculateToalPrice();
	});
});

function calculateToalPrice(){ //현재 주문할 수량과 상품 한 개당 가격을 곱해서 결제 금액을 구해주는 함수
	var count =$("#count").val();
	var price =$("#price").val();
	var totalPrice = price*count;
	
	$("#totalPrice").html(totalPrice + '원');
}


/* 바로구매 버튼 */
function order(){
	
}

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

</style>






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
			<input type="hidden" value="${viewStore.pPrice}" id="price"
				name="price"> <span>${viewStore.pPrice}</span>원
		</div>
	</div>




	<div class="input-group w-50">
		<div class="input-group-prepend">
			<span class="input-group-text">수량</span>
		</div>
		<input type="number" name="count" id="count" class="form-control"
			value="1" min="1">
	</div>
	
	
</div>
<!-- big 종료 -->
<hr class="my-4">
<div class="text-right mgt-50">
	<h5>결제금액</h5>
<!-- 	<h3 name="totalPrice" id="totalPrice" class="font-weight-bold"></h3> -->
	<h3 id="totalPrice" class="font-weight-bold"></h3>
</div>
<div class="text-right">

	<span>${viewStore.pPrice}</span>원
</div>
<div class="text-center">
	<button type="button"
		class="btn btn-light border border-primary btn-lg">장바구니 담기</button>
	<button type="button" class="btn btn-primary btn-lg"  onclick="order()">주문하기</button>
	<button id="btnList" class="btn btn-default btn-lg">목록</button>

</div>



<div class="jumbotron jumbotron-fluid mgt-30">
	<div class="container">
		<h4 class="dispaly-5">상품 상세 설명</h4>
		<hr class="my-4">
		<p class="lead">${viewStore.pDetail }</p>
	</div>

</div>


</body>
</html>