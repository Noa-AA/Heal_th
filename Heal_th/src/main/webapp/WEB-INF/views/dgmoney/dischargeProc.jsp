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
@import url('https://webfontworld.github.io/sunn/SUIT.css');

html, body, pre, h1, h2, h3, h4, h5, h6, dl, dt, dd, ul, li, ol, th, td, p, blockquote, form, fieldset, legend, menu, nav, section, hgroup, article, header, aside, footer, input, select, textarea, button {
    margin: 0;
    padding: 0;
    list-style:none;
    font-family: 'SUIT';
}

a {
    color: #000;
    text-decoration: none;
}

.container {
	position: relative;
	text-align: center;
	top: 170px;
}

button {
	width: 108px;
    height: 36px;
    background-color: transparent;
    border: 2px solid #7ca3f5;
    color:#7ca3f5;
    font-size:17px;
    border-radius: 8px;
    cursor: pointer;
}

#close {
    margin-top: 10px;
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