<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script><!-- 필수!!!!!!! -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script><!-- 필수!!!!!!! -->
<script type="text/javascript">
$(document).ready(function(){
	function checkPopup() {
		if($.cookie('checkCookie')!="check"){
			console.log("쿠키 없음")
			window.open('/check/check', '_blank','width=500, height=500, left=600, top=200');
		}else{
			console.log("쿠키 있음")
		}
	}
	checkPopup()
})
</script>
</head>
<body>
메인
</body>
</html>