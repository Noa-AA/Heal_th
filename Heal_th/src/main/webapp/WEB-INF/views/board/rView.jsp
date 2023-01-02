<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="../layout/header.jsp" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/assets/css/star.css" rel="stylesheet"/>

<jsp:include page="../layout/header.jsp" />


<!-- 지도 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=161720a43a30c2dc196fb23834b51086&libraries=services"></script>
<script>
window.onload = function() {
	
	var ps = new daum.maps.services.Places();
	//마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
	var infowindow = new daum.maps.InfoWindow({
		zIndex : 1
	});
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
// 			center : new daum.maps.LatLng(33.450701, 126.570667),
			center : new daum.maps.LatLng('${viewBoard.lat}', '${viewBoard.lng}'),
		level : 3
	//지도의 레벨(확대, 축소 정도)
	};
	
// 	console.log(container, options)
	
	//지도를 생성합니다
	var map = new daum.maps.Map(container, options);
	
	
	//지도를 클릭한 위치에 표출할 마커입니다
	var marker = new daum.maps.Marker({
		// 지도 중심좌표에 마커를 생성합니다 
		position : map.getCenter()
	});
	
	//지도에 마커를 표시합니다
	marker.setMap(map);
	
// 	// 주소-좌표 변환 객체를 생성합니다
// 	var geocoder = new kakao.maps.services.Geocoder();
	
// 	//위도, 경도 정보를 가져옵니다 
// 	var latlng = mouseEvent.latLng;
	
// 	var message = '좌표 (경도,위도) : ' + latlng.getLat() + ', ' + latlng.getLng();
	    
// 	var resultDiv = document.getElementById('map'); 
// 	    resultDiv.innerHTML = message;
	
//      // 해당 주소에 대한 좌표를 받아서
//      var coords = new daum.maps.LatLng(result.y, result.x);
//      // 지도를 보여준다.
//      mapContainer.style.display = "block";
//      map.relayout();
//      // 지도 중심을 변경한다.
//      map.setCenter(coords);
//      // 마커를 결과값으로 받은 위치로 옮긴다.
//      marker.setPosition(coords)
     
	
} //window.onload end




</script>  




<style type="text/css">

* {
    margin: 0;
    padding: 0;
}

body{padding: 0;}

/* header <a>Tag style */

a {
    color: #000;
    text-decoration: none;
    text-decoration-line: none;
}

a:focus, a:hover {
    text-decoration: none;
    outline: none;
}

#btnList {
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
}

#btnDelete {
    width: 100px;
    background: #616161;
    font-size: 21px;
    font-weight: bold;
    color: white;
    border: 0 none;
    border-radius: 5px;
    cursor: pointer;
    padding: 7px 5px; 
    margin: 37px 5px;
    padding-bottom: 14px; 
	height: 52px;
	width: 100px;
}

#btnUpdate {
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
    margin-top: -12px;
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

.myratings{
font-size: 25px;
float: left;
font-weight: 600;
margin-right: 15px;
margin-top: 3px;
}

.container{
	width: 1200px;
    position: relative;
    background-color: white;
    border-radius: 12px;
    box-shadow: 1px 1px 10px 0px rgb(0 0 0 / 15%);
    margin: 0 auto;
}

#contentTitle{
margin-left: 9%; 
font-size: 30px; 
font-weight: 700; 
color: gray;
}

#name{
	font-size: 20px;
    width: 187px;
    display: inline-block;
    font-weight: 500;
}

#inputContent{
	font-size: 20px;
    width: 730px;
    display: inline-block;
    height: 33px;
    border-bottom: 1px solid #ccc;
}

#reviewCon{
	width: 917px; 
	height:300px; 
	border-radius:7px; 
	border: 1px solid #ccc;
}

#line{ border-top: 2px solid #ccc; }
#title{border-top: 3px solid #84C9E3; border-bottom: 3px solid #84C9E3; margin-left: 7%; width: 996px; }



</style>


<script type="text/javascript">
$(document).ready(function() {
	
	$("input[name='score'][value='${viewBoard.score}']").prop("checked", true)
	star();
	
	$("input[type='radio']").click(star);
	
	$("#btnList").click(function() {
		location.href = "/board/reviewBoard"
	})
	
	$("#btnUpdate").click(function() {
		location.href = "/board/rUpdate?reviewNo=${viewBoard.reviewNo }"
	})
	
// 	$("#btnDelete").click(function() {
// 		confirm("게시글을 정말삭제하시겠습니까?");
// 		location.href = "/board/rDelete?reviewNo=${viewBoard.reviewNo }"
// 		alert("게시글이 삭제됐습니다");
// 	})
	
})

function star() {
      var sim =  $("input[type='radio']:checked").val();
        //alert(sim);
        if (sim<3) {
        $('.myratings').css('color','red'); 
        $(".myratings").text(sim);
     }else{
        $('.myratings').css('color','green');
        $(".myratings").text(sim);
     }
}

</script>

</head>
<body>

<br><br><br><br><br><br><br><br>

<div class="container">
<h1 style="text-align: center; margin-top: 104px; padding-top: 26px; font-weight: bold; font-size: 40px;">시설 후기 게시글</h1><br><br><br><br><br><br>

<div id="title"><br>
<div style="margin-left: 30x;">
<div style="font-size: 60px; margin-left: 20px;">📝</div>
<ul style="margin-left: 25px;">
<li style="display: none;">${viewBoard.reviewNo }</li><br>
<li style="display: none;">${viewBoard.categoryNo }</li><br>
<li style="font-size: 40px; display: flex; margin-top: -125px; margin-left: 80px; padding-bottom: 3px;">${viewBoard.rTitle }</li><br>
<li style="margin-top: -23px; display: flex; margin-left: 80px;">회원번호: ${viewBoard.userNo }</li>
<li style="margin-top: -19px; display: flex; margin-left: 175px;">|</li>
<li style="margin-top: -20px; display: flex; margin-left: 188px;">작성일: 
<fmt:formatDate value="${viewBoard.rInstDate }" pattern="yy-MM-dd"/>
</li>
<li style="margin-top: -20px; display: flex; margin-left: 299px;">|</li>
<li style="margin-top: -20px; display: flex; margin-left: 311px;">조회수: ${viewBoard.rHit } </li>
<li style="margin-top: -20px; display: flex; margin-left: 369px;">|</li>
<li style="margin-top: -20px; display: flex; margin-left: 382px;">좋아요: ${viewBoard.rThumbs }</li>
</ul><br>
</div>

</div>
<br><br><br><br>

<div id="contentTitle">📃  게시글 내용</div>
<br><br><br>

<div style="margin-left: 130px;">
<fieldset>
	<h3 style="color: #2d4783; font-weight: 600; font-size: 25px;">시설 소개</h3><br><br>	
	<div id="name">시설명:</div>
	<div id="inputContent">${viewBoard.gymName}</div><br><br>
	<div id="name">분류:</div>
	<div id="inputContent">${viewBoard.classification}</div><br><br>
	<div id="name">간단소개:</div>
	<div id="inputContent">${viewBoard.gymIntroduce}</div><br><br>
	<div id="name">가격:</div>
	<div id="inputContent">${viewBoard.price}</div>
</fieldset>
<br><br><br><br><br><br><br>

<fieldset>
	<h3 style="color: #2d4783; font-weight: 600; font-size: 25px;">시설 위치</h3><br><br>
	<div id="name">위치:</div>
	<div id="inputContent">${viewBoard.address}</div><br><br>
	<!-- 지도 -->
	<input type="hidden" value="${viewBoard.lat }" id="latVal">
	<input type="hidden" value="${viewBoard.lng }" id="lngVal">
	<div id="map" style="width:913px;height:440px;"></div>
	
</fieldset>

<br><br><br><br><br><br><br>

<fieldset>
	<h3 style="color: #2d4783; font-weight: 600; font-size: 25px;">후기</h3><br><br>	
	<div id="name" style="display: block;">평점:</div>
	<div name="myform" id="myform" style="margin-left: 60px; margin-top: -35px;">
	<span class="myratings" style="color: #ccc;">5.0</span>
		<input type="radio" name="score" value="5.0" id="rate1"><label for="rate1">★</label>
		<input type="radio" name="score" value="4.0" id="rate2"><label for="rate2">★</label>
		<input type="radio" name="score" value="3.0" id="rate3"><label for="rate3">★</label>
		<input type="radio" name="score" value="2.0" id="rate4"><label for="rate4">★</label>
		<input type="radio" name="score" value="1.0" id="rate5"><label for="rate5">★</label>
	<br><br>
	</div><br>
	
	<div id="name">후기글:</div><br><br><br>
	<div id="reviewCon">${viewBoard.review}</div><br><br>
</fieldset>
<br><br><br><br>

</div>
<br><br>
<hr>
<br><br>
<div id="contentTitle">📷  이미지</div>

<br><br>

<div></div>

<jsp:include page="../file/file.jsp" /> <!-- 뷰페이지 사진목록 자리에 넣기 -->

<br><br><br><br>




<jsp:include page="../addOns/addOn.jsp" /> <br><br><br><br>

<div class="text-center">
	<button id="btnList" class="btn btn-primary">목록</button>
	
	<c:if test="${userNo eq viewBoard.userNo }">
		<button id="btnUpdate" class="btn btn-primary">수정</button>
		<button id="btnDelete">
			<a class="btn block" onclick="if ( confirm('정말 삭제하시겠습니까?') == false ) { return false; } else if( alert('게시글이 삭제됐습니다') == true ) {return true;}" 
				href="/board/rDelete?reviewNo=${viewBoard.reviewNo }" style="text-decoration: none; color: white; font-weight: bold; padding: 2px 0px; font-size: 21px;">삭제</a>
		</button>
<!-- 		<button id="btnDelete" class="btn btn-danger">삭제</button> -->
	</c:if>
</div>

<br><br><br><br><br><br>
<hr id="line">
<div style="border-top: 2px; solid #ccc;"></div>
<br><br>

<div id="contentTitle">🖋️  댓글</div>

<br><br><br><br>

<jsp:include page="../comment/board.jsp" />
<br><br><br><br><br><br><br><br>
</div><!-- .container end -->

<br><br><br><br><br><br><br><br>



<%@include file="../layout/footer.jsp" %>











</body>
</html>