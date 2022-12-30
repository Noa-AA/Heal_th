<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
 
 <style type="text/css">
 #profileArea{
 	width:30%;
 	height:100%;
 	background-color: white;
/* 	left: 200px; */
/* 	position: relative; */
/*     display: table-cell; */
/*     width: 395px; */
/*     background-color: #fff; */
/*     box-shadow: 5px 1px 8px 0 rgb(0 0 0 / 6%); */
/*     border-left: 1px solid rgba(0,0,0,.08); */
/*     vertical-align: top; */
/*     z-index: 1; */
/*     height: 1024px; */
/*     text-align: center; */
}
 
 .pIcon{
	width: 160px;
    height: 160px;
    border-radius: 71px;
}
 
#manageInfo{
	margin-top: 29px;	
}

#intro{
	margin-top: 55px;	

}
 
 </style>
 

	
		
	<div id="profileArea">
		<div id="profilePhoto">
			<c:if test="${storedName == null }">
				<a href="/mypage/setProfile"><img src="/resources/img/mypage/userprofile.png" class="pIcon"></a>
			</c:if>
			<c:if test="${storedName != null}">
				<a href="/mypage/setProfile"><img src="${pageContext.request.contextPath}/upload/${storedName.storedName}" class="pIcon"></a>
			</c:if>
		</div>
	
		
		<div id="intro">
			<c:choose>
				<c:when test="${userIntro.userIntro == null}">
					<a href="/mypage/setProfile">한 줄 소개를 작성해주세요</a>
				</c:when>
				<c:otherwise>
					<a href="/mypage/setProfile">${userIntro.userIntro}</a>
				</c:otherwise>
			
			</c:choose>
		</div>
	
		<div id="manageInfo">
			<div id="usersInfo">
				<ul id="updateInfo">
					<li class="infoTitle updateTitle" >회원 정보 관리</li>
					<li class="info updateUser"><a href="/mypage/updateInfo">회원 정보 변경</a></li>
					<li class="info updatePw"><a href="/mypage/updatePw">비밀번호 변경</a></li>
					<li class="info dropOut"><a href="/mypage/dropOut">탈퇴하기</a></li>
					<li class="info logOut"><a href="/mypage/logout">로그아웃</a></li>
					
				
				</ul>
					
			</div>
		
		</div>
		
	</div>


</html>