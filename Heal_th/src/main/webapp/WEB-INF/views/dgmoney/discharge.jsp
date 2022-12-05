<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$("#wdButton").click(function(){
		if($("#bankName").val()=="" && $("#wdUsername").val()=="" &&$("#wdAccount").val()==""){
			alert("입력하지 않은 값이 있습니다.");
			return false;
		}
	})
})
</script>
<style type="text/css">
.discharge{
	width: 600px;
	margin: 0 auto;
	text-align: center;
}

input{
	width: 230px;
	text-align: center;
}

</style>
</head>
<body>
	<div class="discharge">
		<form action="./dischargeProc" method="post">
			<h1>인출신청</h1>
			<input type="hidden" name="userNo" value="${userno }">
			<p>은행명</p>
			<input type="text" id="bankName" name="bankName" placeholder="은행명을 입력해주세요">
			<p>예금주</p>
			<input type="text" id="wdUsername" name="wdUsername" placeholder="예금주 이름을 입력해주세요">
			<p>계좌번호</p>
			<input type="text" id="wdAccount" name="wdAccount" placeholder="계좌번호를 입력해주세요">
			<p>인출금액</p>
			<input type="hidden" name="wdAmount" value=${param.wdAmount }>
			<p>${param.wdAmount }원</p>
			<p><button id="wdButton">인출신청</button></p>
			<p style="color: red">인출신청시 영업일기준 2~3일내 환불계좌로 입금됩니다.</p>
		</form>
	</div>
</body>
</html>