<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../layout/header.jsp" %>
<style>
.divTable{

	display: table;
	width: 100%;
}
.head, .data {
	display: table-row;
}
.head{
	background-color: #7ca3f5;
	font-size:20px;
	font-style: italic;
	color: #ffffff;
}
.cell {
	border: 1px solid #999999;
	display: table-cell;
	padding: 3px 10px;
}

.divTableBody {
	display: table-row-group;
}

.big-container {
	width: 50%;
	margin: 0 auto;	

}
body {
	padding-top: 155px;
}

</style>
<div class="big-container">
	<h1>구매목록</h1>
	
		<div class="divTable">
			<div class="divTableBody">
			<div class="head">
				<div class="cell pdata">결제번호</div>
				<div class="cell pname" style="width:300px">결제일자</div>
				<div class="cell">결제금액</div>
			</div><!-- head종료 -->
			
			<c:forEach var="orderlist" items="${orderlist }">
			<div class="data">
				<div class="cell pname">${orderlist.payNo }</div><!-- 결제번호 -->
				<div class="cell pdata">${orderlist.paymentDate }</div> <%--주문일시 --%>
				<div class="cell pname">${orderlist.paymentAmount }원</div><!-- 금액 -->
				
				
			</div><!-- data종료 -->
			</c:forEach>
		</div>
	</div>
</div>

</body>
<%@include file="../layout/footer.jsp" %>
</html>