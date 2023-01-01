<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
 
 <style type="text/css">
 
 #profileArea{
 	width: 30%;
    display: flex;
    background-color: #f9fbfc;
    height: 95%;
    justify-content: flex-end;
        position: absolute;
    box-shadow: 5px 1px 8px 0 rgb(0 0 0 / 6%);
    border-left: 1px solid rgba(0,0,0,.08);
    
}
 
 #boxSide{
 	 width: 318px;
    background-color: white;
    height:100%;
 }
.pIcon{
	width: 160px;
    height: 160px;
    border-radius: 71px;
}
 .infoTitle{
	font-size: 20px;
	margin: 10px 0;
}
 
 #profilePhoto{
 	 padding: 10px 20px;
    text-align: center;
 
 }
#manageInfo{
	
    padding: 30px;
}

#intro{
	margin-top: 8px;
    padding-left: 39px;
    height: 40px;
}
.info{
	z-index: 99;
} 

#pointMoney,#listOfActivies,#shoppingLst{

	margin-top: 40px;
}

.rankingImg,#moneyIcon,#pointIcon{
	width: 30px;
	height:30px;

}
#moneypointRanking{
	padding: 34px 20px;
}
.rankingTitle{

	font-size: 17px;
    margin-left: 15px;
}
#ranking{
    text-align: center;
}
#dgMoney{
	float: left;
  margin: 20px 20px 0 33px;
}
#point {
	    margin-top: 20px;
    text-align: center;
}
.moneyPointTitle{
	font-size: 17px;
}

 </style>
 

	
		
	<div id="profileArea">
		<div id="boxSide">
			<div id="profilePhoto">
				<c:if test="${storedName == null }">
					<a href="/mypage/setProfile"><img src="/resources/img/mypage/userprofile.png" class="pIcon"></a>
				</c:if>
				<c:if test="${storedName != null}">
					<a href="/mypage/setProfile"><img src="${pageContext.request.contextPath}/upload/${storedName.storedName}" class="pIcon"></a>
				</c:if>
			</div>
		
			
			<div id="moneypointRanking">
				<div id="ranking">
					<c:choose>
						<c:when test="${mypageInfo.rankingNo ==1}">
							<img src="/resources/img/mypage/chicken.png" class="rankingImg" >
							<span class="rankingTitle">햇병아리</span>
						</c:when>
							<c:when test="${mypageInfo.rankingNo ==2}">
							<img src="/resources/img/mypage/healthy.png" class="rankingImg" >
							<span class="rankingTitle">튼튼이</span>
						</c:when>
							<c:when test="${mypageInfo.rankingNo ==3}">
							<img src="/resources/img/mypage/trainer.png" class="rankingImg" >
							<span class="rankingTitle">트레이너</span>
						</c:when>
							<c:when test="${mypageInfo.rankingNo ==4}">
							<img src="/resources/img/mypage/master.png" class="rankingImg" >
							<span class="rankingTitle">마스터</span>
						</c:when>
							<c:when test="${mypageInfo.rankingNo ==5}">
							<img src="/resources/img/mypage/god.png" class="rankingImg" >
							<span class="rankingTitle">헬스신</span>
						</c:when>
					
					</c:choose>
				
				</div>
				<div id="dgMoney">
					<img src="/resources/img/mypage/dollarcoin.png" id="moneyIcon">
					<span class="moneyPointTitle"><a href="/dgmoney/view ">${mypageInfo.dgMoney}원</a></span>
				</div>
				<div id="point">
					<img src="/resources/img/mypage/point.png" id="pointIcon">
					<span class="moneyPointTitle">${mypageInfo.point}</span>
				</div>
			</div>
			<div id="intro">
				<c:choose>
					<c:when test="${mypageInfo.userIntro == null}">
						<a href="/mypage/setProfile">한 줄 소개를 작성해주세요</a>
					</c:when>
					<c:otherwise>
						<a href="/mypage/setProfile">${mypageInfo.userIntro}</a>
					</c:otherwise>
				
				</c:choose>
			</div>
		
			<div id="manageInfo">
					<div id="userInfoAdmin">
						<ul id="updateInfo">
							<li class="infoTitle updateTitle" >회원 정보 관리</li>
							<li class="info updateUser"><a href="/mypage/updateInfo">회원 정보 변경</a></li>
							<li class="info updatePw"><a href="/mypage/updatePw">비밀번호 변경</a></li>
							<li class="info dropOut"><a href="/mypage/dropOut">탈퇴하기</a></li>
							<li class="info logOut"><a href="/mypage/logout">로그아웃</a></li>
							
						</ul>
					</div>	
					<div id="pointMoney">
						<ul id="moneyAdmin">
							<li class="infoTitle dgMoneyPoint">득근머니/포인트</li>
							<li class="info dgMoney"><a href="/dgmoney/view ">득근머니</a></li>
							<li class="info dgPoint">득근포인트</li>
						</ul>
					</div>
					
					<div id="shoppingLst">
						<ul id="shopping">
							<li class="infoTitle payment">결제/장바구니</li>
							<li class="info cart"><a href="/store/cartlist">장바구니</a></li>
							<li class="info payList">구매 내역</li>
						</ul>
					
					</div>
					
					<div id="listOfActivies">
						<ul id="acitivies">
							<li class="infoTitle dgActivies">나의 활동 내역</li>
							<li class="info attend"><a href="/check/check" onclick="window.open('/check/check', '_blank','width=500, height=700, left=600, top=200'); return false;">출석확인</a></li>
							<li class="info scrap"><a href="/scrap/scrap">스크랩 목록</a></li>
						</ul>
					
					</div>
					
					
			</div>
		</div>
	</div>


</html>