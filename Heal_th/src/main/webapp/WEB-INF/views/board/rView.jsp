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

<!-- 스타일 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js">
<script scr="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- <script scr="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css"></script> -->

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
		center : new daum.maps.LatLng(33.450701, 126.570667),
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
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	//지도에 클릭 이벤트를 등록합니다
	//지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
	daum.maps.event.addListener(map, 'click', function(mouseEvent) {
			
		// 클릭한 위도, 경도 정보를 가져옵니다 
		var latlng = mouseEvent.latLng;
		
		var message = '좌표 (경도,위도) : ' + latlng.getLat() + ', ' + latlng.getLng();
		    
		var resultDiv = document.getElementById('result'); 
		    resultDiv.innerHTML = message;
		
		// 마커 위치를 클릭한 위치로 옮깁니다
		marker.setPosition(latlng);
	
// 	  $("#lat").value = latlng.getLat(); //start_lat 필드에 위도 값 저장
// 	  $("#lng").value = latlng.getLng(); //start_lon 필드에 경도 값 저장
		
	});

} //window.onload end


    function searchAddrFromCoords(coords, callback) {
    // 좌표로 행정동 주소 정보를 요청합니다
    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
}

function searchDetailAddrFromCoords(coords, callback) {
    // 좌표로 법정동 상세 주소 정보를 요청합니다
    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
}



//지도에 마커를 표시하는 함수입니다
function displayMarker(place) {
	
	
	// 마커를 생성하고 지도에 표시합니다
	var marker = new daum.maps.Marker({
		map : map,
		position : new daum.maps.LatLng(place.y, place.x)
	});

	//지도에 마커를 표시합니다
	marker.setMap(map);

}



</script>




<style type="text/css">

* {
    margin: 0;
    padding: 0;
}

html {
/*     height: 100%; */
	height: 1300px;
}

* {
    margin: 0;
    padding: 0;
}

body{padding: 0;}

a {
    color: #000;
    text-decoration: none;
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
    padding: 10px 5px; 
    margin: 10px 5px;
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

	
	$("#btnList").click(function() {
		location.href = "/board/reviewBoard"
	})
	
	$("#btnUpdate").click(function() {
		location.href = "/board/rUpdate?reviewNo=${viewBoard.reviewNo }"
	})
	
	$("#btnDelete").click(function() {
		location.href = "/board/rDelete?reviewNo=${viewBoard.reviewNo }"
	})
	
})

</script>

</head>
<body>

<div class="container">

<h1>게시글 상세보기</h1>
<hr>




<br><br><hr><br><br>
<!-- <script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    
    console.log()
    
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
</script> -->



<!-- <div id="map" style="width:100%;height:350px;"></div> -->

<!-- <input type="text" id="address" name="address" class="form-control"> -->
<!-- <button id="search">찾기</button> -->


<table class="table table-bordered">

<tr>
	<td class="info">글번호</td><td>${viewBoard.reviewNo }</td>
	<td class="info">카테고리 번호</td><td>${viewBoard.categoryNo }</td>
</tr>
<tr>
	<td class="info">회원번호</td><td>${viewBoard.userNo }</td>
	<td class="info">작성일</td><td><fmt:formatDate value="${viewBoard.rInstDate }" pattern="yy-MM-dd"/></td>
</tr>
<tr>
	<td class="info">조회수</td><td>${viewBoard.rHit }</td>
	<td class="info">좋아요</td><td>${viewBoard.rThumbs }</td>
</tr>
<tr>
	<td class="info" colspan="4" style="text-align: center">헬스장 리뷰</td>
</tr>
<tr>
	<td class="info">제목</td><td colspan="3">${viewBoard.rTitle }</td>
</tr>
<tr>
	<td class="info" colspan="4" style="text-align: center">시설 소개</td>
</tr>

<tr>
	<td  colspan="4" style="border: none;">시설명: ${viewBoard.gymName}</td>
</tr>
<tr>	
	<td colspan="4" style="border: none;">분류: ${viewBoard.classification}</td>
</tr>
<tr>
	<td colspan="4" style="border: none;">간단소개: ${viewBoard.gymIntroduce}</td>
</tr>
<tr>
	<td colspan="4" style="border: none;">가격: ${viewBoard.price}</td>
</tr>	

<tr>
	<td class="info" colspan="4" style="text-align: center">위치</td>
</tr>
<tr>
	<td  colspan="4" style="border: none;">시설 위치: ${viewBoard.address}</td>
</tr>

<tr>
	<td  colspan="4" style="border: none; display: none;">위치: ${viewBoard.lat}</td>
</tr>
<tr>
	<td  colspan="4" style="border: none; display: none;">위치: ${viewBoard.lng}</td>
</tr>

<tr>
	<td class="info" colspan="4" style="text-align: center">후기</td>
</tr>

<tr>
	<td colspan="4" style="border: none;">평점: ${viewBoard.score}</td>
</tr>


<tr>
	<td colspan="4" style="border: none;">후기글 작성: ${viewBoard.review}</td>
</tr>


</table>


<!-- 지도 -->
<input type="hidden" value="${viewBoard.lat }" id="latVal">
<input type="hidden" value="${viewBoard.lng }" id="lngVal">
<div id="map" style="width:600px;height:350px;"></div>



<div class="text-center">
	<button id="btnList" class="btn btn-primary">목록</button>
	
	<c:if test="${userNo eq viewBoard.userNo }">
		<button id="btnUpdate" class="btn btn-primary">수정</button>
		<button id="btnDelete" class="btn btn-danger">삭제</button>
	</c:if>
</div>

<br><br>



<br><br>

</div><!-- .container end -->

<%-- <jsp:include page="../addOns/addOn.jsp" /> --%>
<%-- <jsp:include page="../comment/board.jsp" /> --%>


<br><br><br><br><br><br><br><br>







</body>
</html>