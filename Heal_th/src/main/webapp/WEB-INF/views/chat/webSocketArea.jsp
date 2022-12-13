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

		if (id[0] == "${senderNick }") {
			$("#messages").append( "<div id='senderMsg'><a id='timeS'>" + dateInfo + "</a><a id='msgS'>" + data + "</a></div>");
		} else if( id[0] != "${senderNick }" && id[0] != "createOk" ) {
			$("#messages").append( "<div id='receiverMsg'><a id='msgR'>" + data + "</a><a id='timeR'>" + dateInfo + "</a></div>");
		} else if (id[0] = "createOk") {
			$("#roomMenu").append( "<button class='roomBtn' onclick='goChat(${room.roomNo })' <span class='roomSp'>${room.userNick }</span> " )
		}
		

		//     console.log(data);
		//     $("#messages").append( data + "<br/>" );
	}

	// 서버와 연결을 끊었을 때
	function onClose(evt) {
		$("#messages").append("연결 끊김");

	}
	
	
</script>


