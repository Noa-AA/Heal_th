<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../layout/header.jsp" %>
<style type="text/css">
@font-face {
	font-family: 'mice';
	src: url('/resources/css/MICEGothic.ttf') format('truetype');
}
.Quick {
	position: absolute;
	top: 200px;
	left: 150px;
	width: 200px;
	height: 300px;
	padding: 20px;
	background: linear-gradient(120deg, #3f94d6 0 , #1869a7);
	text-align: left;
	box-shadow: 1px 1px 10px 0px rgb(0 0 0 / 30%);
}  

@media screen and (max-width: 1640px) {
	.Quick {
		left: 75px;
	}
}

@media screen and (max-width: 1400px) {
	.Quick {
		left: 0px;
	}
}

@media screen and (max-width: 1200px) {
	.Quick {
		display: none;
	}
}

.Quick a {
	font-size: 18px;
	font-weight: bold;
	color: white;
	padding: 10px;
}

.big-container {
	width: 800px;
	margin: 0 auto;
	text-align: center;
}

.start-container {
	display: flex;
	width: 800px;
	height: 500px;
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
    top: 120px !important;
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
		<p id="subv-title">운동성향 테스트</p>
		<p id="subv-content">운동성향테스트 어쩌구저쩌구</p>
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