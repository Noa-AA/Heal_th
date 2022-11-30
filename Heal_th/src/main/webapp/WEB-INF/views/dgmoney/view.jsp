<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../layout/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

<script type="text/javascript">
//카카오 결제 API
var IMP = window.IMP; // 생략가능
IMP.init('imp88224386');  // 가맹점 식별코드

// IMP.request_pay(param, callback) 결제창 호출
$(document).ready(function(){
	$("#charge").click(function(){
	    IMP.request_pay({ // param
	 
          pg: "html5_inicis",
          pay_method: "card",
          merchant_uid: $("#userNo").val() + new Date().getTime(),
          name: "득근머니",
          amount: $("#amount").val(),
          buyer_email: $("#userEmail").val(),
          buyer_name: $("#userName").val(),
          buyer_tel: $("#userPhone").val(),
		}, function (rsp) { // callback
	        if (rsp.success) { // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
	            // jQuery로 HTTP 요청
	            console.log(rsp.pay_method);
	            $.ajax({
	                url: "/dgmoney/charge",
	                method: "POST",
	                headers: { "Content-Type": "application/x-www-form-urlencoded" },
	                dataType: "html",
	                data: { 
	                	merchant_uid: rsp.merchant_uid,
	                	amount: $("#amount").val(),
	                	userNo: $("#userNo").val()
	               	}
	            }).done(function (data) {
	                	console.log(rsp.orderprocess);
	                	console.log("결제성공");
	              // 가맹점 서버 결제 API 성공시 로직
	              	 	window.location.href = "/dgmoney/charge";	
	            })
	          } else {
	            alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
	          }
	     });
	    
	});
	
	$("#discharge").click(function(){
		if(${mmoney }>=$("#wdAmount").val()&&$("#wdAmount").val()!=''){
			window.open("/dgmoney/discharge?wdAmount="+$("#wdAmount").val(),"discharge","width=700,height=500, left=600, top=200");
		} else {
			alert("보유중인 금액이 충분한지 확인해주세요.");
		}
	})
});

</script>
<style type="text/css">
.container{
	margin: 0 auto;
	text-align: center;
}
</style>
</head>
<body>

<!-- 결제시 사용될 정보 -->
<input type="hidden" id="userName" value="${user.userName }">
<input type="hidden" id="userPhone" value="${user.userPhone }">
<input type="hidden" id="userEmail" value="${user.userEmail }">
<input type="hidden" id="userNo" value="${user.userNo }">

<div class=container>
	<h1>득근머니</h1>
	
	<span>득근머니 잔액 </span><span>${mmoney }원</span>
	<form action="./charge" method="post">
		<p>득근머니 충전</p>
		<input type="text" id="amount" placeholder="충전할 금액을 입력해주세요">
		<button id="charge" type="button">충전하기</button>
	</form>
	<form action="./discharge" method="get">
		<p>득근머니 인출</p>
		<input type="text" id="wdAmount" placeholder="인출할 금액을 입력해주세요">
		<button id="discharge" type="button">인출신청</button>
	</form>
</div>
</body>
</html>