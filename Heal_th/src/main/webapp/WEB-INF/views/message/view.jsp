<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../layout/header.jsp" %>
<style type="text/css">
.messageBox {
	position: absolute;
	top: 90px;
	right: 50px;
	width: 400px;
	height: 250px;
	border-radius: 15px;
	padding: 20px;
	box-shadow: 0 7px 20px rgb(0 0 0 / 17%);
	z-index: 1000;
	overflow-y: scroll;
}

.messageBox::-webkit-scrollbar {
	border-radius: 10px;
	width: 7px;
}

.messageBox::-webkit-scrollbar-thumb {
	border-radius: 10px;
	background: silver;
	width: 5px;
}
.messageBox:after {
    position: absolute;
    top: -13px;
    right: 45px;
    width: 0;
    height: 0;
    border-right: 11px solid rgba(0,0,0,0);
    border-bottom: 13px solid #fff;
    border-left: 11px solid rgba(0,0,0,0);
    content: "";
    filter: drop-shadow(0px 7px 20px rgba(0, 0, 0, 0.17));
}

#myAlert {
	position:fixed;
	top: 30px;
	right: 85px;
	z-index: 2000;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	$(".messageBox").hide();
	var count = 0;
	$("#myAlert").click(function(){
		
		if(count%2==0){
			$(".messageBox").show();
		} else if(count%2==1){
			$(".messageBox").hide();
		}
		count++;
	})
});
</script>
<body>
<button id="myAlert">알림</button>
<div class="messageBox">
	<table>
		<c:forEach items="${messageList }" var="msg">
			<tr>
				<th>${msg.messageDate }</th>
			</tr>
			<tr>
				<td>${msg.messageCon }</td>
			</tr>
		</c:forEach>
	</table>
</div>
</body>
</html>