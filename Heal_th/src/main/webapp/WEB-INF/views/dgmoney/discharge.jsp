<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
			<p>은행명</p>
			<input type="text" name="bankName" placeholder="은행명을 입력해주세요">
			<p>예금주</p>
			<input type="text" name="wdUsername" placeholder="예금주 이름을 입력해주세요">
			<p>계좌번호</p>
			<input type="text" name="wdAccount" placeholder="계좌번호를 입력해주세요">
			<p>인출금액</p>
			<input type="hidden" name="userNo" value="${userno }">
			<p>${param.wdAmount }원</p>
			<p><button>인출신청</button></p>
		</form>
	</div>
</body>
</html>