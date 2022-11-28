<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
          merchant_uid: "ORD20180131-000001233",
          name: "노르웨이 회전 의자",
          amount: 64900,
          buyer_email: "gildong@gmail.com",
          buyer_name: "홍길동",
          buyer_tel: "010-4242-4242",
          buyer_addr: "서울특별시 강남구 신사동",
          buyer_postcode: "01181"
		}, function (rsp) { // callback
	        if (rsp.success) { // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
	            // jQuery로 HTTP 요청
	            console.log(rsp.pay_method);
	            $.ajax({
	                url: "/ordersuccess",
	                method: "POST",
	                headers: { "Content-Type": "application/x-www-form-urlencoded" },
	                dataType: "html",
	                data: { 
	                	imp_uid: rsp.imp_uid,
	                	pay_method: rsp.pay_method,
	                	merchant_uid: rsp.merchant_uid,
	                	name: rsp.name

	               	}
	            }).done(function (data) {
	                	console.log(rsp.orderprocess);
	                	console.log("결제성공");
	              // 가맹점 서버 결제 API 성공시 로직
	              	 	window.location.href = "/ordersuccess";	
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

<h1>득근머니 잔액</h1>


<form action="./charge" method="post">

	<button id="paydo" type="button">충전하기</button>
</form>
</body>
</html>