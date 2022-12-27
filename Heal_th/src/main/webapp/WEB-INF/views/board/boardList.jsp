<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

  <!-- AOS 라이브러리 불러오기-->
<link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css"> 
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script> 

<jsp:include page="../layout/header.jsp" />

<style type="text/css">

@import url('https://fonts.googleapis.com/css2?family=Fraunces:wght@900&display=swap');

body{overflow-x: hidden}

#content{
max-width: 1200px;
display: block;
}

#card {
  height: 200vh;
}

.container {
  /* hide fixed overflow contents */
  clip: rect(0, auto, auto, 0);
  margin-block: 530px;

  /* does not work if overflow = visible */
  overflow: hidden;

  /* only works with absolute positioning */
  position: absolute;

  /* Make sure containers are full-width and height */
  /* height: 100vh; */
  height: 500px;
  left: 0;
  width: 100%;
  
  
  /* safari hack */
  -webkit-mask-image: -webkit-linear-gradient(top, #ffffff 0%,#ffffff 100%);
}

.container_solid {
  background: white;
  
  /* position this container at the top of its parent element */
   top: 0; 
}

.title_wrapper {
  position: fixed;
  display: block;  
  margin: auto;
  width: 100%;
  /* center the text wrapper vertically */
  top: 50%;
  -webkit-transform: translateY(-50%);
      -ms-transform: translateY(-50%);
          transform: translateY(-50%);
}

.title_wrapper h1 {
  text-align: center;
  font-size: 64px;
  text-transform: uppercase;
  text-align: center;
  font-family: 'Fraunces', serif;
  font-weight: 900;
}

.container_solid .title_wrapper h1 {
  /* the text background */
  background-image: url(https://i.postimg.cc/YSbJhmR8/pexels-pixabay-34514.jpg);
  background-size: 100vw auto;
  background-position: center;
  
  /* clip the text is possible */
  text-fill-color: transparent;
  -webkit-text-fill-color: transparent;
  background-clip: text;
  -webkit-background-clip: text;
  
/*    fallback text color  */
  color: black;
}

.container_image {
  /* background-image: url(https://images.unsplash.com/photo-1575058752200-a9d6c0f41945?ixlib=rb-1.2.1&q=85&fm=jpg&crop=entropy&cs=srgb&ixid=eyJhcHBfaWQiOjE0NTg5fQ); */
background-image: url('/resources/img/board/font.jpg');
  /* background-size:100vw auto; */
  background-size:100% auto;
  background-position: center;
  background-attachment: fixed;
  
  /* position the second container below the first container */
  top: 100vh;
}

.container_image .title_wrapper h1 {
  color: white;
}

section {
  min-height: 100vh;
  margin: auto;
  max-width: 1200px;
}

section h2 {
  font-family: 'Fraunces', serif;
}

section p {
@import url(//fonts.googleapis.com/earlyaccess/jejumyeongjo.css);
font-family: 'Karla Tamil Inclined', sans-serif;
/*   font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Helvetica, Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji"; */
}

#rightAni{
	display: inline-block;
	padding: 0;
	margin: 0;
	max-width: 1000px;
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

#animation {
  min-height: 100vh;
  margin: auto;
}

#scroll-img {
            width:300px; height:300px; margin:10px;
            border: none;
            background-image: url('/resources/img/board/board1.png');
            background-size: 100% 100%;
            background-attachment: scroll;
        }

#verifyBoard{
	width:300px; height:300px; margin:10px;
	border: none;
	 background-image: url('/resources/img/board/board.png');
	background-size: 100% 100%;
	background-attachment: scroll;
}

#dietBoard{
	width:300px; height:300px; margin:10px;
	border: none;
	background-image: url('/resources/img/board/board2.png');
	background-size: 100% 100%;
	background-attachment: scroll;
}

#reviewBoard{
	width:300px; height:300px; margin:10px;
	border: none;
	background-image: url('/resources/img/board/board3.png');
	background-size: 100% 100%;
	background-attachment: scroll;
}

</style>


<script type="text/javascript">
AOS.init({
	easing: 'ease-out-back',
    duration: 1000
}); 

</script>

</head>
<body>

<div id="subvisual">
	<div id="subvisual-A">
		<p id="subv-title">커뮤니티</p>
	</div>
</div>
<div id="twoDepth">
	<div id="twoDepth-list">
		<a href="/board/boardList">소개</a>
		<a href="/board/bfBoard">비포 애프터</a>
		<a href="/board/verifyBoard">운동 인증</a>
		<a href="/board/dietBoard">식단 공유</a>
		<a href="/board/reviewBoard">시설 후기</a>
	</div>
</div>

<br><br><br><br><br><br><br>

<div id="content">

<fieldset id="card">
<!-- First container -->
  <div class="container container_solid">
    <div class="title_wrapper">
      <h1>Record the moment</h1>
    </div>
  </div>

  <!-- Second container -->
  <div class="container container_image" aria-hidden="true">
    <div class="title_wrapper">
      <h1>Record the moment</h1>
    </div>
  </div>
</fieldset>



<br><br><br><br><br>

<section>

<div data-aos="fade-right" 
        	 data-aos-offset="200" 
             data-aos-easing="ease-out-cubic"
             data-aos-duration="2000" 
             id="rightAni" style="display: inline-block; margin-left: 300px;">

	  <h2>Before & After</h2><br>
	  <p style="font-size: 15px;">비포 애프터 게시판은 자신에게 적합한 운동 종목을 선택하여 특정 기간 동안 원하는 목표를 향해 달려나가는 순간을 공유하는 공간입니다.</p>
	  <p>비포 애프터 게시판에서는 운동 시작 전 과 후의 모습을 기록하여 목표 달성 후의 짜릿한 성취감을 느낄 수 있습니다.</p>
	  <p>또한 많은 사람들에게 나만의 성공 노하우를 전수하여 많은 사람들이 자신의 목표를 이뤄낼 수 있도록 도와줄 수 있습니다.</p>
	  <p>비포 애프터 게시판에서 아름다운 성공의 순간을 기록해주세요</p>
</div>


<div data-aos="fade-up" 
        	 data-aos-offset="200" 
             data-aos-easing="ease-out-cubic"
             data-aos-duration="2000" 
             id="animation"
             style="margin-right: -300px; display: block; margin-top: -200px;">
             
	  <div id="scroll-img" style=" float: right; maring-top: 600px; display: inline-block;"></div>
</div>

</section>


<!-- 운동 인증 게시판 -->
<section>


<div data-aos="fade-up" 
        	 data-aos-offset="200" 
             data-aos-easing="ease-out-cubic"
             data-aos-duration="2000" 
             id="animation"
             style="margin-left: 300px; float: left; display: block;">
             
	  <div id="verifyBoard"></div>
</div>

<div data-aos="fade-left" 
        	 data-aos-offset="200" 
             data-aos-easing="ease-out-cubic"
             data-aos-duration="2000" 
             id="rightAni" style="display: inline-block; margin-right: -332px; margin-left: -150px; float: right; margin-top: 81px;">

	  <h2>Verify Board</h2><br>
	  <p style="font-size: 15px;">운동 인증 게시판은 자신의 데일리 운동을 기록하고 공유하는 공간입니다.</p>
	  <p>운동 인증 게시판에서 특정 목표와 상관 없이 자신의 운동 습관을 살펴볼 수 있습니다.</p>
	  <p>또한 많은 사용자들에게 자신만의 운동법을 공유하고 운동하기 좋은 습관을 만들 수 있도록 도와줄 수 있습니다.</p>
	  <p>운동 인증 게시판에서 자신만의 데일리 운동을 기록해주세요</p>
</div>

</section>



<!-- 식단 공유 게시판 -->
<section>

<div data-aos="fade-right" 
        	 data-aos-offset="200" 
             data-aos-easing="ease-out-cubic"
             data-aos-duration="2000" 
             id="rightAni" style="display: inline-block; margin-left: 300px;">

	  <h2>Diet Board</h2><br>
	  <p style="font-size: 15px;">식단 공유 게시판은 자신이 세운 목표에 맞춰 건강한 식단을 공유하는 게시판입니다.</p>
	  <p>식단 공유 게시판에서는 체중 감량, 체중 증량 등에 상관 없이 건강하고 맛있는 자신만의 특별 레시피를 공유할 수 있습니다.</p>
	  <p>이를 통해 많은 사람들이 건강하고 맛있는 레시피로 원하는 목표를 이루는데 도움을 줄 수 있습니다.</p>
	  <p>식단 공유 게시판에서 자신만의 식단을 기록해주세요</p>
</div>


<div data-aos="fade-up" 
        	 data-aos-offset="200" 
             data-aos-easing="ease-out-cubic"
             data-aos-duration="2000" 
             id="animation"
             style="margin-right: -300px; display: block; margin-top: -200px;">
             
	  <div id="dietBoard" style=" float: right; maring-top: 600px; display: inline-block;"></div>
</div>

</section>


<!-- 시설 후기 게시판 -->
<section style="height: 300px;">


<div data-aos="fade-up" 
        	 data-aos-offset="200" 
             data-aos-easing="ease-out-cubic"
             data-aos-duration="2000" 
             id="animation"
             style="margin-left: 300px; float: left; display: block;">
             
	  <div id="reviewBoard"></div>
</div>

<div data-aos="fade-left" 
        	 data-aos-offset="200" 
             data-aos-easing="ease-out-cubic"
             data-aos-duration="2000" 
             id="rightAni" style="display: inline-block; margin-right: -332px; margin-left: -150px; float: right; margin-top: 81px;">

	  <h2>Review Board</h2><br>
	  <p style="font-size: 15px;">시설 후기 게시판은 자신이 다녔던 운동 시설의 후기를 공간입니다.</p>
	  <p>시설 후기 게시판에서는 원하는 운동 종목과 지역에 맞춰 다양한 시설들의 생생한 후기를 들을 수 있습니다.</p>
	  <p>또한 많은 사람들에게 나만의 성공 노하우를 전수하여 많은 사람들이 자신의 목표를 이뤄낼 수 있도록 도와줄 수 있습니다.</p>
	  <p>비포 애프터 게시판에서 아름다운 성공의 순간을 기록해주세요</p>
</div>

</section>


</div>


</body>

<%@include file="../layout/footer.jsp" %>	

</html>
