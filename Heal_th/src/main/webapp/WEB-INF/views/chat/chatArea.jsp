<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>제발좀 되라 ㅡㅡㅡㅡ</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css">


<script type="text/javascript">
$(document).ready(function() {

	$('#chatArea').scrollTop($('#chatArea')[0].scrollHeight);
	
	$("#sendBtn").on("click", function() {
		sendMessage();
		$('#msgInput').val('')
		$('#sendBtn').attr("disabled", true)
		$('#sendBtn').css('background-color', '#d8d8d8')
	})
	
	
	/* textArea에 글이 없으면 버튼이 비활성화 되게 */
	$('#msgInput').on("input", function() {
		if( $('#msgInput').val() == ''){      
			$('#sendBtn').attr("disabled", true)
			$('#sendBtn').css('background-color', '#d8d8d8')
		} else {
			$('#sendBtn').attr("disabled", false)
			$('#sendBtn').css('background-color', '#7ca3f5')
		}
			
	})
	
	
	/* 전송 버튼에 엔터는 섭밋되게 */
	$('#msgInput').on('keydown', function(event) {
        if (event.keyCode == 13)
            if (!event.shiftKey){
                event.preventDefault();
                $('#sendBtn').click();
            }
    })
    
    
    /* 검색 버튼~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
    $("#searchBtn").click(function() {
    	var txtVal = $("#searchText").val();
    	console.log( txtVal );
    	
    	
		var searchT = $("#messages > div > a:contains('" + txtVal + "')")   	
		$(searchT).css( 'color', 'red' );

		$(searchT).attr("tabindex", -1).focus();
		
    })
 
    
    
	})
	
	
	
/* 이미지 전송 */
/* input file onchange시 */
function fileUp() {
	
	var file = $('#file')[0].files[0];
	console.log("file : ", file)
	
	var formData = new FormData();
		
	formData.append("file", file);
		
	$.ajax({
		url: "/chat/fileup",
		type: "post",
		data: formData,
		processData: false,
		contentType: false,
		
		success: function( res ) {
			console.log("AJAX 성공")
			console.log("res : ", res)
			
			/* 결과값을 주소로  */
			ws.send( res );
		}
		, error: function(error) {
			console.log("AJAX 실패")

		}
		
	})
	
}


</script>

<style type="text/css">

a {
  text-decoration-line: none;
}

a:focus, a:hover {
    text-decoration: none;
    outline: none;
}

button {
	border: 0;
	outline: 0;
}

/* ----------------------------------------채팅 생기는부분 */

#chatArea {
	width: 900px;
	height: 470px;
	padding-top: 26px;
	overflow: hidden auto;
}

/* 채팅을 보냈을때 --------------------------- */
/* 내 채팅 */
#senderMsg {
	text-align: right;
	margin-right: 20px;
	margin-bottom: 8px;
}

#senderMsg > #msgS {
	padding: 9px 16px;
	border-radius: 30px 2px 30px 30px;
	background-color: #7ca3f5;
	color: #fff;
	font-weight: 400;
	font-size: 15px;
	display: inline-block;
	word-break:break-all;
 	max-width: 500px; 
 	min-height: 36px;
 	line-height: 18px;
 	text-align: left;
}

#senderMsg > #timeS {
	width: 50px;
	vertical-align: bottom;
	padding-right: 5px;
	color: #888888;
	font-size: 12px;
	line-height: 22px;
}

/* 상대 채팅 */
#receiverMsg {
	text-align: left;
	margin-left: 20px;
	margin-bottom: 8px;
}

#receiverMsg > #msgR {
	padding: 9px 16px;
	border-radius: 2px 30px 30px 30px;
	background-color: #eeeeee;
	color: #222222;
	font-weight: 400;
	font-size: 15px;
	display: inline-block;
	word-break:break-all;
 	max-width: 500px; 
 	min-height: 36px;
 	line-height: 18px;
 	text-align: left;
}

#receiverMsg > #timeR {
	width: 50px;
	vertical-align: bottom;
	padding-left: 5px;
	color: #888888;
	font-size: 12px;
	line-height: 22px;
}


/* 이미지를 보냈을때 --------------------------- */
/* 내가 보낸 이미지 */
#senderImg {
	text-align: right;
	margin-right: 20px;
	margin-bottom: 8px;
}

#senderImg > #imgS {
	max-width: 400px;
    max-height: 200px;
}

#senderImg > #timeImgS {
	width: 50px;
	vertical-align: bottom;
	padding-right: 5px;
	color: #888888;
	font-size: 12px;
	line-height: 16px;
}


/* 상대방이 보낸 이미지 */
#receiverImg {
	text-align: left;
	margin-left: 20px;
	margin-bottom: 8px;
}

#receiverImg > #imgR {
	max-width: 400px;
    max-height: 200px;
}

#receiverImg > #timeImgR {
	width: 50px;
	vertical-align: bottom;
	padding-left: 5px;
	color: #888888;
	font-size: 12px;
	line-height: 16px;
}

/* ----------------------------------------채팅 생기는부분 끝~~~~~ */



#chatBack {
	border: 1px solid #eee;
	margin-left: -1px;
	height: 700px;
}

#chatTop {
	display: flex;
	width: 900px; 
	height: 69px; 
	border-bottom: 1px solid #eee; 
	justify-content: flex-start;
	align-items: center;
}


/* 왼쪽 사진부분 */
.leftImg {
	margin-left: 20px;
	margin-right: 10px;
}

.leftImg > img {
	border-radius: 20px;
	width: 44px;
	height: 44px;
}

/* 상대방 닉네임 */
#myNick {
	width: 56px;
	font-size: 18px;
	font-weight: 600;
	color: #222;
} 

/* 인풋 박스 */
#searchText{
	width: 200px;
	height: 32px;
	border: 2px solid #7ca3f5;
	border-radius: 30px;
	transition: 0.4s;
	padding: 8px 12px;
	outline: none;
	font-size: 14px;
	margin-right: 10px;
}

#SearchDiv {
	width: 750px;
	display: flex;
    justify-content: flex-end;
}

#searchBtn {
  background-color: #fff;
  color: #7ca3f5;
  justify-content: center;
  align-items: center;
  border: none;
  font-size: 18px;
  font-weight: 400;
}




/* 메세지 전송 input 폼 */
#inputForm {
	display: flex;
    flex-direction: column;
    position: relative;
    margin: 16px;
    border: 1px solid #666;
    border-radius: 8px;
    height: 125px;
    -webkit-box-pack: justify;
    justify-content: space-between;
}

/* textAreaBox */
#msgInput {
	margin: 12px 12px 0px;
    width: calc(100% - 24px);
    height: 63px;
    line-height: 150%;
    padding: 0px;
    resize: none;
    font-size: 14px;
    border: none;
    outline: none;
}

/* 인풋박스 아래 기능과 버튼 */
#inputBottom  {
	display: flex;
    -webkit-box-pack: justify;
    justify-content: space-between;
    margin: 8px 10px;
}


#fileForm{
	display: flex;
    align-items: center;
    width: 32px;
    height: 32px;
    justify-content: center
}

#file {
    position: absolute;
    width: 20px;
    height: 20px;
    opacity: 0;
}

#file:hover {
	cursor: pointer;
}

#fileIcon {
	display: inline-flex;
	align-items: center;
	width: 22px;
    height: 22px;
    color: #666666;
    
	font-variation-settings:
	'FILL' 1,
	'wght' 400,
	'GRAD' 0,
	'opsz' 48
   
}

#sendBtn{
	display: flex;
	border-radius: 4px;
    width: 64px;
    height: 32px;
    line-height: 150%;
    font-weight: 500;
    font-size: 14px;
    color: #fff;
    background-color: #dddddd;
    justify-content: center;
    padding: 0px;
} 


</style>

</head>

<body>

<div id="chatBack">
	<!-- 상단 프로필 검색 부분 --------------------------- -->
	<div id="chatTop">
		<!-- 사진부분 -->
		<div class="leftImg">
			<img src="${pageContext.request.contextPath}/upload/${roomNo.storedName}">
		</div>
		<!-- 닉네임 -->
		<div id="myNick">
			${roomNo.userNick }
		</div>
		<div id="SearchDiv">
			<input id="searchText" type="text" name="keyword" >
			<button id="searchBtn" ><i class="fas fa-search"></i></button>
		</div>
	</div>
	
	
	
	<%	Date date = new Date(); %>
	<c:set var="now" value="<%=new Date() %>" /> 
	
	<div id="chatArea">
	    <div id="messages">
	    	<c:forEach items="${chatList }" var="chatList">
	    		 <c:set var = "str" value = "${chatList.chatContents }"/>
	    		<c:choose> 
	    		
	    			<%-- 자신의 채팅일때 ======================================== --%>
	    			<c:when test="${chatList.userNo eq userNo }" >
	    			
	    				<%-- 채팅이 이미지파일일때 --%>
	    				<c:if test="${fn:contains(str, '+IMG+')}">
	    					<div id='senderImg'>
	    						<span id='timeImgS'>
	    							<fmt:parseDate value="${chatList.chatTime }" var="date" pattern="yyyy.MM.dd HH:mm:ss"/>
									<fmt:formatDate value="${date }" pattern="a hh:mm" />
	    						</span>
	    						<img src="${pageContext.request.contextPath}/upload/${chatList.chatContents }" id="imgS">
	    					</div>
	    				</c:if>
	    				
	    				<%-- 채팅이 일반 채팅일때 --%>
	    				<c:if test="${not fn:contains(str, '+IMG+')}">
		    				<div id='senderMsg'>
		    					<span id='timeS'>
		    						<fmt:parseDate value="${chatList.chatTime }" var="date" pattern="yyyy.MM.dd HH:mm:ss"/>
									<fmt:formatDate value="${date }" pattern="a hh:mm" />
		    					</span>
		    					<a id='msgS'>
		    						${chatList.chatContents }
		    					</a>
		    				</div> 
	    				</c:if>
	    				
	    			</c:when>
	    			
	    			
	    			<%-- 상대방의 채팅일때 ======================================== --%>
	    			<c:otherwise>
	    				
	    				<%-- 채팅이 이미지파일일때 --%>
	    				<c:if test="${fn:contains(str, '+IMG+')}">
	    					<div id='receiverImg'>
	    						<img src="${pageContext.request.contextPath}/upload/${chatList.chatContents }" id="imgR">
	    						<span id='timeImgR'>
	    							<fmt:parseDate value="${chatList.chatTime }" var="date" pattern="yyyy.MM.dd HH:mm:ss"/>
									<fmt:formatDate value="${date }" pattern="a hh:mm" />
	    						</span> 
	    					</div>
	    				</c:if>
	    			
	    			
	    				<%-- 채팅이 일반 채팅일때 --%>
	    				<c:if test="${not fn:contains(str, '+IMG+')}">
		    				<div id='receiverMsg'>
		    					<a id='msgR'>
		    						${chatList.chatContents }
		    					</a>
		    					<span id='timeR'>
		    						<fmt:parseDate value="${chatList.chatTime }" var="date" pattern="yyyy.MM.dd HH:mm:ss"/>
									<fmt:formatDate value="${date }" pattern="a hh:mm" />
		    					</span>
		    				</div>
	    				</c:if>
	    			</c:otherwise>
	    			
	    		</c:choose>
	    	</c:forEach>
	    </div>
	</div>
	
	<!-- Input Button -->
	<div id="inputForm">
	    <textarea id="msgInput" autocapitalize="off" placeholder="메시지를 입력해주세요"></textarea>
	   	
	   	<div id="inputBottom">
	   		<div id="fileForm" >
	   			<span id="fileIcon"class="material-symbols-outlined">image</span>
	   			<input type="file" name="file" id="file" onchange="fileUp()">
	   		</div>
	   		
	    	<input type="button" id="sendBtn" value="전송" disabled /> 
	    </div><!-- inputBottom 끝 -->
	    
	</div>
    
</div> <!-- chatDiv -->      
	
	
		
	




</body>

<jsp:include page="webSocketArea.jsp" />


</html>
