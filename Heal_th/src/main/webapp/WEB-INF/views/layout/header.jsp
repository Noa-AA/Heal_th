<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
    
 
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

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<script type="text/javascript">
$(document).ready(function(){
	
	$("#menu > ul ").mouseover(function(){ 
		$('#dropMenu').slideDown('500'); 
		
	});
	
	$("#dropMenu").mouseleave(function(){ 
		$('#dropMenu').slideUp('500'); 
		
	});
	
	
	$("#goLogin").click(function() {
		alert("로그인 시 이용 가능합니다.");
		$(location).attr("href", "/login/login")
	})
		
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

a {
    color: #000;
    text-decoration: none;
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

input {
	padding-left: 5px;
}

header {
	margin-bottom: 140px;
}

#topMenu {
	display: flex;
    align-items: center;
    justify-content: space-between;
    height: 80px;
    background-color: #fff;
    position: fixed;
    z-index: 999;
    padding-left: 160px;
    box-shadow: 0 0 10px rgb(0 0 0 / 8%);
    top: 0;
    left: 0;
 	right: 0;
 	min-width: 1920px;
}


#topMenu .logo { 
 	width: 180px; 
 	height: 38px; 
} 

#topMenu .logo a {
    height: 100%;
    display: flex;
    align-items: center;
}

.logo a > img {
    width: 160px;
}


#menu {
	margin: 0 auto;
	width: 900px;
	display: flex;
    justify-content: center;
    height: 100%;
    position: absolute;
    left: 50%;
    top: 0;
    transform: translateX(-50%);
    font-size: 19px;
    font-weight: 600;
}

#menu > ul {
	display: flex;
    align-items: center;
    height: 100%;
}

#menu > ul > li {
	height: 100%;
    width: 160px;
}

#menu > ul > li > a {
	height: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
    white-space: nowrap;
    position: relative;
}

#menu > ul > li > a:hover {
	color: #7ca3f5;
}



#right {
	position: relative;
	height: 100%; 
	width: 460px; 
	background-color: #aaa; 
	float: right; 
/*  	background: linear-gradient(120deg, transparent 50px, #3f94d6 0 , #1869a7);  */
/*  	background: linear-gradient(120deg, transparent 50px, #02a8a8 0 , #4fb783);  */
 	background: linear-gradient(120deg, transparent 50px, #7ca3f5 0 , #c583d6); 
}

#right > ul {
    display: flex;
    justify-content: flex-end;
    align-items: center;
    height: 100%;
    padding: 0 160px 0 0;
}

#right > ul > li {
	margin-left: 26px;
	display: flex;
    align-items: center;
}


#login > img {
	margin-right: 6px;
	width: 20px;
	height: 20px;
}

#join > img {
	margin-right: 6px;
	width: 20px;
	height: 20px;
}

#right > ul > li > a {
	display: flex;
	align-items: center;
	font-size: 16px;
	font-weight: 400;
	color: #fff;
}

#right > ul > li > a > span {
	margin-right: 3px;
}

#alram {
	position: fixed;
	top:30px;
	right:30px;
}

#alram img {
	width:20px;
}

#alram button {
	background-color:transparent;
}

/* 로그인 아이콘 */
.lG, .lO, .mP, .person {
  font-variation-settings:
  'FILL' 0 ,
  'wght' 400,
  'GRAD' 0,
  'opsz' 48
  
}

#subvisual {
    position: absolute;
    top: 80px;
    width: 100%;
    height: 275px;
    background: linear-gradient(#fbf5fd 0 , #eaecfb);
    text-align: center;
}

#subvisual-A {
    height: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
}

#subvisual #subv-title {
    font-family: 'SUIT';
    font-size: 42px;
    font-weight: 700;
}

#subvisual #subv-content {
    font-family: 'SUIT';
	font-size: 15px;
	color: #888888;
}

#twoDepth {
	position: absolute;
    top: 355px;
    width: 100%;
    height: 70px;
    border-bottom: 1px solid silver;
}

#twoDepth-list {
	width: 1200px;
	margin: 0 auto;
	display: flex;
	height: 70px;
}

#twoDepth-list a {
	padding: 10px;
	display: flex;
    align-items: center;
    justify-content: center;
    color: #666666;
    font-size: 18px;
    font-weight: 400;
    width: 20%;
}

.footer {
    width: 100%;
    min-width: 1048px;
	bottom: 0;
	height: 100px;
	border-top: 1px solid #ddd;
	background: #fff;
	z-index: 99;
	margin-top: 160px;
} 

.footer-wrap {
	width: 1200px;
	margin: 0 auto;
	height: 100px;
	padding: 10px 0;
}

.big-container h3:nth-child(1){
	padding-bottom: 64px;
	padding-top: 10px;
	font-size: 38px;
    font-weight: 600;
}

body {
	padding-top: 355px;
}

#goLogin{
	cursor: pointer;
}

.messageBox {
	position: absolute;
	top: 65px;
	right: 5px;
	width: 400px;
	height: 250px;
	border-radius: 15px;
	padding: 20px;
	box-shadow: 0 7px 20px rgb(0 0 0 / 17%);
	z-index: 1000;
	overflow-y: scroll;
	background-color:white;
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


</style>

<script type="text/javascript">
$(document).ready(function(){
	$(".messageBox").hide();
	var count = 0;
	$("#myAlert").click(function(){
		
		if(count%2==0){
			
			$.ajax({
				type: "get",
				url: "/message/view",
				data: {
				},
				dataType: "html",
				success: (res)=>{
					console.log("AJAX 성공")
					$("#message-result").html(res)
				},
				error: ()=>{
					console.log("AJAX 실패")
				}
			})

			$(".messageBox").show();
		} else if(count%2==1){
			$(".messageBox").hide();
		}
		count++;
	})
});
</script>


</head>

<header class="hover">

	<div id="topMenu" class="">	
		<h1 class="logo">
			<a href="/main">
<!-- 				<img src="/resources/img/logo_blue.png" alt="득근득근"> -->
<!-- 				<img src="/resources/img/logo_green.png" alt="득근득근"> -->
				<img src="/resources/img/logo_purple.png" alt="득근득근">
			</a>		
		</h1>	
			
		<div id="menu">
		<ul>
			<li>
				<a href="/challenge/list">챌린지</a>
			</li>
			<li>
				<c:if test="${empty userNo }"><a id="goLogin">멘토와 채팅하기</a></c:if> <!-- 비로그인 상황 -->
				<c:if test="${not empty userNo }"><a href="/chat/intro">멘토와 채팅하기</a></c:if> <!-- 로그인 상황 -->
			</li>
			<li>
				<a href="/dghelper/healthtest">운동도우미</a>
			</li>
			<li>
				<a href="/store/list">득근상점</a>
			</li>
			<li>
				<a href="/board/boardList">커뮤니티</a>
			</li>
		</ul>
		</div> <!-- menu -->
	
	
		<!-- 비로그인 상황일때 -->	
		<c:if test="${empty userNo }">
		<div id="right">
			<ul>
				<li id="login">
<!-- 					<img src="/resources/img/loginicon.png"> -->
					<a href="/login/login">
						<span class="material-symbols-outlined lG">login</span>로그인
					</a>
				</li>
				
				<li id="join">
<!-- 					<img src="/resources/img/joinicon.png"> -->
					<a href="/login/join">
					<span class="material-symbols-outlined person">person_add</span>회원가입
					</a>
				</li>
			</ul>
		</div>
		</c:if> <!-- 비로그인상황 끝 -->
		
		<!-- 로그인 상황일때 -->	
		<c:if test="${not empty userNo }">
		<div id="right">
			<ul>
				<li id="logout">
<!-- 					<img src="/resources/img/loginicon.png"> -->
					<a href="/mypage/logout">
						<span class="material-symbols-outlined lO">logout</span>로그아웃
					</a>
				</li>
				
				<li id="mp">
<!-- 					<img src="/resources/img/joinicon.png"> -->
					<a href="/mypage/main">
					<span class="material-symbols-outlined mP">perm_contact_calendar</span>마이페이지
					</a>
				</li>
			</ul>
			<div id="alram">
			<button id="myAlert"><img src="/resources/img/bell.png"></button>
				<div class="messageBox" style="display:none;">
					<div id="message-result"></div>
				</div>
			</div>
		</div>
		</c:if> <!-- 비로그인상황 끝 -->
		
	</div>	<!-- topMenu -->

	
</header>












