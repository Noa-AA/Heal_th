<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../layout/header.jsp" %>
<style type="text/css">
#body{
	padding-top:0;
}
#boxArea{
	margin: 0px 60px;
    height: 520px;

}
#findIdResult{
	width: 542px;
    height: 520px;
    position: relative;
    background-color: white;
    border-radius: 12px;
	box-shadow: 1px 1px 10px 0px rgb(0 0 0 / 15%);
    margin: 0 auto;

}

#resultId{
    position: absolute;
    font-size: 24px;
    top: 153px;
    text-align: center;
}



#btnArea{
  position: absolute;
    top: 300px;
    left: 165px;
}

#btnGotoLogin{
	width: 190px;
    height: 47px;
      border-radius: 8px;
	background-color: #7ca3f5;
	font-size: 17px;
	color:white;

}
</style>



<body id="body">
<div id="findIdResult">
	<div id="boxArea">
		<div id="resultId">
			<c:choose>
				<c:when test="${userId.jointype eq'Kakao'}">
					<span id="printIdK">회원님은 <span style="color:#FEE500; font-weight:bold;">카카오아이디</span>로 회원가입하셨습니다.</span>
					
				</c:when>
				<c:when test="${userId.jointype eq'Naver'}">">
					<span id="printIdN">회원님은 <span style="color:#03C75A; font-weight:bold;">네이버아이디</span>로 회원가입하셨습니다.</span>
				</c:when>	
				<c:otherwise>
					<span id="printId" style=" padding-left: 55px;">회원님의 아이디는 <span style="color: #7ca3f5; font-weight:bold;">${userId.userId }</span>입니다.</span>
				</c:otherwise>
			</c:choose>
		</div>
		<div id="btnArea">
			<button type="button" id="btnGotoLogin" onclick="location.href='/login/login'">로그인하러 가기</button>
		</div>

	</div>
</div>



</body>
</html>