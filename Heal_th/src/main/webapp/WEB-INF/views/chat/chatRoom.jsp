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

#backGround{
	width: 800px;
	height: 500px;
	margin: 0 auto;
}

#roomMenu {
	width: 200px;
	float: left;
}

.roomBtn {
	width: 200px;
	height: 50px;
	font-size: 18px;
	background-color: #efefef;
	text-align: center;
	border: 1px solid #ddd;
	line-height: 50px;
	margin-bottom: 6px;
}

#result {
	float: right;
}


</style>

<body>

<h1>아아디 : ${userId }님의 채팅목록 </h1>
<hr>


<div id="backGround">
	
	<div id="roomMenu">
		<c:forEach items="${roomList }" var="room">
<%-- 			<div class="room" onclick="goChat(${room.roomNo })"> --%>
				<button class="roomBtn" onclick="goChat(${room.roomNo })" >
					<span class="roomSp">${room.userNick }</span>
				</button>
<!-- 			</div> -->
		</c:forEach>
	</div>
	
	<div id="result"></div>
</div>



</body>

<jsp:include page="webSocketArea.jsp" />

</html>