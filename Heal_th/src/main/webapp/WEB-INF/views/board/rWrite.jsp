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
		alert("50 포인트가 적립됐습니다");
	});
	
})

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
	
	<input type="text" id="address" name="address" placeholder="주소">
	<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
	<input type="hidden" id="lat" name="lat">
	<input type="hidden" id="lng" name="lng">
</div>
	
<div id="map" name="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>



<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=161720a43a30c2dc196fb23834b51086&libraries=services"></script>
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });


    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("address").value = addr;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                        
                        $("#lat").val( coords.getLat() ); //start_lat 필드에 위도 값 저장
	  					$("#lng").val( coords.getLng() ); //start_lon 필드에 경도 값 저장
//                         $("#lat").value = latlng.getLat(); //start_lat 필드에 위도 값 저장
// 	  					$("#lng").value = latlng.getLng(); //start_lon 필드에 경도 값 저장
                    }
                });
            }
        }).open();
    }
    


 function getInfo() {
     // 지도의 현재 중심좌표를 얻어옵니다 
     var center = map.getCenter(); 
     
     // 지도의 현재 레벨을 얻어옵니다
     var level = map.getLevel();
     
     // 지도타입을 얻어옵니다
     var mapTypeId = map.getMapTypeId(); 
     
     // 지도의 현재 영역을 얻어옵니다 
     var bounds = map.getBounds();
     
     // 영역의 남서쪽 좌표를 얻어옵니다 
     var swLatLng = bounds.getSouthWest(); 
     
     // 영역의 북동쪽 좌표를 얻어옵니다 
     var neLatLng = bounds.getNorthEast(); 
     
     // 영역정보를 문자열로 얻어옵니다. ((남,서), (북,동)) 형식입니다
     var boundsStr = bounds.toString();
     
     
     var message = '지도 중심좌표는 위도 ' + center.getLat() + ', <br>';
     message += '경도 ' + center.getLng() + ' 이고 <br>';
     message += '지도 레벨은 ' + level + ' 입니다 <br> <br>';
     message += '지도 타입은 ' + mapTypeId + ' 이고 <br> ';
     message += '지도의 남서쪽 좌표는 ' + swLatLng.getLat() + ', ' + swLatLng.getLng() + ' 이고 <br>';
     message += '북동쪽 좌표는 ' + neLatLng.getLat() + ', ' + neLatLng.getLng() + ' 입니다';
     
     // 개발자도구를 통해 직접 message 내용을 확인해 보세요.
     // ex) console.log(message);
 }
    
</script>


<br><br><hr><br><br>



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


</div><!-- .container end -->


</body>
</html>