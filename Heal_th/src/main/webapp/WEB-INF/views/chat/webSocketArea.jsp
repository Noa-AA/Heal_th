<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
		
		//12시 넘으면 오후 12시 안넘으면 오전 표시
		if( date.getHours() >= 12 ) {
			var dateInfo = "오후 " + (date.getHours()-12) + ":" + date.getMinutes();
		} else {
			var dateInfo = "오전 " + date.getHours() + ":" + date.getMinutes();
		}
		
		var id = data.split(" : ");
		var content = data.split(" : ");

// 		console.log(id);
		
		if ( id[0] == "${senderNick }" && id[1] != "listChat" ) {
			$("#messages").append( "<div id='senderMsg'><a id='timeS'>" + dateInfo + "</a><a id='msgS'>" + content[1] + "</a></div>");
		} else if ( id[0] != "${senderNick }" && id[1] != "listChat") {
			$("#messages").append( "<div id='receiverMsg'><a id='msgR'>" + content[1] + "</a><a id='timeR'>" + dateInfo + "</a></div>");
		} 
		
		if ( id[1] === "listChat" ) {
			$("."+id[3]).html( content[2] );
		}
		
		
		

	}

	// 서버와 연결을 끊었을 때
	function onClose(evt) {
		$("#messages").append("연결 끊김");

	}
	
	
</script>


