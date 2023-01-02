<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../layout/header.jsp" %>

 <!-- iamport.payment.js -->
 <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
 
 
 <script type="text/javascript">

	 

	//결제 준비하기
 IMP.init("imp34554272"); 
	 	var paid_at = new Date();
	 	
	
 function requestPay() {

     // IMP.request_pay(param, callback) 결제창 호출
     IMP.request_pay({ // param
         pg: "html5_inicis",
         pay_method: "card",
         merchant_uid : 'merchant_' +  new Date().getTime(),
          name: "STORE",
          paid_at: paid_at,
          
         buyer_email: "${user.userEmail }",
         buyer_name: "${user.userName }",
		amount : ${param.amount} , 
         buyer_tel: "${user.userPhone }",
         user_no:${user.userNo }
     
     },function (rsp) { // callback
    	 
    	 console.log(rsp)
         if (rsp.success) { // 결제 성공 시: 
				

        	 
				console.log('결제성공')
				console.log('paycomplete 로 DB에 저장할 정보를 전달함 ')
				
        	 // jQuery로 HTTP 요청
             jQuery.ajax({
                 url: "/store/payment", // 예: https://www.myservice.com/payments/complete
                 method: "post", // POST method
//                  headers: { "Content-Type": "application/json" },
                 headers: { "Content-Type": "application/x-www-form-urlencoded" },
     
                 data: {
                	 
                	 //rsp == 아임포트 결제 결과 정보
                     imp_uid: rsp.imp_uid, //결제번호
                     merchant_uid: rsp.merchant_uid,  //주문번호
                     paymentMethod: rsp.pay_method, //결제수단

                	 //개발 사이트 정보?
					 paymentAmount: ${param.amount},//결제 금액 
					 userNo: ${user.userNo },//유저 번호
                	 phoneNo: "${user.userPhone }" //유저 전화번호
                     
                 }
                 , dataType: "json"
         		, success: function( result ) {
         			console.log('결제 정보 DB저장 AJAX 성공')
         			
         			//결제 정보 DB에 저장 성공하면 수행할 작업 작성
         			//	-> 리다이렉트?

         			location.href = "/store/ordersuccess";
         		}
         		, error: function() {
         			console.log('결제 정보 DB저장 AJAX 실패')
         			location.href = "/store/ordersuccess";
         		}

             });	 
//             	 
				
           } else {
             alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
        		console.log('결제 실패 ')
             console.log(buyer_name)
           }
           
         });
     
	}
     

</script>

<style>


body{
	margin-left: 25%;
	margin-right: 25%;
	padding-top: 0;
}
.price_span_label{
	float: left;
}

.total_price_red{
	font-size: 25px;
}
.total_price_label{
	margin-top: 5px;
}

.total_info_div{
/* 	position:absolute; */
	width : 300px;
	border : 1px solid #333;
	border-top-width:2px;
	margin: 0 auto;	
	
}
.total_info_price_div{
	width: 90%;
    margin: auto;
	position: relative;
}
.total_info_div ul{
	list-style: none;
}
.total_info_div li{
	text-align: right;
	margin-top:10px;
}
.strong_red{
	color: red;
}

/* .buy{ */
/* 	position : absolute; */
/* 	top :30px; */
/* 	left:30px; */
/* } */

.big-container {
	border: 1px solid black;
	padding: 10px;
}

.button-container {
	margin: 0 auto !important;
	width: 310px;
}
.button-container button{
	background-color: transparent;
	border: 2px solid #7ca3f5; 
	color:#7ca3f5;
	border-radius: 8px;
	text-align: center;
	width: 150px;
	height: 40px;
	font-size:12px; 
	margin-top:100px;
}
</style>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="big-container">
	
	<div class="buy">
	구매자 정보 <br>
	이름 : <span>${user.userName } </span><br>
	아이디 : <span>${user.userId }</span><br>
	닉네임 : <span>${user.userNick }</span><br>
	휴대폰 번호 : <span>${user.userPhone }</span><br>
	</div>
	<br>
	<hr>
	<br>
	<div class="get">
	받는사람 정보<br>
	이름 : <span>${user.userName } </span><br>
	주소 : <span>${user.userAddress }</span><br>
	휴대폰 번호 : <span>${user.userPhone }</span><br>
	</div>
	
	
	<hr>
	
	<!-- 결제정보 -->
	<%-- 총 상품가격 : <span>${param.amount} 원</span> --%>
	
			
						<!-- 주문 종합 정보 -->
						<div class="total_info_div">
						<!-- 가격 종합 정보 -->
						<div class="total_info_price_div">	
			
							<ul>
								<li>
									<span class="price_span_label">상품 금액</span>
									<span class="totalPrice_span">${param.price}</span>원
								</li>
								<li>
									<span class="price_span_label">상품 개수</span>
									<span class="totalPrice_span">${param.count}</span>개
								</li>
								<li class="price_total_li">
									<strong class="price_span_label total_price_label">최종 결제 금액</strong>
									<strong class="strong_red">
										<span class="total_price_red ">
											${param.amount}원
										</span>
									</strong>
								</li>
							</ul>
							</div>
							</div>
							
							<div id="btnarea"> 
			<div class="button-container">
				<button type="button" id="btnpay" onclick='requestPay()'><span>결제하기</span></button> 
				<button type="button" id="btncancel" onclick="history.go(-1)"><span>취소하기</span></button>
			</div> 
	</div>

</div>
</body>
</html>