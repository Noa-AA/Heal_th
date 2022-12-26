<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- <link rel="stylesheet" type="text/css" href="slick/slick.css"/> -->
<!-- <link rel="stylesheet" type="text/css" href="slick/slick-theme.css"/> -->
<!-- <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/> -->

<!-- Swiper 외부 라이브러리-->
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
<!-- Link Swiper's CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css" />
<!-- Demo styles -->
<style>
/* html,body { */
/*   position: relative; */
/*   height: 100%; */
/* } */

/* body { */
/*   background: #eee; */
/*   font-family: Helvetica Neue, Helvetica, Arial, sans-serif; */
/*   font-size: 14px; */
/*   color: #000; */
/*   margin: 0; */
/*   padding: 0; */
/* } */
/* body { */
/* 	background: #000; */
/* 	color: #000; */
/* } */

.swiper {
	width: 100%;
	height: 100%;
}

.swiper-slide {
	text-align: center;
	font-size: 18px;
	background: #fff;
	/* Center slide text vertically */
	display: -webkit-box;
	display: -ms-flexbox;
	display: -webkit-flex;
	display: flex;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	-webkit-justify-content: center;
	justify-content: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	-webkit-align-items: center;
	align-items: center;
}

.swiper-slide img {
	display: block;
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.swiper {
	width: 100%;
	height: 300px;
	margin-left: auto;
	margin-right: auto;
}

.swiper-slide {
	background-size: cover;
	background-position: center;
}

.mySwiper2 {
	height: 80%;
	width: 100%;
}

.mySwiper {
	height: 20%;
	box-sizing: border-box;
	padding: 10px 0;
}

.mySwiper .swiper-slide {
	width: 25%;
	height: 100%;
	opacity: 0.4;
}

.mySwiper .swiper-slide-thumb-active {
	opacity: 1;
}

.swiper-slide img {
	display: block;
	width: 100%;
	height: 100%;
	object-fit: cover;
}
</style>

<script type="text/javascript">
function fileListCall() {
	$.ajax({
		type: "get"
		,url: "/file/list"
		,data: {
				boardno:${boardNo}
				,category:${viewBoard.categoryNo }
			}
		,dataType: "html"
		,success: function(fileList){
			console.log("사진 불러오기 AJAX 성공")
			//응답 데이터 출력
			$("#photoContainer").html(fileList)
			
			var swiper = new Swiper(".mySwiper", {
				loop: true,
				spaceBetween: 10,
				slidesPerView: 4,
				observer:true,
				observeParents:true,
				freeMode: true,
				watchSlidesProgress: true,
			});
			var swiper2 = new Swiper(".mySwiper2", {
				loop: true,
				spaceBetween: 10,
				observer:true,
				observeParents:true,
				navigation: {
					nextEl: ".swiper-button-next",
					prevEl: ".swiper-button-prev",
				},
				thumbs: {
					swiper: swiper,
				},
			});
		}
		,error: function(){
			console.log("사진 불러오기 AJAX 실패")
		}
	})
}
$(document).ready(function(){
	fileListCall()
	
})
</script>
<style>
#photoContainer {
	width: 500px;
	height: 20%;
	margin: 0 auto;
	
}

.mySwiper2 img{
	width: 500px;
	height: 500px;
}
.mySwiper img{
	width: 100px;
	height: 100px;
}
.swiper-button-next{
	background: url(/resources/img/addOns/buttonNext.png) no-repeat;
	background-size: 100% auto;
	background-position: center;
	opacity: 50%;
	-webkit-user-select:none;
	-moz-user-select:none;
	-ms-user-select:none;
	user-select:none
}
.swiper-button-prev{
	background: url(/resources/img/addOns/buttonPrev.png) no-repeat;
	background-size: 100% auto;
	background-position: center;
	opacity: 50%;
	-webkit-user-select:none;
	-moz-user-select:none;
	-ms-user-select:none;
	user-select:none
}
.swiper-button-next::after,
.swiper-button-prev::after {
  display: none;
}
</style>
<h1>사진사진</h1>
<hr>

<div id="photoContainer"></div>

<!-- Swiper JS -->
<script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>

