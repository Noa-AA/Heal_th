<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../layout/header.jsp" %>


<script type="text/javascript">

	
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
		
		$(this).
			
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

#roomBtn {
	float: left;
}

.room {
	width: 200px;
	height: 50px;
	font-size: 18px;
	background-color: #efefef;
	text-align: center;
	border: 1px solid #ddd;
	line-height: 50px;
}

#result {
	float: right;
}


</style>

<body>

<h1>아아디 : ${userId }님의 채팅목록 </h1>
<hr>


<div id="backGround">
	
	<div id="roomBtn">
		<c:forEach items="${roomList }" var="room">
			<div class="room" onclick="goChat(${room.roomNo })">
				<span class="roomSp">${room.roomNo }번방</span>
			</div>
		</c:forEach>
	</div>
	
	<div id="result"></div>
</div>



</body>


</html>