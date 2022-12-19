<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script><!-- 이건 있으면 패스 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script><!-- 이거 -->
<script type="text/javascript">
$(document).ready(function(){
	<%-- 여기부터 --%>
	function checkPopup() {
		var sessionData = <%=session.getAttribute("userNo")%>
		if(null==sessionData || !sessionData){// 로그인 안됐을경우
		}else{
			if($.cookie('checkCookie')!="check"){
				console.log("쿠키 없음")
				window.open('/check/check', '_blank','width=500, height=500, left=600, top=200');
			}else{
				console.log("쿠키 있음")
			}
		}
	}
	checkPopup()
	<%-- 여기까지 --%>
})
</script>
</head>
<body>
<h1>메인화면</h1>
<h1>메인화면</h1>
<h1>메인화면</h1>

</body>
</html>