<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="./layout/header.jsp" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script><!-- 이거 -->
<script type="text/javascript">
$(document).ready(function(){
	   <%-- 여기부터 --%>
	   function checkPopup() {
	      var sessionData = <%=session.getAttribute("userNo")%>
	      if(null==sessionData || !sessionData){// 로그인 안됐을경우
	      }else{
	         if($.cookie('checkCookie'+sessionData)!="check"+sessionData){
	            console.log("쿠키 없음")
	            window.open('/check/check', '_blank','width=500, height=700, left=600, top=200');
	            $.ajax({
	               type: "get"
	               ,url: "/check/cookie"
	               ,data: {}
	               ,dataType: "html"
	               ,success: function(res){
	                  console.log("cookie 설정 성공")
	               }
	               ,error: function(){
	                  console.log("cookie 설정 실패")
	               }
	            })
	         }else{
	            console.log("쿠키 있음")
	         }
	      }
	   }
	   checkPopup()
	   <%-- 여기까지 --%>
	})
</script>
<style type="text/css">
body {
	padding: 0;
}

#banner {
	position:relative;
	top:-60px;
	width:2000px;
	margin:0 auto;
}

.main-first-wrap {
	width: 1100px;
	margin: 0 auto;
	display: flex;
	padding-bottom: 120px;
}

.main-first-wrap img {
	width: 65%;
}

.main-first-wrap .left {
	width: 750px; 
	margin: 10px;
	display: flex;
	margin-top: 50px;
    justify-content: center;
}

.main-first-wrap .right {
	width: 550px;
	margin: 10px;
	display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
}

.main-second-wrap {
	width: 100%;
	height: 200px;
	display: flex;
	justify-content: center;
}

.main-second-wrap img {
	width: 90px;
}

.main-second-wrap a {
    font-size: 32px;
}

.main-second-wrap a:hover {
    font-size: 35px;
}

.main-second-wrap #first {
	width: 300px;
	display: flex;
	justify-content: center;
    align-items: center;
    margin: 20px;
    border-radius: 3px;
    flex-direction: column;
}

.main-second-wrap #second {
	width: 300px;
	display: flex;
	justify-content: center;
    align-items: center;
    margin: 20px;
    border-radius: 3px;
    flex-direction: column;
}

.main-second-wrap #third {
	width: 300px;
	display: flex;
	justify-content: center;
    align-items: center;
    margin: 20px;
    border-radius: 3px;
    flex-direction: column;
}

.main-second-wrap #fourth {
	width: 300px;
	display: flex;
	justify-content: center;
    align-items: center;
    margin: 20px;
    border-radius: 3px;
    flex-direction: column;
}

.main-third-wrap {
	width: 1500px;
	margin: 0 auto;
	margin-top: 120px;
}

.main-fourth-wrap {
	width: 1500px;
	margin: 0 auto;
	margin-top: 100px;
	text-align: center;
}

.newsroom-wrap {
	display: flex;
	margin: 0 auto;
	padding: 10px;
}

.main-fourth-wrap #newsroom-first {
	width: 30%;
	height: 300px;
	border: 1px solid silver;
	margin: 20px;
}

.main-fourth-wrap #newsroom-second {
	width: 30%;
	height: 300px;
	border: 1px solid silver;
	margin: 20px;
}

.main-fourth-wrap #newsroom-third {
	width: 30%;
	height: 300px;
	border: 1px solid silver;
	margin: 20px;
}

body {
	overflow-x: hidden;
}


/* top3 users 부분------------------ */
#listPg {
	width: 100%;
	margin-top: 60px;
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
	box-shadow: 1px 1px 8px 0px rgb(0 0 0 / 10%);
    border-radius: 20px;
    padding: 20px;
}

.list li:nth-child(3n) {
    margin-right: 0px;
}   

.profilePhoto {
	width: 160px;
	height: 160px;
	background-color: #efefef;
	border-radius: 20px;
	text-align: center;
	line-height: 160px;
	font-size: 18px;
}

.profilePhoto > img {
	width: 160px;
}

.rightCon {
	width: 236px;
	padding-left: 20px;
	padding-top: 10px;
}

.rightTop {
	height: 32px;
}


.name {
	font-size: 21px;
	font-weight: 700;
	color: #222;
	float: left;
}

.ranking {
	height: 32px;
	float: right;
	font-size: 15px;
	font-weight: 600;
	color: #222;
}

.job {
	color: #333;
	font-size: 13px;
	font-weight: 600;
	color: #7ca3f5;
	margin-bottom: 10px;
	border: 1px solid #7ca3f5;
	padding: 2px 5px;
	width: fit-content;
}

.intro {
	color: #666;
	font-size: 15px;
	height: 40px;
	text-align: left;
}

.rightBottom {
	height: 40px;
	vertical-align: bottom;
	display: flex;
	justify-content: space-between;
}

.point {
	display: flex;
    align-items: center;
}

.point > img {
	width: 30px;
	height: 30px;
}

.point > span {
	font-size: 16px;
	font-weight: 600;
	color: red;
	margin-left: 2px;
}

.point > p {
	font-size: 15px;
	font-weight: 600;
}

.bestMentor {
	font-size: 40px;
	font-weight: 600;  
}


</style>
<body>
<div id="banner">
	<img src="/resources/img/main-banner.png"/>
</div>
	<div class="main-first-wrap">
		<div class="left">
			<img src="/resources/img/main-model.png"/>
		</div>
		<div class="right">
			<h1>운동의 패러다임을 바꾸다</h1><br><br>
			<p>Heal_th는 누구나 건강한 삶을 누리는 세상을 꿈꿉니다.</p>
			<p>이러한 뜻을 함께하는 사람들이 모여 도전과 성장, 소통과 협력으로</p>
			<p>고운세상의 아름다운 문화를 만들어 갑니다.</p>
			<p>모두가 건강해지는 그날까지 Heal_th와 함께해요.</p>
		</div>
	</div>
	<div class="main-second-wrap">
		<div id="first">
			<p><img src="/resources/img/challenge.gif"></p>
			<a href="/challenge/list">Challenge</a> 
		</div>
		<div id="second">
			<p><img src="/resources/img/chatting.gif"></p>
			<a href="/chat/intro">Chatting</a>
		</div>
		<div id="third">
			<p><img src="/resources/img/helper.gif"></p>
			<a href="/dghelper/healthtest">Helper</a>
		</div>
		<div id="fourth">
			<p><img src="/resources/img/shopping.gif"></p>
			<a href="/store/list">Store</a>
		</div>
	</div>
<!-- 	<div class="main-third-wrap">
		<h1>WHO WE ARE</h1>
		<p>어쩌구저쩌구</p>
	</div> -->
	
	<div class="main-fourth-wrap">
		<h1 class="bestMentor">Best Mentor</h1>
		
		<div id="listPg">
			<div id="inner">
				<ul class="list">
					<c:forEach items="${topUserList }" var="userList">
					<li>
						<c:if test="${not empty userList.storedName }">
							<img src="${pageContext.request.contextPath}/upload/${userList.storedName}" class="profilePhoto">
						</c:if>
						<c:if test="${empty userList.storedName }">
							<img src="/resources/img/chat_default.png" class="profilePhoto">
						</c:if>
						
						<!-- 오른쪽 텍스트 부분 -->
						<div class="rightCon">
							<!-- 상담 이름, 등급 -->
							<div class="rightTop">
								<div class="name">${userList.userNick }</div>
		<!-- 						<div class="ranking">햇병아리 등급</div> -->
								<c:choose> 
									<c:when test="${userList.rankingNo eq 1 }">
									      <div class="ranking">햇병아리 등급</div>
									</c:when>
									<c:when test="${userList.rankingNo eq 2 }">
									      <div class="ranking">튼튼이 등급</div>
									</c:when>
									<c:when test="${userList.rankingNo eq 3 }">
									      <div class="ranking">트레이너 등급</div>
									</c:when>
									<c:when test="${userList.rankingNo eq 4 }">
									      <div class="ranking">마스터 등급</div>
									</c:when>
									<c:otherwise>
									        <div class="ranking">헬스신 등급</div>
									</c:otherwise>
								</c:choose> 
							</div>
							
							<div class="job">${userList.userJob }</div>
							<div class="intro">${userList.userIntro }</div>
								
							<!-- 하단 포인트 채팅 -->
							<div class="rightBottom">
								
								<div class="point">
									<p>[보유 포인트]</p>
									<span>${userList.point }P</span>
								</div> <!-- /point -->
								
							</div>
						</div> <!-- rightCon -->
						
					</li>
					</c:forEach>
				</ul>
			</div> <!-- inner -->
		</div>
	</div>
</body>
<jsp:include page="./layout/footer.jsp"/>
</html>