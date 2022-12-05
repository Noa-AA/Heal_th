<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">

$(document).ready(function(){
	
	$("#close").click(function(){
		window.close();
	 	opener.location.reload();
	})
});


</script>
<style type="text/css">
.container {
	position: relative;
	text-align: center;
	top: 170px;
}
</style>
</head>
<body>
	<div class="container">
		<p>인출신청이 완료되었습니다 !</p>
		<button id="close">닫기</button>
	</div>
</body>
</html>