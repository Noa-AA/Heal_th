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
	
	$("input[name='score'][value='${updateBoard.score}']").prop("checked", true)
	updateStar();
	
	$("input[type='radio']").click(updateStar);

	
	$("#btnWrite").click(function() {
		$(this).parents("form").submit();
	});
	
})

function updateStar() {
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

<div class="container">


<form action="/board/rUpdate" method="post" enctype="multipart/form-data">
<input type="hidden" name="reviewNo" value="${param.reviewNo }">

<div class="form-group">
	<h1>헬스장 리뷰</h1><br>
</div>


<div class="form-group">
	<label for="rTitle">제목</label>
	<input type="text" id="rTitle" name="rTitle" value="${updateBoard.rTitle }" class="form-control">
</div><br><br>

<div class="form-group">
<h3>시설 소개</h3><br>
	<label for="gymName">시설명</label>
	<input type="text" id="gymName" name="gymName" value="${updateBoard.gymName }" class="form-control">
</div>	
	
<div class="form-group">
	<label for="classification">분류</label>
	<input type="text" id="classification" name="classification" value="${updateBoard.classification }" class="form-control">
</div>	

<div class="form-group">
	<label for="gymIntroduce">간단 소개</label>
	<input type="text" id="gymIntroduce" name="gymIntroduce" value="${updateBoard.gymIntroduce }" class="form-control">
</div>	

<div class="form-group">
	<label for="price">가격</label>
	<input type="text" id="price" name="price" value="${updateBoard.price }" class="form-control">
</div>	


<br><br><hr><br><br>


<div class="form-group">
	<h3>위치</h3>
	<label for="address">시설 위치</label>
	
	<input type="text" id="address" name="address" value="${updateBoard.address }">
	<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
		<div id="map" name="map" value="${updateBoard.map }" style="width:300px;height:300px;margin-top:10px;display:none"></div>
</div>




<br><br><hr><br><br>

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
                    }
                });
            }
        }).open();
    }
</script>



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
	
	<button type="submit" class="btn btn-primary" id="btnUpdate">수정</button>
</div>
</form>

</div><!-- .container end -->







</body>
</html>