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

<h1>${roomNo.userNick } : ${userNo }</h1>
<hr>

<%	Date date = new Date(); %>
<c:set var="now" value="<%=new Date() %>" /> 

<h1></h1>
    
    <div>
    	<input type="text" id="msgInput" autocapitalize="off"/>
    	<input type="button" id="sendBtn" value="메세지 전송" /> 
    </div>
    
    
<div id="chatArea">
    <div id="messages">
    	<c:forEach items="${chatList }" var="chatList">
    		<c:choose> 
    			<%-- 자신의 채팅일때 --%>
    			<c:when test="${chatList.userNo eq userNo }">
    				<div id='senderMsg'><a id='timeS'>${chatList.chatTime }</a><a id='msgS'>${chatList.chatContent }</a></div>
    			</c:when>
    			
    			<%-- 상대방의 채팅일때 --%>
    			<c:otherwise>
    				<div id='receiverMsg'><a id='msgR'>${chatList.chatContent }</a><a id='timeR'>${chatList.chatTime }</a></div>
    			</c:otherwise>
    		</c:choose>
    	</c:forEach>
    </div>
</div>
        
	
	
<%-- if (id[0] == "${senderNick }") { --%>
<!-- 	$("#messages").append( "<div id='senderMsg'><a id='timeS'>" + dateInfo + "</a><a id='msgS'>" + data + "</a></div>"); -->
<%-- } else if( id[0] != "${senderNick }" && id[0] != "createOk" ) { --%>
<!-- 	$("#messages").append( "<div id='receiverMsg'><a id='msgR'>" + data + "</a><a id='timeR'>" + dateInfo + "</a></div>"); -->
<!-- }  -->
	
	
	
	
	



</body>

<jsp:include page="webSocketArea.jsp" />


</html>
