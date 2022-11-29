<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	$("#paydo").click(function(){
	    IMP.request_pay({ // param
	 
          pg: "html5_inicis",
          pay_method: "card",
          merchant_uid: $("#userNo").val() + new Date().getTime(),
          name: "득근머니",
          amount: 100,
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
});
</script>
</head>
<body>

<!-- 결제시 사용될 정보 -->
<input type="hidden" id="userName" value="${user.userName }">
<input type="hidden" id="userPhone" value="${user.userPhone }">
<input type="hidden" id="userEmail" value="${user.userEamil }">
<input type="hidden" id="userNo" value="${user.userNo }">
<input type="hidden" id="amount" value="100">

<h1>득근머니 잔액</h1>

<span>${mmoney }</span>
<form action="./charge" method="post">

	<button id="paydo" type="button">충전하기</button>
</form>
</body>
</html>