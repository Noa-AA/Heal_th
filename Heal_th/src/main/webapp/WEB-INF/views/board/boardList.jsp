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
/*   background: url(https://images.unsplash.com/photo-1575058752200-a9d6c0f41945?&q=85); */
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
  /* Grab a free image from unsplash */
  /* background-image: url(https://images.unsplash.com/photo-1575058752200-a9d6c0f41945?ixlib=rb-1.2.1&q=85&fm=jpg&crop=entropy&cs=srgb&ixid=eyJhcHBfaWQiOjE0NTg5fQ); */
  background-image: url(https://i.postimg.cc/YSbJhmR8/pexels-pixabay-34514.jpg);
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
/*   padding: 2em; */
  margin: auto;
  max-width: 800px;
}

section h2 {
  font-family: 'Fraunces', serif;
}

section p {
  font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Helvetica, Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji";
}

#rightAni{
	display: inline-block;
	padding: 0;
	margin: 0;
	
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

</style>


<script type="text/javascript">
AOS.init(); 
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



<div data-aos="fade-right" 
        	 data-aos-offset="200" 
             data-aos-easing="ease-out-cubic"
             data-aos-duration="2000" 
             id="rightAni"
             >
             
            <h2>Lorem ipsum dolor sit amet.</h2>
	  <p>Consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>
</div>

<div data-aos="zoom-in-up" 
        	 data-aos-offset="200" 
             data-aos-easing="ease-out-cubic"
             data-aos-duration="2000" 
             >
             
            <h2>Lorem ipsum dolor sit amet.</h2>
	  <p>Consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>
</div>



<br><br><br><br><br><br><br><br>

<section>
	  <h2>Lorem ipsum dolor sit amet.</h2>
	  <p>Consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
	  <p>
	    Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?
	  </p>
</section>

<%@include file="../layout/footer.jsp" %>	

</body>


</html>
