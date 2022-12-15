<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../layout/header.jsp" %>

<!-- --------------------------스크립트 시작 -->
<script type="text/javascript">
$(document).ready(function() {
	

})

function pointCompare(rankingNo, userNo) {
	console.log(".goChat 클릭")
	
	$.ajax({
			
		type:"post"			//요청 메소드
		, url: "/chat/pointCompare"	//요청 URL
		, data: { 
			rankingNo : rankingNo
		}   //요청 파라미터
			
	, dataType: "html"		//응답 데이터 형식
	, success: function( res ) {
		console.log("AJAX 성공")
		console.log("res : " + res )
		
		if( res == "ok" ){
			location.href = "/chat/createChatRoom?userNo=" + userNo;
		} else {
			alert("보유하고 계신 포인트가 부족합니다.")
		}
		
	}
		
	, error: function() {
		console.log("AJAX 실패")
	}	
		
	})
}


</script>





<!-- --------------------------스타일 시작 -->
<style type="text/css">

button{
	border: none;
	outline: none;
}

h2{
	width: 1600px;
	margin: 0 auto;
	text-align: center;
}

#listPg {
	width: 100%;
}


#inner {
	width: 1400px;
	height: 100%;
	margin: 0 auto;
}

.list {
	display: flex;
    flex-wrap: wrap;
}

.list li {
	display: flex;
    flex-wrap: wrap;
	width: 440px;
    margin-right: 40px;
    margin-bottom: 40px;
/*     border: 1px solid #e2e2e2; */
	box-shadow: 1px 1px 8px 0px rgb(0 0 0 / 14%);
    border-radius: 20px;
    padding: 20px;
}

.list li:nth-child(3n) {
    margin-right: 0px;
}   

#photo {
	width: 160px;
	height: 160px;
	background-color: #efefef;
	border-radius: 20px;
	text-align: center;
	line-height: 160px;
	font-size: 18px;
}

#rightCon {
	width: 236px;
	padding-left: 20px;
	padding-top: 10px;
}

#rightTop {
	height: 32px;
}


#name {
	font-size: 21px;
	font-weight: 700;
	color: #222;
	float: left;
}

#ranking {
	height: 32px;
	float: right;
	font-size: 15px;
	font-weight: 600;
	color: #222;
}

#job {
	color: #333;
	font-size: 13px;
	font-weight: 600;
	color: #7ca3f5;
	margin-bottom: 10px;
	border: 1px solid #7ca3f5;
	padding: 2px 5px;
	width: fit-content;
}

#intro {
	color: #666;
	font-size: 15px;
	height: 40px;
}

#rightBottom {
	height: 40px;
	vertical-align: bottom;
	display: flex;
	justify-content: space-between;
}

#point {
	display: flex;
    align-items: center;
}

#point > img {
	width: 30px;
	height: 30px;
}

#point > span {
	font-size: 16px;
	font-weight: 600;
	color: red;
	margin-left: 2px;
}


#goChat {
	width:100px;
	background-color: #7ca3f5;
	border-radius: 20px;
	padding: 10px;
	font-size: 14px;
	text-align: center;
	color: #ffffff;
	font-weight: 700;
}


/* 2dept menu */

#twoDepth-list {
	width: 1400px;
}

#twoDepth-list a:nth-child(1){
	color: #b571e9;
	border-bottom: 2px solid #b571e9;
	margin-top: 1px;
	font-weight: 700;
}

#twoDepth-list a {
    width: 50%;
}


/* 페이징 부분 */

.text-center {
	display: flex;
	justify-content: center
}

.pagination {
	display: flex;
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



</style>

<body>
<!-- 1depth visual -->
<div id="subvisual">
	<div id="subvisual-A">
		<p id="subv-title">운동 질문하기</p>
		<p id="subv-content">챌린지, 운동을 하며 궁금했던 점을 멘토들에게 궁금한점을 물어보세요.</p>
	</div>
</div>
<!-- 2dept Menu -->
<div id="twoDepth">
	<div id="twoDepth-list">
		<a href="/chat/intro">멘토 리스트</a>
		<a href="/chat/chatRoom">내 채팅목록</a>
	</div>
</div>

<div class="big-container">
<h3 style="margin: 0 auto; width: 1200px; text-align: center;">멘토 리스트</h3>
</div>

<!-- 리스트 페이지 -->
<div id="listPg">
	<div id="inner">
		<ul class="list">
			<c:forEach items="${userList }" var="userList">
			<li>
				<div id="photo">${userList.userPhoto }</div>
				
				<!-- 오른쪽 텍스트 부분 -->
				<div id="rightCon">
					<!-- 상담 이름, 등급 -->
					<div id="rightTop">
						<div id="name">${userList.userNick }</div>
						<div id="ranking">${userList.rankingNo }등급</div>
						
					</div>
					
					<div id="job">${userList.userJob }</div>
					<div id="intro">${userList.userIntro }</div>
						
					<!-- 하단 포인트 채팅 -->
					<div id="rightBottom">
						
						<div id="point">
							<img src="/resources/img/dollar.png">
							
							<!-- 채팅 요구 포인트 5등급:1000, 4등급:700 3등급:400 -->
							
							<c:choose> 
							    <c:when test="${userList.rankingNo eq 5}">
							       <span>1000P</span>
							    </c:when>
							    <c:when test="${userList.rankingNo eq 4}">
							       <span>700P</span>
							    </c:when>
							    <c:otherwise>
							        <span>400P</span>
							    </c:otherwise>
							</c:choose> 
						</div> <!-- /point -->
						
<%-- 						<a href="/chat/createChatRoom?userNo=${userList.userNo }" id="goChat"> --%>
						<button id="goChat" onclick="pointCompare(${userList.rankingNo }, ${userList.userNo })">
							채팅하기
						</button>
<!-- 						</a> -->
					</div>
				</div> <!-- rightCon -->
				
			</li>
			</c:forEach>
		</ul>
	</div> <!-- inner -->
	
	
	<div class="text-center">
		<ul class="pagination pagination-sm">
	
		<%-- 첫 페이지로 이동 --%>
		<c:if test="${paging.curPage ne 1 }">
			<li><a href="/chat/intro">&larr; 처음</a></li>	
		</c:if>
		
		
		<%-- 이전 페이지로 가기 --%>
		<c:if test="${paging.curPage > 1 }">
			<li><a href="/chat/intro?curPage=${paging.curPage - 1 }">&lt;</a></li>
		</c:if>
		
		<%-- 이전 페이지로 가기 (이전으로 갈 페이지 없을때)--%>
		<c:if test="${paging.curPage <= 1 }">
			<li><a>&lt;</a></li>
		</c:if>
		
			
		<%-- 페이징 리스트 --%>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="i">
		<c:if test="${paging.curPage eq i }">
			<li class="active"><a href="/chat/intro?curPage=${i }">${i }</a></li>
		</c:if>
		<c:if test="${paging.curPage ne i }">
			<li><a href="/chat/intro?curPage=${i }">${i }</a></li>
		</c:if>
		</c:forEach>
	
		
		
		<%-- 다음 페이지로 가기 --%>
		<c:if test="${paging.curPage < paging.totalPage }">
			<li><a href="/chat/intro?curPage=${paging.curPage + 1 }">&gt;</a></li>
		</c:if>
		
		<%-- 다음 페이지로 가기 (다음으로 갈 페이지 없을때) --%>
		<c:if test="${paging.curPage >= paging.totalPage }">
			<li><a>&gt;</a></li>
		</c:if>
		
	
		<%-- 끝 페이지로 이동 --%>
		<c:if test="${paging.curPage ne paging.totalPage }">
			<li><a href="/chat/intro?curPage=${paging.totalPage }" ><i class="fa-regular fa-chevrons-right"></i></a></li>	
		</c:if>
		
		</ul><i class="fa-solid fa-chevrons-right"></i>
	</div>
	
</div>




</body>
<%@include file="../layout/footer.jsp" %>
</html>