<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../layout/header.jsp" %>

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {

	var createRoomNo = <%= request.getAttribute("createRoomNo")%>
	console.log("받은 createRoom : " + createRoomNo)
// 	var createRoomNo = null;
		
	if ( createRoomNo == null || createRoomNo =="" || createRoomNo == "undefined") {
		console.log ( "createRoomNo가 값이 없음" )
	} else {
		console.log( createRoomNo );
		goChat( createRoomNo );
	}
		
	
	/* 리스트를 누르면 해당리스트는 안눌리기 */
	$(".roomBtn").click(function() {
		
		$(this).attr("disabled", true);
		
		$(".roomBtn").not(this).attr("disabled", false);
		
		console.log(".roomBtnClick")
	})
	
	
})




function goChat(roomNo) {
	console.log(".room 클릭")
	
	$.ajax({
			
		type:"get"			//요청 메소드
		, url: "/chat/chatArea"	//요청 URL
		, data: { 
			roomNo : roomNo
		}   //요청 파라미터
			
	, dataType: "html"		//응답 데이터 형식
	, success: function( res ) {
		console.log("AJAX 성공")
			
		//응답 데이터 반영
		$("#result").html( res )
		
		
	}
		
	, error: function() {
		console.log("AJAX 실패")
	}	
		
	})
}

</script>



<style type="text/css">

button, input {
	background: transparent;
    border: none;
	outline: 0;
}

/* 전체 영역 */
#backGround{
	display: flex;
	justify-content: space-between;
	width: 1200px;
	height: 530px;
	margin: 0 auto;
}


/* 좌측 메뉴 영역 */
#roomMenu {
	box-sizing: border-box;
	border-left: 1px solid #eee;
	border-right: 1px solid #eee;
	border-bottom: 1px solid #eee;
}


/* 내 아이디 부분 */
#myId {
	display:flex;
	align-items: center;
	width: 300px;
	height: 70px;
	padding-left: 16px;
	font-size: 20px;
	font-weight: 700;
	color: #fff;
	background: linear-gradient(90deg, #7ca3f5 , #c583d6);
}

/* 방 리스트 버튼 */
.roomBtn {
	display: flex;
	align-items: center;
	width: 300px;
	height: 74px;
	background-color: #fff;
	border-top: 1px solid #eee;
	border-bottom: 1px solid #eee;
	line-height: 50px;
	margin-top: -1px;
}

.roomBtn:hover {
	background-color: #f0f0f0;
}

/* 왼쪽 사진부분 */
.left {
	display: flex;
	width: 44px;
	height: 44px;
	margin-right: 14px;
	margin-left: 16px;
}

.left > img {
	border-radius: 20px;
}


/* 오른쪽 닉네임, 마지막채팅 부분 */
.right {
	width: 70%;
	display: flex;
	flex-direction: column;
	align-items: flex-start;
	overflow: hidden;
}

.right > p {
	max-width: 210px;
	min-width: 0;
	height: 22px;
	text-overflow: ellipsis; 
	white-space: nowrap;
	overflow: hidden;
}

/* 닉네임 */
.reciverNick {
	display: flex;
	align-items: center;
	font-weight: 600;
	color: #222;
	font-size: 17px;
}

/* 마지막 채팅 */
.lastChat {
	display: flex;
	align-items: center;
	font-size: 15px;
	color: #666;
}

#result {
	float: right;
	width: 900px;
}


/* 2dept menu */

#twoDepth-list {
	width: 1400px;
}

#twoDepth-list a:nth-child(2){
	color: #b571e9;
	border-bottom: 2px solid #b571e9;
	margin-top: 1px;
	font-weight: 700;
}

#twoDepth-list a {
    width: 50%;
}

</style>

<body>
<!-- 1depth visual -->
<body>
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
<h3 style="margin: 0 auto; width: 1200px; text-align: center;">내 채팅목록</h3>
</div>


<div id="backGround">
	
	<div id="roomMenu">
		<div id="myId">
			${userId }
		</div>
		<c:forEach items="${roomList }" var="room">
		
<%-- 		<div class="room" onclick="goChat(${room.roomNo })"> --%>

			<button class="roomBtn" onclick="goChat(${room.roomNo })" >
				
				<div class="left">
					<img src="https://webimage.10x10.co.kr/eventIMG/2022/118925/etcitemban20220623180508.JPEG">
				</div>
				
				<div class="right">
					<p class="reciverNick">${room.userNick }</p>
					<p class="lastChat ${room.roomNo }">
						<!-- 같은 방번호일때 채팅 넣어주기 -->
						<c:forEach items="${lastChat }" var="lastChat">
						<c:if test="${room.roomNo == lastChat.roomNo }">
							${lastChat.chatContents }
						</c:if>
						</c:forEach> <!-- ${lastChat } -->
					</p>
				</div>
				
			</button>
				
<!-- 		</div> -->
		</c:forEach> <!-- ${roomList } -->
		
	</div>
	
	<div id="result"></div>
</div>



</body>

<jsp:include page="webSocketArea.jsp" />
<%@include file="../layout/footer.jsp" %>

</html>