<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>제발좀 되라 ㅡㅡㅡㅡ</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>

<script type="text/javascript">
$(document).ready(function() {

	$("#sendBtn").on("click", function() {
		sendMessage();
		$('#msgInput').val('')
	})

})

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
        var id = data.split(":");
        
        if(id[0] == ${userId }){
        	$("#messages").append( data + "<br/>" );
        }
        
//         console.log(data);
//         $("#messages").append( data + "<br/>" );
    }
    
    // 서버와 연결을 끊었을 때
    function onClose(evt) {
        $("#messages").append("연결 끊김");
 
    }

</script>

<style type="text/css">

#chatArea {
	width: 300px;
	height: 300px;
	border: 1px solid #ccc;
	
}

</style>

</head>

<body>
<h1></h1>
    
    <div>
   		유저 아이디 :${userId }<br>
    	<input type="text" id="msgInput" />
    	<input type="button" id="sendBtn" value="메세지 전송" /> 
<!--         <button onclick="openSocket();">Open</button> -->
<!--         <button onclick="send();">Send</button> -->
<!--         <button onclick="closeSocket();">close</button> -->
    </div>
    
    
<div id="chatArea">
    <div id="messages"></div>
</div>
        
	
	
	
	
	
	
	
	
	
	




</body>
</html>
