<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%@include file="../layout/header.jsp" %>

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
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

	


   .split button{
	   width: 125px;
	   height: 45px;
	   background-color: transparent;
	   border: 2px solid #7ca3f5;
	   color:#7ca3f5;
	   font-size:11px;
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

   
   --------------------------


/* DivTable 표 */
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


.orderform{
	margin-left:25%;
	margin-right:25%;
	
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
   
   #twoDepth-list a:nth-child(2){
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
        <a href="/store/list">상점 바로가기</a>
        <a href="/store/cartlist">장바구니 바로가기</a>

    </div>
</div><!-- subvisual 끝 -->

<div class="big-container">
	<h3>장바구니 목록</h3>
</div>




<br>




<form name="orderform" id="orderform" method="post" class="orderform" >
<input type="hidden" name="cmd" value="order">

<!--  <div class="divTable" style="width: 20%;" > -->


 <div class="divTable"  >
	<div class="divTableBody">
	
	
		<div class="head" >
<!-- 			<div class="check cell" style="width:10%">카트번호</div> -->
			<div class="check cell" style="width:10%">선택</div> 
			<div class="pname cell" style="width:32%">상품명</div>
			<div class="basketprice cell" style="width:32%">가격</div>
<!-- 		    <div class="num cell" style="width:10%">수량</div> -->
<!--             <div class="sum cell" style="width:10%">합계</div> -->
			<div class="basketcmd cell" style="width:8%">삭제</div>
		</div>
		
		
		
		
		<c:forEach var="cartlist" items="${cartlist}">
		<div class="data">
<%-- 			<div class="check cell">${cartlist.cartNo }</div> <!-- 카트번호 --> --%>
<%-- 			<div class="pname cell"><a href="/store/cart?prodNo=${cartlist.prodNo }">${cartlist.pName }</a></div>  <!-- //상품명 --> --%>
			<div class="cell">
			<input type="checkbox">
			</div>
			<div class="pname cell">${cartlist.pName }</div>  <!-- //상품명 -->
			 <div class="basketprice cell" >${cartlist.pPrice }원</div> <!-- //가격 -->
<%-- 			<div class="num cell">${cartlist.cartStock }개</div> <!--//수량 --> --%>

<!-- 			<div class="sum cell" > //합계 -->
<!--                         <script> -->
<%--                          	var x = ${cartlist.pPrice }; --%>
<%--                         	var y = ${cartlist.cartStock }; --%>
<!--                          	var z = x*y; -->
                        	
<!--                         	document.write(z); -->
<!--                         </script>  원 -->
<!--             </div> -->

				<div class="delbtn cell"> <!--//삭제 -->
                        <button type="button" id="btnDelete" class="btn" onclick="del(${cartlist.prodNo })">삭제</button>
				</div>
			</div>
			</c:forEach>
		</div>
	</div>


<br>


                    <div class="split">
                        <button type="button" id="btnDeleteAll" onclick="delall()">장바구니 비우기</button>
						<button type="button" id="btnList" >목록으로 돌아가기</button>	
						<button type="button" id="order" >구매하기</button>
        	        </div>







	</form>	
			
			








</body>
<%@include file="../layout/footer.jsp" %> 
</html>