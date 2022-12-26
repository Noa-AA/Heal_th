<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">

	var ws = new WebSocket("ws://localhost:8888/chat");

	ws.onmessage = onMessage;
	ws.onclose = onClose;

	// 메시지 전송
	function sendMessage() {
		ws.send($("#msgInput").val());
	}

	// 서버로부터 메시지를 받았을 때
	function onMessage(msg) {
		var data = msg.data;
		var date = new Date();
		
		$('#chatArea').scrollTop($('#chatArea')[0].scrollHeight);
		
		console.log( data )
		
		
		//12시 넘으면 오후 12시 안넘으면 오전 표시
		if( date.getHours() >= 12 ) {
			var dateInfo = "오후 " + (date.getHours()-12) + ":" + date.getMinutes();
		} else {
			var dateInfo = "오전 " + date.getHours() + ":" + date.getMinutes();
		}
		
		var socMsg = data.split(" : ");

//		일반 메세지일때
// 		socMsg[0] : 보낸사람닉네임  &  socMsg[1] : 메세지 컨텐츠 내용  &  socMsg[2] : 룸번호
	
//		미리보기 메세지일때
// 		socMsg[0] : 보낸사람닉네임  &  socMsg[1] : "listchat"(구별자)  &  socMsg[2] : 메세지 컨텐츠 내용  &  socMsg[3] : 룸번호
		
//		이미지 메세지일때
// 		socMsg[0] : 보낸사람닉네임  &  socMsg[1] : "+IMG+"(구별자)  &  socMsg[2] : 파일이름  &  socMsg[3] : 룸번호
		
		//일반 메세지
		if ( socMsg[0] == "${senderNick }" && socMsg[1] != "listChat" && socMsg[1] != "+IMG+" ) {
			$("#messages").append( "<div id='senderMsg'><span id='timeS'>" + dateInfo + "</span><a id='msgS'>" + socMsg[1] + "</a></div>");
		} else if ( socMsg[0] != "${senderNick }" && socMsg[1] != "listChat" && socMsg[1] != "+IMG+" ) {
			$("#messages").append( "<div id='receiverMsg'><a id='msgR'>" + socMsg[1] + "</a><span id='timeR'>" + dateInfo + "</span></div>");
		} 
		
		//왼쪽 미리보기 메세지
		if ( socMsg[1] === "listChat" ) {
			$("."+socMsg[3]).html( socMsg[2] );
			$('#myId').after( $("."+socMsg[3]).parents("button") );
		} 
		 
		//이미지 메세지
		if ( socMsg[0] == "${senderNick }" && socMsg[1] == "+IMG+"){
			$("#messages").append( "<div id='senderImg'><span id='timeImgS'>" + dateInfo + "</span><img src='${pageContext.request.contextPath}/upload/" + socMsg[2] + "' id='imgS' ></div>");
		} else if ( socMsg[0] != "${senderNick }" && socMsg[1] == "+IMG+") {
			$("#messages").append( "<div id='receiverImg'><img src='${pageContext.request.contextPath}/upload/" + socMsg[2] + "' id='imgR' ><span id='timeImgR'>" + dateInfo + "</span></div>");
		}

		
	}

	// 서버와 연결을 끊었을 때
	function onClose(evt) {
		$("#messages").append("연결 끊김");

	}
	
	
</script>


