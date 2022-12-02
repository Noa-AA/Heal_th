<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../layout/header.jsp" %>
<style type="text/css">
.big-container {
	width: 800px;
	margin: 0 auto;
}

th, td {
	border: 1px solid silver;
	padding: 5px;
}
</style>
<body>
<div class="big-container">
	<h1>인출신청내역 조회</h1>
	<table>
		<tr>
			<th>인출신청 번호</th>
			<th>인출신청 금액</th>
			<th>예금주</th>
			<th>은행명</th>
			<th>계좌번호</th>
			<th>회원번호</th>
			<th>처리상태</th>
			<th>완료</th>
		</tr>
		<c:forEach items="${withDraw }" var="w">
		<tr>
			<td>No.${w.wdNo }</td>
			<td>${w.wdAmount }원</td>
			<td>${w.wdUsername }</td>
			<td>${w.bankName }</td>
			<td>${w.wdAccount }</td>
			<td>${w.userNo }</td>
			<td>${w.wdProcess }</td>
			<td>
			<c:if test="${w.wdProcess eq '미처리'}">
			<form action="/admin/withdrawProc?wdNo=${w.wdNo }&wdAmount=${w.wdAmount }&userNo=${w.userNo }" method="post">
					<button onclick="return confirm('정말 처리완료되었습니까?')">승인</button>
			</form>
			</c:if>
			</td>
		</tr>
		</c:forEach>
	</table>
		
</div>
</body>
</html>