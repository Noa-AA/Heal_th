<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    
 
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="/resources/img/favicon.ico" type="image/x-icon"/>
<meta charset="UTF-8">
<title>심장이 득근</title>

<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- 부트스트랩 Bootstrap 3 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<script type="text/javascript">
$(document).ready(function(){
	
	$("#menu > ul ").mouseover(function(){ 
		$('#dropMenu').slideDown('500'); 
		
	});
	
	$("#dropMenu").mouseleave(function(){ 
		$('#dropMenu').slideUp('500'); 
		
	});
	
	
})



</script>



<style type="text/css">

@import url('https://webfontworld.github.io/sunn/SUIT.css');

html, body, pre, h1, h2, h3, h4, h5, h6, dl, dt, dd, ul, li, ol, th, td, p, blockquote, form, fieldset, legend, menu, nav, section, hgroup, article, header, aside, footer, input, select, textarea, button {
    margin: 0;
    padding: 0;
    list-style:none;
    font-family: 'SUIT';
}

header {
	margin-bottom: 120px;
}

#topMenu {
	display: flex;
    align-items: center;
    height: 80px;
    background-color: #fff;
    position: fixed;
    z-index: 50;
    padding-left: 160px;
    box-shadow: 0 0 10px rgb(0 0 0 / 8%);
    top: 0;
    left: 0;
 	right: 0;
    justify-content: flex-start;
}

#topMenu h3 {
	position: absolute;
	left: 330px;
}

#adminMenuContainer {
    position: absolute;
    left: 0;
    top: 0;
    min-height: 940px;
    max-height: 940px;
    width: 300px;
	background: linear-gradient(to right, #3f94d6 0 , #1869a7);
    color: white; 
    padding: 15px;
	padding-left: 50px;
    z-index: 100;
}

#adminMenuContainer p {
	margin: 15px 0;
	font-size: 17px;
	position: relative;
	top: 70px;
}

.logo img {
    width: 60%;
}

hr {
    width: 300px;
    margin-top: 24px;
    border: 0;
    border-top: 1px solid #ffffff;
    opacity: 40%;
    position: absolute;
    left: 0;
}

html,body {
	background: #eee;
}

html {
	overflow-y: hidden;
}

body {
	width: 1540px;
}

table {
	width: 100%;
}

#adminMenuContainer a {
	color: white;
}

.big-container {
    width: 100%;
    margin-left: 340px;
    height: 784px;
    box-shadow: 1px 0px 10px 0px rgb(0 0 0 / 15%);
    background: #fff;
    padding: 40px;
}

</style>

</head>

<header class="hover">

	<div id="topMenu" class="">
		<h3>관리자 페이지</h3>
	</div>
	<div id="adminMenuContainer">
		<h1 class="logo">
			<a href="">
				<img src="/resources/img/logo_white.png" alt="득근득근">
			</a>		
		</h1>
		<hr>
		<p>사용자 관리</p> 
		<p><a href="/notice/list">게시글 관리</p>
		<p><a href="/product/list">상품 관리</p>
		<p>챌린지 관리</p>
		<p><a href="/admin/withdraw">득근머니 관리</a></p>
	</div>
	
</header>

<body> 


	<div class="big-container">

