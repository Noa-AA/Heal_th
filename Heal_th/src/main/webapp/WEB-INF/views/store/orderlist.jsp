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


</style>

<h1>구매목록</h1>

	<div class="divTable">
		<div class="divTableBody">
		<div class="head">
			<div class="cell pdata">주문일시</div>
			<div class="cell pname" style="width:300px";>상품명</div>
			<div class="cell">가격</div>
		</div><!-- head종료 -->
		
		<c:forEach var="orderlist" items="${orderlist }">
		<div class="data">
			<div class="cell pdata">${orderlist.addDate }</div> <%--주문일시 --%>
			<div class="cell pname">${orderlist.pName }</div><!-- 상품명 -->
			<div class="cell pname">${orderlist.pPrice }원</div><!-- 상품명 -->
			
			</div>
			
		</div><!-- data종료 -->
		</c:forEach>
</div>


</body>
</html>