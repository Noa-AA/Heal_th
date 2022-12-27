<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>


// //검색 버튼
// $(".search_area button").on("click", function(e) {
// 	e.preventDefault();

// 	let type = $(".search_area select").val();
// 	let keyword = $(".search_area input[name='keyword']").val();

// 	if (!keyword) {
// 		alert("키워드를 입력하세요.");
// 		return false;
// 	}

// 	moveForm.find("input[name='type']").val(type);
// 	moveForm.submit();
// });






</script>

<style>



.title {
	margin-bottom: 40px;
}

.store-list {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	/* 	margin: 50px 50px 90px 50px; */
	margin: auto;
 	gap: 50px 50px; 
	width: 1200px;
}

.store {
	position: relative;
	flex: 3 2 30%;
	border: 1px solid #333;
	box-shadow: 1px 1px 10px 0px rgb(0 0 0/ 30%);
	border-radius: 10px;
	text-align: center;
	width: 400px;
	height: 300px;
}

.store-content {
/* 	margin-top: 30px; */
	height : 100%;
	width: 1200px;
	margin : 0 auto;
	display: flex;
	flex-wrap: wrap;
}

.store img {
	border: 0;
	margin-top: 20px;
	height: 100px;
	width: 200px;
}

.search_area {
	display: inline-block;
	text-align: center;
	margin-top: 30px;
}

.search_area input {
	height: 36px;
	width: 250px;
}

.search_area button {
	width: 100px;
	height: 36px;
}

.search_area select {
	height: 35px;
}

/* button{ */
/* 	background-color: #c583d6; */
/* } */

.pageInfo_wrap {
	text-align: center;
}

.pageInfo {
	list-style: none;
	display: inline-block;
	margin: 50px 0 0 100px;
}

.pageInfo li {
	float: left;
	font-size: 20px;
	margin-left: 18px;
	padding: 7px;
	font-weight: 500;
}

a:link {
	color: black;
	text-decoration: none;
}

a:visited {
	color: black;
	text-decoration: none;
}

a:hover {
	color: black;
	text-decoration: underline;
}

.active {
	background-color: #cdd5ec;
}


.store-ul{
	display: flex;
	flex-wrap: wrap;
	width : 372px;
	height: 300px;
	background-color: #eee;
	margin-right: 42px;
	margin-bottom: 10px;
	
}
.store-ul:nth-child(3n) {
    margin-right: 0px;
}   


#cart{
	width: 76px;
	height: 23px;
	font-size:10px;
	
}


-------------------

.text-center {
	display: flex;
	justify-content: center;
	margin-top: 40px;
}

.pagination {
	display: flex;
	margin: 0;
}

.pagination > li{
	display: flex;
}

.pagination > li > a {
	display: flex;
	margin: 0 4px;
	width: 40px;
	height: 40px;
	border-radius: 20px !important;
	font-size: 16px;
	justify-content: center;
	align-items: center;
}

---------------


.search_area {
	display: inline-block;
	text-align: center;
	margin-top: 30px;
}

.search_area input {
	height: 36px;
	width: 250px;
}


.search_area button {
	width: 100px;
	height: 36px;
}

.search_area select {
	height: 35px;
}

</style>

<%@include file="../layout/header.jsp" %>

<body>
<div id="subvisual">
    <div id="subvisual-A">
        <p id="subv-title">득근 상점</p>
<!--         <p id="subv-content">나의 오늘 운동기록을 매일매일 기록해 봐요</p> -->
    </div>
</div>
<div id="twoDepth">
    <div id="twoDepth-list">
        <a href="/store/cartlist">장바구니 바로가기</a>

    </div>
</div>



<h1>득근 상점</h1>
<hr>




	<div class="store-list">

<!-- 			<div class="store"> -->
<!-- 				<div class="store-thumbnail"> -->
				</div>
				<div class="store-content">
					<c:forEach items="${list }" var="StoreDto">
					<ul class="store-ul">
						<li>
							<a href="/store/view?prodNo=${StoreDto.prodNo }">${StoreDto.pName }</a>
						</li>
						<li>가격 : ${StoreDto.pPrice } 원</li>
						<li>조회수 : ${StoreDto.pHit } </li>
					<button id="cart"  ><a href="/store/cart?prodNo=${StoreDto.prodNo }">장바구니에 담기</a></button>


					</ul>
					</c:forEach>
				</div>




			<div class="search_wrap text-center">
			<div class="search_area">
				<select name="type" id="type">
					<option value="T" <c:out value="${pageMaker.cri.type eq 'T'?'selected':'' }"/>>제목</option>
				</select> <input type="text" name="keyword" value="${pageMaker.cri.keyword }">
				<button>검색</button>
			</div>
		</div>
		
		
		

	<form id="moveForm" method="get">
		<input type="hidden" id="prodNo" name="prodNo" value='<c:out value="${pageInfo.prodNo}"/>'> 
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }"> 
		<input type="hidden" name="type" value="${pageMaker.cri.type }">
	</form>


	<div class="text-center">
		<ul class="pagination pagination-sm">
	
		<%-- 첫 페이지로 이동 --%>
		<c:if test="${paging.curPage ne 1 }">
			<li><a href="/store/list"> &larr; 처음 </a></li>	
		</c:if>
		
		<%-- 이전 페이징 리스트로 이동 --%>
		<c:choose>
		<c:when test="${paging.startPage ne 1 }">
			<li><a href="/store/list?curPage=${paging.startPage - paging.pageCount }">&laquo;</a></li>
		</c:when>
		<c:when test="${paging.startPage eq 1 }">
			<li class="disabled"><a>&laquo;</a></li>
		</c:when>
		</c:choose>
		
		<%-- 이전 페이지로 가기 --%>
		<c:if test="${paging.curPage > 1 }">
			<li><a href="/store/list?curPage=${paging.curPage - 1 }">&lt;</a></li>
		</c:if>
		
		
		
		<%-- 페이징 리스트 --%>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="i">
	<c:if test="${paging.curPage eq i }">
		<li class="active"><a href="/store/list?curPage=${i }">${i }</a></li>
	</c:if>
		<c:if test="${paging.curPage ne i }">
			<li><a href="/store/list?curPage=${i }">${i }</a></li>
		</c:if>
		</c:forEach>
	
		
		
		<%-- 다음 페이지로 가기 --%>
		<c:if test="${paging.curPage < paging.totalPage }">
			<li><a href="/store/list?curPage=${paging.curPage + 1 }">&gt;</a></li>
		</c:if>
		
		<%-- 다음 페이징 리스트로 이동 --%>
		<c:choose>
		<c:when test="${paging.endPage ne paging.totalPage }">
			<li><a href="/store/list?curPage=${paging.startPage + paging.pageCount }">&raquo;</a></li>
		</c:when>
		<c:when test="${paging.endPage eq paging.totalPage }">
			<li class="disabled"><a>&raquo;</a></li>
		</c:when>
		</c:choose>
	
		<%-- 끝 페이지로 이동 --%>
		<c:if test="${paging.curPage ne paging.totalPage }">
			<li><a href="/store/list?curPage=${paging.totalPage }">끝 &rarr;</a></li>	
		</c:if>
		
		</ul>
	</div>

</body>
<%@include file="../layout/footer.jsp" %>
</html>

