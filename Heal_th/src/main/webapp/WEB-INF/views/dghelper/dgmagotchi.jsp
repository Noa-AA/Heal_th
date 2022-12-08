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
	background: white;
	border-radius: 8px;
	margin: 0 auto;
	width: 300px;
	height: 100px;
	margin-bottom: 100px;
	
}

.small-container {
	position: absolute;
	top: 181px !important;
}

.button-container {
    top: 90px !important;
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
		<p id="subv-title">득근이 키우기</p>
		<p id="subv-content">스트레스는 운동의 적 ! 득근이를 키우며 힐링해봐요</p>
	</div>
</div>
<body>
<div class="big-container">
	<div class="start-container">
		<button id="start">시작하기</button>
	</div>
</div>
</body>
</html>