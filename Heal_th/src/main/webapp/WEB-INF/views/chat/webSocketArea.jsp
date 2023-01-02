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
		if( date.getHours() >= 12 &&  date.getHours() >= 22 ) {
			var dateInfo = "오후 " + (date.getHours()-12) + ":" + date.getMinutes();
		
		//시간이 한자리수일때는 0을 붙인다
		} else if( date.getHours() >= 12 &&  date.getHours() < 22 ){
			var dateInfo = "오후 " + "0" + (date.getHours()-12) + ":" + date.getMinutes();
	
		} else if ( date.getHours() < 12 &&  date.getHours() >= 10 ) {
			var dateInfo = "오전 " + date.getHours() + ":" + date.getMinutes();
			//시간이 한자리수일때는 0을 붙인다
		} else {
			var dateInfo = "오전 " + "0" + date.getHours() + ":" + date.getMinutes();
		}
		
		var socMsg = data.split(" : ");

//		일반 메세지일때
// 		socMsg[0] : 보낸사람닉네임  &  socMsg[1] : 메세지 컨텐츠 내용  &  socMsg[2] : 룸번호
	
//		미리보기 메세지일때
// 		socMsg[0] : 보낸사람닉네임  &  socMsg[1] : "listchat"(구별자)  &  socMsg[2] : 메세지 컨텐츠 내용  &  socMsg[3] : 룸번호
		
//		이미지 메세지일때
// 		socMsg[0] : 보낸사람닉네임  &  socMsg[1] : "+IMG+"(구별자)  &  socMsg[2] : 파일이름  &  socMsg[3] : 룸번호
		
		//일반 메세지
		if ( socMsg[0] == "${senderNick }" && socMsg[1] != "listChat" && socMsg[1] != "+IMG+" && socMsg[1] != "+FILE+" ) {
			$("#messages").append( "<div class='senderMsg'><span class='timeS'>" + dateInfo + "</span><a class='msgS'>" + socMsg[1] + "</a></div>");
		} else if ( socMsg[0] != "${senderNick }" && socMsg[1] != "listChat" && socMsg[1] != "+IMG+" && socMsg[1] != "+FILE+" ) {
			$("#messages").append( "<div class='receiverMsg'><a class='msgR'>" + socMsg[1] + "</a><span class='timeR'>" + dateInfo + "</span></div>");
		} 
		
		//왼쪽 미리보기 메세지
		if ( socMsg[1] === "listChat" ) {
			$("."+socMsg[3]).html( socMsg[2] + "<span class='timeView'> " + dateInfo + "</span>");
			$('#myId').after( $("."+socMsg[3]).parents("button") );
		} 
		 
		//이미지 메세지
		if ( socMsg[0] == "${senderNick }" && socMsg[1] == "+IMG+"){
			$("#messages").append( "<div class='senderImg'><span class='timeImgS'>" + dateInfo + "</span><img src='${pageContext.request.contextPath}/upload/" + socMsg[2] + "' class='imgS' ></div>");
		} else if ( socMsg[0] != "${senderNick }" && socMsg[1] == "+IMG+") {
			$("#messages").append( "<div class='receiverImg'><img src='${pageContext.request.contextPath}/upload/" + socMsg[2] + "' class='imgR' ><span class='timeImgR'>" + dateInfo + "</span></div>");
		}
		
		//파일 메세지
		if ( socMsg[0] == "${senderNick }" && socMsg[1] == "+FILE+"){
			$("#messages").append( "<div class='senderMsg'><span class='timeS'>" + dateInfo + "</span><a href='/upload/" + socMsg[2] + "' download='" + socMsg[2] + "' class='msgS'>" + socMsg[2] + "</a></div>");
		} else if ( socMsg[0] != "${senderNick }" && socMsg[1] == "+FILE+") {
			$("#messages").append( "<div class='receiverMsg'><a href='/upload/" + socMsg[2] + "' download='" + socMsg[2] + "' class='msgR'>" + socMsg[2] + "</a><span class='timeR'>" + dateInfo + "</span></div>");
		}

		
	}

	// 서버와 연결을 끊었을 때
	function onClose(evt) {
		$("#messages").append("예기치 못한 오류로 연결이 끊겼습니다. 새로고침을 해주세요.");

	}
	
	
</script>


