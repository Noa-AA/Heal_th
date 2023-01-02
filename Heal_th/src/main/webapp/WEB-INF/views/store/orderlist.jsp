<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../layout/header.jsp" %>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#btnList").click(function() {
		location.href = "/store/list"
	})
})




</script>

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
	width: 1200px;
	margin: 0 auto;	
	text-align: center; 
	
}
.big-container2 {
	width: 1200px;
	margin: 0 auto;	

}
body {
	padding-top: 355px;
}

.Thead{
background-color: #7ca3f5;
	font-size:20px;
	font-style: italic;
	color: #ffffff;
}


.tablename{
	width:300px;
	background-color: #7ca3f5;
		font-size:20px;
	font-style: italic;
	color: #ffffff;
}

.pname2{
	width:300px;
}

.list_btn {
  	background-color: transparent;
	border: 2px solid #7ca3f5; 
	color:#7ca3f5;
	border-radius: 8px;
	text-align: center;
	width: 120px;
	height: 42px;
	font-size:17px;
	margin-top:30px;
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
   
   #twoDepth-list a:nth-child(3){
	   color: #b571e9;
	   border-bottom: 2px solid #b571e9;
	   margin-top: 1px;
	   font-weight: 700;
	   
   }
   
   .tablename{
   width:300px;
   padding: 20px;
   text-align: center;
   }
   .pname2{
   width:900px;
   padding: 20px;
   }

</style>

<div id="subvisual">
    <div id="subvisual-A">
        <p id="subv-title">득근 상점</p>
<!--         <p id="subv-content">나의 오늘 운동기록을 매일매일 기록해 봐요</p> -->
    </div>
</div>
<div id="twoDepth">
    <div id="twoDepth-list">
        <a href="/store/list">상품 목록</a>
        <a href="/store/cartlist">장바구니 목록</a>
		<a href="/store/orderlist">구매목록</a>
    </div>
</div><!-- subvisual 끝 -->





<div class="big-container">
	<h3>구매목록</h3>
</div>


<div class="big-container2">
	<div class="divTable">
		<c:forEach var="list" items="${orderlist }">
		<div class="head2">
			<div class="cell tablename" >결제번호</div>
			<div class="cell pname2" >${list.payNo }</div><!-- 결제번호 -->
		</div>
		<div class="head2">
			<div class="cell tablename" >결제일자</div>
			<div class="cell pname2">${list.paymentDate }</div> <!-- 주문일시 -->
		</div>
		
		<div class="head2"> 
			<div class="cell tablename">상품명</div>
			<div class="cell pname2">단호박주스 </div>
		</div>
		<div class="head2"> 
			<div class="cell tablename">결제금액</div>
			<div class="cell pname2">${list.paymentAmount }원</div><!-- 금액 -->
		</div>
		
		
			<br><br>
		</c:forEach>
	</div>
	<button type="button" id="btnList" class="list_btn" >
		<span class="list_text">상품목록</span>
	</button>
</div>



</body>
<%@include file="../layout/footer.jsp" %>
</html>