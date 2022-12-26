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
			if($.cookie('checkCookie')!="check"){
				console.log("쿠키 없음")
				window.open('/check/check', '_blank','width=500, height=500, left=600, top=200');
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
	width: 550px;
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

.main-second-wrap p {
    font-size: 32px;
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
	margin-top: 100px;
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
</style>
<body>
<img src="/resources/img/main-banner.png" style="position:relative; top:-60px;"/>
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
			<p>Challenge</p> 
		</div>
		<div id="second">
			<p><img src="/resources/img/chatting.gif"></p>
			<p>Chatting</p>
		</div>
		<div id="third">
			<p><img src="/resources/img/helper.gif"></p>
			<p>Helper</p>
		</div>
		<div id="fourth">
			<p><img src="/resources/img/shopping.gif"></p>
			<p>Store</p>
		</div>
	</div>
<!-- 	<div class="main-third-wrap">
		<h1>WHO WE ARE</h1>
		<p>어쩌구저쩌구</p>
	</div> -->
	
	<div class="main-fourth-wrap">
		<h1>Community</h1>
		<div class="newsroom-wrap">
			<div id="newsroom-first"></div>
			<div id="newsroom-second"></div>
			<div id="newsroom-third"></div>
		</div>
	</div>
</body>
<jsp:include page="./layout/footer.jsp"/>
</html>