<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png"  href="/favicon.png"/>
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
			if($("#amount").val()%100==0){
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
		                url: "/dgmoney/view",
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
		                	alert("충전이 완료되었습니다 !");
		              // 가맹점 서버 결제 API 성공시 로직
		              	 	window.location.href = "/dgmoney/view";	
		        	})
		    	} else {
		            alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
		    	}
		    });
		    
			}else {
				alert("100원 단위로 충전 가능합니다.");
			}
		});
	
	$("#discharge").click(function(){
		if(${mmoney }>=$("#wdAmount").val()&&$("#wdAmount").val()!=''){
			if(${wdCnt}>0){
				alert("이미 신청한 내역이 있습니다.");
			} else {
// 				window.open("/dgmoney/discharge?wdAmount="+$("#wdAmount").val(),"discharge","width=560,height=435, left=600, top=200");
				location.href=("/dgmoney/discharge?wdAmount="+$("#wdAmount").val());
				window.resizeTo(600,520);
			}
		} else {
			alert("보유중인 금액이 충분한지 확인해주세요.");
		}
		

	})
});

</script>
<style type="text/css">
@import url('https://webfontworld.github.io/sunn/SUIT.css');

html, body, pre, h1, h2, h3, h4, h5, h6, dl, dt, dd, ul, li, ol, th, td, p, blockquote, form, fieldset, legend, menu, nav, section, hgroup, article, header, aside, footer, input, select, textarea, button {
    margin: 0;
    padding: 0;
    list-style:none;
    font-family: 'SUIT';
}

.dgm-container{
	margin: 0 auto;
	text-align: center;
	padding: 20px;
}

.dgm-container button{
	width: 108px;
    height: 36px;
    background-color: transparent;
    border: 2px solid #7ca3f5;
    color:#7ca3f5;
    font-size:15px;
    border-radius: 8px;
}

.dgm-container input{
	height: 36px;
	border: 1px solid silver;
	margin-right: 5px;
	padding-left: 5px;
}

#mydgmoney span {
	background: #C2A5FF;
	font-size: 15px;
	padding: 8px;
	font-weight: bold;
}

button {
	cursor: pointer;
}

</style>
</head>
<body>

<!-- 결제시 사용될 정보 -->
<input type="hidden" id="userName" value="${user.userName }">
<input type="hidden" id="userPhone" value="${user.userPhone }">
<input type="hidden" id="userEmail" value="${user.userEmail }">
<input type="hidden" id="userNo" value="${user.userNo }">

<div class="dgm-container">
	<h1>득근머니</h1><br>
	
	<div id="mydgmoney">
		<span>득근머니 잔액 :</span><span>${mmoney }원</span>
	</div>
	<form action="./charge" method="post">
	<br>
		<input type="text" id="amount" placeholder="충전할 금액을 입력해주세요">
		<button id="charge" type="button">충전하기</button>
	</form>
	<form action="./discharge" method="get">
	<br>
		<input type="text" id="wdAmount" placeholder="인출할 금액을 입력해주세요">
		<button id="discharge" type="button">인출신청</button>
	</form>
</div>
</body>
</html>