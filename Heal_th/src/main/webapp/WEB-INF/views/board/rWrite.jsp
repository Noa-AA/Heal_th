<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/assets/css/star.css" rel="stylesheet"/>

<jsp:include page="../layout/header.jsp" />

<!-- 스타일 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js">
<script scr="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- <script scr="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css"></script> -->


<style type="text/css">

* {
    margin: 0;
    padding: 0;
}

html {
/*     height: 100%; */
	height: 1300px;
}

#btnCancle {
    width: 100px;
    background: #616161;
    font-size: 21px;
    font-weight: bold;
    color: white;
    border: 0 none;
    border-radius: 5px;
    cursor: pointer;
    padding: 10px 5px; 
    margin: 10px 5px;
    padding-bottom: 14px; 
	height: 52px;
	width: 100px;
	margin-right: 15px;
}

#btnWrite {
    width: 100px;
    background: #7ca3f5;
    font-size: 21px;
    font-weight: bold;
    color: white;
    border: 0 none;
    border-radius: 5px;
    cursor: pointer;
    padding: 10px 5px; 
    margin: 10px 5px;
    padding-bottom: 14px; 
	height: 52px;
	width: 100px;
}




/* star rating */
/* .star_rating {font-size:0; letter-spacing:-4px;} */

/* .star_rating a { */
/*     font-size:22px; */
/*     letter-spacing:0; */
/*     display:inline-block; */
/*     margin-left:5px; */
/*     color:#ccc; */
/*     text-decoration:none; */
/* } */
/* .star_rating a:first-child {margin-left:0;} */
/* .star_rating a.on {color:#F8AF0D;} */

#myform{
    display: inline-block;
    direction: rtl;
    border:0;
}
#myform legend{
    text-align: right;
}
#myform input[type=radio]{
    display: none;
}
#myform label{
    font-size: 3em;
    color: transparent;
    text-shadow: 0 0 0 #f0f0f0;
}
#myform label:hover{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#myform label:hover ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#myform input[type=radio]:checked ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

span{
font-size: 25px;
float: left;
margin-right: 15px;
margin-top: 3px;
}


</style>


<!-- 스마트 에디터 2 로드 -->
<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	
	$( ".star_rating a" ).click(function() {
	     $(this).parent().children("a").removeClass("on");
	     $(this).addClass("on").prevAll("a").addClass("on");
	     return false;
	});
	
	$("input[type='radio']").click(function(){
        var sim =  $("input[type='radio']:checked").val();
        //alert(sim);
        if (sim<3) {
        $('.myratings').css('color','red'); 
        $(".myratings").text(sim);
     }else{
        $('.myratings').css('color','green');
        $(".myratings").text(sim);
     }
     });

	
	$("#btnWrite").click(function() {
		$(this).parents("form").submit();
	});
	
})

function updateContents() {
	//스마트 에디터에 작성된 내용을 #content에 반영한다
	oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", [])
}
</script>

</head>
<body>

<div class="container">


<form action="/board/rWrite" method="post" enctype="multipart/form-data">
<div class="form-group">
	<h1>헬스장 리뷰</h1><br>
</div>


<div class="form-group">
	<label for="rTitle">제목</label>
	<input type="text" id="rTitle" name="rTitle" class="form-control">
</div><br><br>

<div class="form-group">
<h3>시설 소개</h3><br>
	<label for="gymName">시설명</label>
	<input type="text" id="gymName" name="gymName" class="form-control">
</div>	
	
<div class="form-group">
	<label for="classification">분류</label>
	<input type="text" id="classification" name="classification" class="form-control">
</div>	

<div class="form-group">
	<label for="gymIntroduce">간단 소개</label>
	<input type="text" id="gymIntroduce" name="gymIntroduce" class="form-control">
</div>	

<div class="form-group">
	<label for="price">가격</label>
	<input type="text" id="price" name="price" class="form-control">
</div>	


<br><br><hr><br><br>



<div class="form-group">
	<h3>위치</h3>
	<label for="address">시설 위치</label>
	<input type="text" id="address" name="address" class="form-control">
</div>




<br><br><hr><br><br>


<!-- <div id="map" style="width:100%;height:350px;"></div> -->

<!-- <input type="text" id="address" name="address" class="form-control"> -->
<!-- <button id="search">찾기</button> -->

<div class="form-group">
	<h3>후기</h3><br>


	<fieldset name="myform" id="myform">
		<span class="myratings" style="color: #ccc;">5.0</span>
		<input type="radio" name="score" value="5.0" id="rate1"><label for="rate1">★</label>
		<input type="radio" name="score" value="4.0" id="rate2"><label for="rate2">★</label>
		<input type="radio" name="score" value="3.0" id="rate3"><label for="rate3">★</label>
		<input type="radio" name="score" value="2.0" id="rate4"><label for="rate4">★</label>
		<input type="radio" name="score" value="1.0" id="rate5"><label for="rate5">★</label>
		</fieldset>
</div>
	
<div class="form-group">
	<label for=review">후기글 작성</label>
	<textarea rows="10" style="width: 100%;" id="review" name="review" placeholder="이용하신 시설의 장단점을 작성해주세요"></textarea>
</div>

<br><br>

<div class="text-center">
	
		<a class="btn block" id="btnCancle" onclick="if ( confirm('정말 취소하시겠습니까?') == false ) { return false; }" href="/board/reviewBoard" >취소</a>
	<button type="submit" class="btn btn-primary" id="btnWrite">등록</button>
</div>
</form>

<!-- 스마트 에디터 스킨 적용 -->
<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "content",
	sSkinURI: "/resources/se2/SmartEditor2Skin.html",
	fCreator: "createSEditor2"
})
</script>

</div><!-- .container end -->


</body>
</html>