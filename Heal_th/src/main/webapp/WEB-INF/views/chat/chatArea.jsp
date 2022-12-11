<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


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
        var date = new Date();
        var dateInfo = date.getHours() + ":" + date.getMinutes();
        
        var id = data.split(" : ");
        
        if( id[0] == "${userId }" ){
        	$("#messages").append("<div id='senderMsg'><a id='timeS'>" + dateInfo + "</a><a id='msgS'>" + data + "</a></div>");
        } else {
        	$("#messages").append("<div id='receiverMsg'><a id='msgR'>" + data + "</a><a id='timeR'>" + dateInfo + "</a></div>");
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
	width: 500px;
	height: 500px;
	border: 1px solid #ccc;
	padding-top: 26px;
	
}

#senderMsg {
	text-align: right;
	margin-right: 20px;
	height: 40px;
	margin-bottom: 8px;
}
#senderMsg > #msgS {
	padding: 8px 16px;
	border-radius: 30px 2px 30px 30px;
	background-color: #7ca3f5;
	color: #fff;
	font-weight: 400;
	line-height: 40px;
	font-size: 15px;
}

#senderMsg > #timeS {
	width: 50px;
	vertical-align: bottom;
	padding-right: 5px;
	color: #888888;
	font-size: 12px;
	line-height: 22px;
}


#receiverMsg {
	text-align: left;
	margin-left: 20px;
	height: 40px;
	margin-bottom: 8px;
}

#receiverMsg > #msgR {
	padding: 8px 16px;
	border-radius: 2px 30px 30px 30px;
	background-color: #eeeeee;
	color: #222222;
	font-weight: 400;
	line-height: 40px;
	font-size: 15px;
}

#receiverMsg > #timeR {
	width: 50px;
	vertical-align: bottom;
	padding-left: 5px;
	color: #888888;
	font-size: 12px;
	line-height: 22px;
}


</style>

</head>

<body>

<h1>${roomNo.roomNo }번방</h1>
<hr>

<%	Date date = new Date(); %>
<c:set var="now" value="<%=new Date() %>" /> 

<h1></h1>
    
    <div>
   		유저 아이디 :${userId }<br>
    	<input type="text" id="msgInput" autocapitalize="off"/>
    	<input type="button" id="sendBtn" value="메세지 전송" /> 
<!--         <button onclick="openSocket();">Open</button> -->
<!--         <button onclick="send();">Send</button> -->
<!--         <button onclick="closeSocket();">close</button> -->
    </div>
    
    
<div id="chatArea">
    <div id="messages"><span></span></div>
</div>
        
	
	
	
	
	
	
	
	
	
	




</body>
</html>
