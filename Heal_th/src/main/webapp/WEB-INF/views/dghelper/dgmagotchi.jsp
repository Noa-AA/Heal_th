<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../layout/header.jsp" %>
<style type="text/css">
@font-face {
	font-family: 'mice';
	src: url('/resources/css/MICEGothic.ttf') format('truetype');
}

body {
	padding-top: 355px;
}
.big-container {
	width: 1200px;
	margin: 0 auto;
	text-align: center;
	height: 750px;
	margin-top: 140px;
}

.start-container {
	display: flex;
	width: 1200px;
	height: 750px;
	background-image: url("/resources/img/dgmagotchi/dgmagotchi-start.png");
	box-shadow: 1px 1px 10px 0px rgb(0 0 0 / 30%);
	flex-direction: column-reverse;
} 


.start-container button {
	border: none;
	outline: none;
}

#start {
    background: #3f94d6;
	border-radius: 8px;
	margin: 0 auto;
	width: 300px;
	height: 100px;
	margin-bottom: 100px;
	box-shadow: 1px 1px 10px 0px rgb(0 0 0 / 30%);
}

#start p {
	color: white;
	fomt-family: 'mice' !important;
	font-size: 30px;
}	

.small-container {
	position: absolute;
	top: 181px !important;
}

.button-container {
    top: 150px !important;
    padding-bottom: 100px;
}

#twoDepth-list a:nth-child(5){
	color: #b571e9;
	border-bottom: 2px solid #b571e9;
	margin-top: 1px;
	font-weight: 700;
}

</style>
<script type="text/javascript">
$(document).ready(function(){
	$("#start").click(function(){
		console.log("start click")
		$.ajax({
			type: "get",
			url: "/dghelper/dgmagotchiContent",
			data: {
			},
			dataType: "html",
			success: (res)=>{
				console.log("AJAX 성공")
				$(".start-container").css("box-shadow", "none")
				$(".start-container").css("background-image", "none")
				$(".start-container").html(res)
			},
			error: ()=>{
				console.log("AJAX 실패")
			}
		})
	})
	

});

</script>
<div id="subvisual">
	<div id="subvisual-A">
		<p id="subv-title">운동 도우미</p>
<!-- 		<p id="subv-content">나의 오늘 운동기록을 매일매일 기록해 봐요</p> -->
	</div>
</div>
<div id="twoDepth">
	<div id="twoDepth-list">
		<a href="/map/find">운동 시설 추천</a>
		<a href="/dghelper/healthrecord">운동 일기장</a>
		<a href="/dghelper/healthtest">운동 성향 테스트</a>
		<a href="/dghelper/healthguide">칼로리 사전</a>
		<a href="/dghelper/dgmagotchi">득근이 키우기</a>
	</div>
</div>
<div class="big-container">
<h3 style="margin: 0 auto; width: 1200px; text-align: center;">득근이 키우기</h3>
	<div class="start-container">
		<button id="start"><p>시작하기</p></button>
	</div>
</div>

</body>
<%@include file="../layout/footer.jsp" %>
</html>