<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../layout/header.jsp" %>

<style type="text/css">
body{
	padding-top:0;
}
#mypage{
	width: 1200px;
	margin: 0 auto;
}
.infoTitle{
	font-size: 20px;
	margin: 10px 0;
}

#profileArea{

	width: 200px;
    position: fixed;
    left: 200px;
}

#pIcon{
	width:100px;
}

#manageInfo{
	margin-top: 29px;	
}

#intro{
	margin-top: 55px;	

}

</style>

<body>

<div id="mypage">
	<div id="title" style="text-align: center;">
		<h1> 마이페이지 </h1>
	</div>

	
	<div id="profileArea">
	
		<div id="profilePhoto">
			<a href="/mypage/setProfile"><img src="/resources/img/mypage/userprofile.png" id="pIcon"></a>
		</div>
		
		<div id="intro">
			한줄소개한줄소개한술소개
		
		</div>
	
		<div id="manageInfo">
			<div id="usersInfo">
				<ul id="updateInfo">
					<li class="infoTitle updateTitle" >회원 정보 관리</li>
					<li class="info updateUser"><a href="/mypage/updateInfo">회원 정보 변경</a></li>
					<li class="info updatePw"><a href="/mypage/updatePw">비밀번호 변경</a></li>
					<li class="info updayBody">Body 관리</li>
				
				</ul>
					
			</div>
		
		</div>
		
	</div>


</div>


</body>
</html>