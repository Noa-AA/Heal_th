<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%@include file="../layout/header.jsp"%>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#btnList").click(function() {
		location.href = "/store/list"
	})
	$("#order").click(function(){
		alert("구현중입니다")
	})

})



function del(prodNo){
	
	console.log("삭제버튼 클릭" + prodNo);
	
	confirm("삭제 하시겠습니까?")

	document.location.href="/cart/cartDelete?prodNo="+ prodNo

}


function delall(prodNo){
	
	console.log("All삭제버튼 클릭");
	
	confirm("장바구니를 전부 삭제 하시겠습니까?")

	document.location.href="/cart/cartDeleteAll"

}




	
</script>


<style>
.split button {
	width: 125px;
	height: 45px;
	background-color: transparent;
	border: 2px solid #7ca3f5;
	color: #7ca3f5;
	font-size: 11px;
	border-radius: 8px;
}

/*    .split button { */
/*     display: inline-block; */
/*     padding: 6px 12px; */
/*     margin-bottom: 0; */
/*     font-size: 14px; */
/*     font-weight: 400; */
/*     line-height: 1.42857143; */
/*     text-align: center; */
/*     white-space: nowrap; */
/*     vertical-align: middle; */
/*     -ms-touch-action: manipulation; */
/*     touch-action: manipulation; */
/*     cursor: pointer; */
/*     -webkit-user-select: none; */
/*     -moz-user-select: none; */
/*     -ms-user-select: none; */
/*     user-select: none; */
/*     background-image: none; */
/*     border-radius: 4px; */
/* } */
-------------------------- /* DivTable 표 */



.head, .data {
	display: table-row;
	width: 1200px;
}

 th { 
	background-color: #7ca3f5;
	font-size: 20px;
	font-style: italic;
	color: #ffffff;
	width: 1200px; 
	text-align: center;
	padding: 10px;
}

table{
	box-shadow: 1px 1px 10px 0px rgb(0 0 0 / 20%);
	padding: 15px;
}
td{
	padding: 10px;
}

.divTableBody {
	display: table-row-group;
}

.orderform {
	width: 1200px;
	margin: 0 auto;
	text-align: center;
}

#twoDepth-list a {
	padding: 10px;
	display: flex;
	align-items: center;
	justify-content: center;
	color: #666666;
	font-size: 18px;
	font-weight: 400;
	width: 50%;
}

#twoDepth-list a:nth-child(2) {
	color: #b571e9;
	border-bottom: 2px solid #b571e9;
	margin-top: 1px;
	font-weight: 700;
}

.big-container {
	text-align: center;
}
</style>

<body>

	<div id="subvisual">
		<div id="subvisual-A">
			<p id="subv-title">득근 상점</p>
			<!--         <p id="subv-content">나의 오늘 운동기록을 매일매일 기록해 봐요</p> -->
		</div>
	</div>
	<div id="twoDepth">
		<div id="twoDepth-list">
			<a href="/store/list">상품 목록</a> <a href="/store/cartlist">장바구니 목록</a>
			<a href="/store/orderlist">구매목록</a>
		</div>
	</div>
	<!-- subvisual 끝 -->

	<div class="big-container">
		<h3>장바구니 목록</h3>
	</div>




	<br>




	<form name="orderform" id="orderform" method="post" class="orderform">
		<input type="hidden" name="cmd" value="order">

		<!--  <div class="divTable" style="width: 20%;" > -->


		<table class="divTableBody">


			<div class="head">
				<tr>
				<th><div class="check  " style="width: 200px">선택</div></th>
				<th><div class="pname  " style="width: 400px">상품명</div></th>
				<th><div class="basketprice  " style="width: 400px">가격</div></th>
				<th><div class="basketcmd  " style="width: 200px;">삭제</div></th>
				</tr>
			</div>




			<c:forEach var="cartlist" items="${cartlist}">
				<div class="data">
				
					<tr>
						<td><input type="checkbox" class="check  " style="width: 200px"><!-- 선택 --></td>
						<td><div class="pname  " style="width: 400px">${cartlist.pName }</div><!-- //상품명 --></td>
						<td><div class="basketprice  " style="width: 400px">${cartlist.pPrice }원</div><!-- //가격 --></td>

						<td><div class="delbtn" style="width: 200px;">
							<!--//삭제 -->
							<button type="button" id="btnDelete" class="btn"
								onclick="del(${cartlist.prodNo })">삭제</button>
						</div></td>
					</tr>
				</div>
			</c:forEach>
		</table>


		<br>


		<div class="split">
			<button type="button" id="btnDeleteAll" onclick="delall()">장바구니
				비우기</button>
			<button type="button" id="btnList">목록으로 돌아가기</button>
			<button type="button" id="order">구매하기</button>
		</div>







	</form>










</body>
<%@include file="../layout/footer.jsp"%>
</html>