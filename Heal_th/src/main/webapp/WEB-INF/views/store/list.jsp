<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
/* .rewards-container .reward-list li a:hover { */
/*     box-shadow: 0px 0px 20px rgba(93,142,171,.4); */
/*     border-color: #5d8eab; */
/*     z-index: 100; */
/* } */

 

/* ul { */
/*     display: block; */
/*     list-style-type: disc; */
/*     margin-block-start: 1em; */
/*     margin-block-end: 1em; */
/*     margin-inline-start: 0px; */
/*     margin-inline-end: 0px; */
/*     padding-inline-start: 40px; */
/* } */


/* body { */
/* 	padding-top:355px; */
	
/* } */


/* a{ */
/* text-decoration : none; */
/* } */

/* .rewards-container .reward-list { */
/*     position: relative; */
/*     display: inline-block; */
/*     border: 1px solid #333; */
/* /*     background-color: #fff; */ */
/* 	box-shadow: 1px 1px 10px 0px rgb(0 0 0/ 30%); */
/*     width: 400px; */
/*     height: 300px; */
/*     padding: 12px; */
/*     text-align: center; */
/* /*     box-sizing: border-box; */ */
/*     cursor: default; */
/* } */









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
	margin-top: 30px;
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





</style>

<%@include file="../layout/header.jsp" %>

<body>
<div id="subvisual">
    <div id="subvisual-A">
        <p id="subv-title">득근상점</p>
<!--         <p id="subv-content">나의 오늘 운동기록을 매일매일 기록해 봐요</p> -->
    </div>
</div>
<div id="twoDepth">
    <div id="twoDepth-list">
        <a href="/map/find">운동 시설 추천</a>
        <a href="/dghelper/healthrecord">운동 일기장</a>
        <a href="/dghelper/healthtest">운동 성향 테스트</a>
        <a href="/dghelper/healthguide">칼로리 사전</a>
        <a href="/dghelper/dgmagotchi">득근이 키우기</a>
    </div>
</div>
<!-- <div class="rewards-container"> -->
<!-- 	<a href="/store/view"> -->
<!-- 		<div class="thumbnail"> -->
<!-- 			<div onclick=""> -->
<!-- 			</div> -->
<!-- 			<div class="like-ani-default like-ani-6359">♥</div> -->
<!-- 			<div class="like-section like-section-6359" onclick="Landing.clickLike(6359)"> -->
<!-- 			<span id="likeCount">50</span> -->
<!-- 			" ♥ " -->
<!-- 		</div> -->
<!-- 		</div> -->
<!-- 	<input type="hidden" name="csrftoken" id="csrftoken" value="957ef7cb-4e22-401c-afd8-31a5d3db2cfc" /> -->
<!-- 	</a> -->


<h1>게시판 리스트</h1>
<hr>

<!-- <table class="table table-striped table-hover table-condensed"> -->
<!-- <thead> -->
<!-- 	<tr> -->
<!-- 		<th style="width: 10%;">상품번호</th> -->
<!-- 		<th style="width: 45%;">상품명</th> -->
<!-- 		<th style="width: 20%;">가격</th> -->
<!-- 		<th style="width: 10%;">조회수</th> -->
<!-- 		<th style="width: 15%;">등록일</th> -->
<!-- 	</tr> -->
<!-- </thead> -->
<!-- <tbody> -->
<%-- <c:forEach items="${list }" var="StoreDto"> --%>
<!-- 	<tr> -->
<%-- 		<td>${StoreDto.prodNo }</td> --%>
<%-- 		<td><a href="/store/view?prodNo=${StoreDto.prodNo }">${StoreDto.pName }</a></td> --%>
<%-- 		<td>${StoreDto.pPrice }</td> --%>
<%-- 		<td>${StoreDto.pHit }</td> --%>
<%-- 		<td><fmt:formatDate value="${StoreDto.pDate }" pattern="yy-MM-dd HH:mm:ss"/></td> --%>
<!-- 	</tr> -->
<%-- </c:forEach> --%>
<!-- </tbody> -->
<!-- </table> -->

<!-- <div class="rewards-container"> -->
<%-- <c:forEach items="${list }" var="StoreDto"> --%>
<!-- <ul class="rewards-list"> -->
<!-- 	<li> -->
<%-- 		<a href="/store/view?prodNo=${StoreDto.prodNo }">${StoreDto.pName }</a> --%>

<!-- <!-- 		<input type="hidden" name="csrftoken" id="csrftoken" value="" /> --> -->
<!-- 		<img src=""> -->
<!-- 		<div class="reward-info"> -->
<!-- 			<div class="label-tag-box"></div> -->

<!-- 			<div class="meta"> -->
<!-- 				<span class="snowflake-cost">  -->
<!-- 				<i class="fa fa-snowflake-o" -->
<%-- 					aria-hidden="true"></i> 가격 : ${StoreDto.pPrice } 원 --%>
<!--  				</span> <br> -->
<%--  				<span class="quantity"> 조회수 : ${StoreDto.pHit } </span> --%>
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</li> -->
<!-- </ul> -->
<%-- </c:forEach> --%>
<!--  </div><div class="rewards-container"> 끝 -->






	<div class="store-list">
		<c:forEach items="${list }" var="StoreDto">

			<div class="store">
				<div class="store-thumbnail">
<%-- 					<img src="/resources/img/chl_thumbnail/chl_thumb${storenge.storengeNo }.jpg" onerror="this.src='https://shared-comic.pstatic.net/thumb/webtoon/796152/thumbnail/thumbnail_IMAG10_a500c803-99ec-4bf8-92d1-b2a5c60c9789.jpg'"> --%>
				</div>
				<div class="store-content">
					<ul>
						<li>
							<a href="/store/view?prodNo=${StoreDto.prodNo }">${StoreDto.pName }</a>
						</li>
						<li>가격 : ${StoreDto.pPrice } 원</li>
						<li>조회수 : ${StoreDto.pHit } 
						</li>
					</ul>
				</div>
			</div>
		</c:forEach>
	</div>

</body>

<%@include file="../layout/footer.jsp" %>
</html>

