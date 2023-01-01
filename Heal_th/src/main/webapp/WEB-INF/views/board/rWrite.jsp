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
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"> -->
<script scr="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- <script scr="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css"></script> -->


<style type="text/css">

a {
    color: #000;
    text-decoration: none;
}

* {
    margin: 0;
    padding: 0;
}

header{margin-bottom: 0px;}

html {
/*     height: 100%; */
	height: 1300px;
}

/* button style */
#btnCancle{
     width: 100px; 
     background: #616161; 
     font-weight: bold; 
     color: white; 
     border: 0 none; 
     border-radius: 0px; 
     cursor: pointer; 
     padding: 10px 5px; 
     margin: 10px 5px; 
     margin-left: 208px;
}



#btnInsert {
    width: 100px;
    background: #7ca3f5;
    font-weight: bold;
    color: white;
    border: 0 none;
    border-radius: 0px;
    cursor: pointer;
    padding: 10px 5px; 
    margin: 10px 5px;
    padding-bottom: 14px; 
	height: 52px;
	width: 100px;
}


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

/*form styles*/
#msform {
    text-align: center;
    position: relative;
    margin-top: 20px;
    display: block;
}

#msform fieldset .form-card {
    background: white;
    border: 0 none;
    border-radius: 0px;
    box-shadow: 0 2px 2px 2px rgba(0, 0, 0, 0.2);
    padding: 20px 40px 30px 40px;
    box-sizing: border-box;
    width: 94%;
    margin: 0 3% 20px 3%;

    /*stacking fieldsets above each other*/
    position: relative;
}

#msform fieldset {
    background: white;
    border: 0 none;
    border-radius: 0.5rem;
    box-sizing: border-box;
    width: 750px;
    height: 800px;
    margin-left: 95px;
    padding-bottom: 20px;

    /*stacking fieldsets above each other*/
    position: relative;
}

/*Hide all except first fieldset*/
#msform fieldset:not(:first-of-type) {
    display: none;
}

#msform fieldset .form-card {
    text-align: left;
    color: #9E9E9E;
}

#msform input, #msform textarea {
    padding: 0px 8px 4px 8px;
    border: none;
    border-bottom: 1px solid #ccc;
    border-radius: 0px;
    margin-bottom: 25px;
    margin-top: 2px;
    width: 100%;
    box-sizing: border-box;
/*     font-family: montserrat; */
    color: #2C3E50;
    font-size: 16px;
    letter-spacing: 1px;
}

#msform input:focus, #msform textarea:focus {
    -moz-box-shadow: none !important;
    -webkit-box-shadow: none !important;
    box-shadow: none !important;
    border: none;
    font-weight: bold;
    border-bottom: 2px solid skyblue;
    outline-width: 0;
}

/*Blue Buttons*/
#msform .action-button {
    width: 100px;
    background: #7ca3f5;
    font-weight: bold;
    color: white;
    border: 0 none;
    border-radius: 0px;
    cursor: pointer;
    padding: 10px 5px;
    margin: 10px 5px;
}


/*Previous Buttons*/
#msform .action-button-previous {
     width: 100px; 
     background: #616161; 
     font-weight: bold; 
     color: white; 
     border: 0 none; 
     border-radius: 0px; 
     cursor: pointer; 
     padding: 10px 5px; 
     margin: 10px 5px; 
}



/*The background card*/
.card {
    z-index: 0;
    border: none;
    border-radius: 0.5rem;
    position: relative;
}

/*FieldSet headings*/
.fs-title {
    font-size: 25px;
    color: #2C3E50;
    margin-bottom: 10px;
    font-weight: bold;
    text-align: left;
}

/*progressbar*/
#progressbar {
    margin-bottom: 30px;
    overflow: hidden; 
    color: lightgrey;
    width: 800px;
    text-align: center;
    margin-left: 67px;
}


#progressbar .active {
    color: #000000;
}

#progressbar li {
    list-style-type: none;
    font-size: 12px;
    width: 25%;
    float: left;
    position: relative;
}

/*Icons in the ProgressBar*/
#progressbar #before:before {
/*     font-family: FontAwesome; */
    content: "\f023";
}

#progressbar #goal:before {
/*     font-family: FontAwesome; */
    content: "\f007";
}

#progressbar #after:before {
/*     font-family: FontAwesome; */
    content: "\f09d";
}

#progressbar #finish:before {
    content: "\f00c";
}

/*ProgressBar before any progress*/
#progressbar li:before {
    width: 50px;
    height: 50px;
    line-height: 45px;
    display: block;
    font-size: 18px;
    color: #ffffff; 
    background: lightgray;
    border-radius: 50%;
    margin: 0 auto 10px auto;
    padding: 2px;
}

/*ProgressBar connectors*/
#progressbar li:after {
    content: '';
    width: 100%;
    height: 2px;
    background: lightgray;
    position: absolute;
    left: 0;
    top: 25px;
    z-index: -1;
}

/*Color number of the step and the connector before it*/
#progressbar li.active:before, #progressbar li.active:after {
    background: #7ca3f5;
}

</style>


<script type="text/javascript">
$(document).ready(function() {
	
	var current_fs, next_fs, previous_fs; //fieldsets
	var opacity;
	

	$(".next").click(function(){
		
		//유효성 검사
		if($("#rTitle").val() == ""){
	 		console.log("제목을 입력하세요")
	 		$("#rTitleError").html("* 제목을 입력해주세요")
	 		$("#rTitleError").css("color","red")
		return false
		
	 	} 
		
		if ($("#gymName").val() == ""){
	 		console.log("시설명을 입력하세요")
	 		$("#gymNameError").html("* 시설명을 입력해주세요")
	 		$("#gymNameError").css("color","red")
	 		return false
		} 
			
			if ($("#classification").val() == ""){
		 	console.log("시설 분류를 입력하세요")
		 	$("#classificationError").html("* 시설 분류를 입력해주세요")
		 	$("#classificationError").css("color","red")
		 	return false
		} 
			
			if ($("#gymIntroduce").val() == ""){
		 	console.log("간단 소개를 입력하세요")
		 	$("#gymIntroduceError").html("* 간단 소개를 입력해주세요")
		 	$("#gymIntroduceError").css("color","red")
		 	return false
		} 
		
		if ($("#price").val() == ""){
		 	console.log("가격을 입력하세요")
		 	$("#priceError").html("* 가격을 입력해주세요")
		 	$("#priceError").css("color","red")
		 	return false
		} 	
		
		
	    current_fs = $(this).parent();
	    next_fs = $(this).parent().next();
	    
	    //Add Class Active
	    $("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");
	    
	    //show the next fieldset
	    next_fs.show(); 
	    //hide the current fieldset with style
	    current_fs.animate({opacity: 0}, {
	        step: function(now) {
	            // for making fielset appear animation
	            opacity = 1 - now;

	            current_fs.css({
	                'display': 'none',
	                'position': 'relative'
	            });
	            next_fs.css({'opacity': opacity});
	        }, 
	        duration: 600
	    });
	    
	});
	
$(".next2").click(function(){
		
		//유효성 검사
		if($("#address").val() == ""){
	 		console.log("주소를 입력하세요")
	 		$("#addressError").html("* 주소를 입력해주세요")
	 		$("#addressError").css("color","red")
			return false
		}
		
		
	    current_fs = $(this).parent();
	    next_fs = $(this).parent().next();
	    
	    //Add Class Active
	    $("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");
	    
	    //show the next fieldset
	    next_fs.show(); 
	    //hide the current fieldset with style
	    current_fs.animate({opacity: 0}, {
	        step: function(now) {
	            // for making fielset appear animation
	            opacity = 1 - now;

	            current_fs.css({
	                'display': 'none',
	                'position': 'relative'
	            });
	            next_fs.css({'opacity': opacity});
	        }, 
	        duration: 600
	    });
	    
	});
	
$(".next3").click(function(){
	
	//유효성 검사
	if($("#score").val() == ""){
 		console.log("평점을 입력하세요")
 		$("#scoreError").html("* 평점을 입력해주세요")
 		$("#scoreError").css("color","red")
		return false
	}
	
	if($("#review").val() == ""){
 		console.log("리뷰를 입력하세요")
 		$("#reviewError").html("* 리뷰를 입력해주세요")
 		$("#reviewError").css("color","red")
		return false
	}
	
	
    current_fs = $(this).parent();
    next_fs = $(this).parent().next();
    
    //Add Class Active
    $("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");
    
    //show the next fieldset
    next_fs.show(); 
    //hide the current fieldset with style
    current_fs.animate({opacity: 0}, {
        step: function(now) {
            // for making fielset appear animation
            opacity = 1 - now;

            current_fs.css({
                'display': 'none',
                'position': 'relative'
            });
            next_fs.css({'opacity': opacity});
        }, 
        duration: 600
    });
    
});
	
	//유효성 검사 메세지 초기화
	$("#rTitle").focus(function(){
	   $("#rTitleError").html("")
	  })
		   
	$("#gymName").focus(function(){
		$("#gymNameError").html("")
	})
		   
	$("#classification").focus(function(){
		$("#classificationError").html("")
	})
	
	$("#gymIntroduce").focus(function(){
		$("#gymIntroduceError").html("")
	})
	
	$("#price").focus(function(){
		$("#priceError").html("")
	})
	
	$("#address").focus(function(){
		$("#addressError").html("")
	})
	
	$("#score").focus(function(){
		$("#scoreError").html("")
	})
	
	$("#review").focus(function(){
		$("#reviewError").html("")
	})
		   
	
	

	$(".previous").click(function(){
	    
	    current_fs = $(this).parent();
	    previous_fs = $(this).parent().prev();
	    
	    //Remove class active
	    $("#progressbar li").eq($("fieldset").index(current_fs)).removeClass("active");
	    
	    //show the previous fieldset
	    previous_fs.show();

	    //hide the current fieldset with style
	    current_fs.animate({opacity: 0}, {
	        step: function(now) {
	            // for making fielset appear animation
	            opacity = 1 - now;

	            current_fs.css({
	                'display': 'none',
	                'position': 'relative'
	            });
	            previous_fs.css({'opacity': opacity});
	        }, 
	        duration: 600
	    });
	});
	
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
		confirm("게시글을 등록하시겠습니까?");
		$(this).parents("form").submit();
		alert("50 포인트가 적립됐습니다");
	});
	
})

</script>

</head>
<body>
<div id="contents">
<!-- MultiStep Form -->
<div class="container-fluid" id="grad1">
    <div class="row justify-content-center mt-0">
        <div class="col-11 col-sm-9 col-md-7 col-lg-6 text-center p-0 mt-3 mb-2">
            <div class="card px-0 pt-4 pb-0 mt-3 mb-3">
                <h1><strong style="font-size: 40px; text-align: center;">시설 후기 게시글</strong></h1><br><br>
                <p style="font-size: 15px; text-align: center;">게시글을 작성해주세요</p><br><br>
                <div class="row">
                    <div class="col-md-12 mx-0">
                    
                        <form id="msform" method="post" action="/board/rWrite" enctype="multipart/form-data">
                        
                        
                            <!-- progressbar -->
                            <ul id="progressbar">
                                <li class="active" id="before"><strong>Start</strong></li>
                                <li id="goal"><strong>Location</strong></li>
                                <li id="after"><strong>Review</strong></li>
                                <li id="finish"><strong>Finish</strong></li>
                            </ul><br><br>
                            
                            <!-- fieldsets -->
			            <fieldset>
				            <div class="form-card">
				             <br><br><h3 style="color: black">시설 소개</h3><br><br>
				             	<label for="rTitle">제목</label>
									<input type="text" id="rTitle" name="rTitle" placeholder="제목을 입력해주세요">
				                 	<div id="rTitleError" class="resMsg"></div>
				                 <br><br>
				                        
								<label for="gymName">시설명</label>
									<input type="text" id="gymName" name="gymName" placeholder="시설명을 입력해 주세요">
				                	<div id="gymNameError" class="resMsg"></div>
				                <br>
				                 <label for="classification">시설 분류</label>
									<input type="text" id="classification" name="classification" placeholder="시설 분류를 입력해 주세요  ex) 수영, 헬스, 필라테스 등">
				                 	<div id="classificationError" class="resMsg"></div>
				                 <br><br>
				                 <label for="gymIntroduce">간단 소개</label>
									<input type="text" id="gymIntroduce" name="gymIntroduce" placeholder="시설에 대한 한줄평을 입력해 주세요  ex) 1인 PT, 저렴한 가격 등">
				                  	<div id="gymIntroduceError" class="resMsg"></div>
				                  <br>
				                  <label for="price">가격</label>
				                    <input type="text" id="price" name="price" placeholder="현재 하고 있는 운동종류를 입력해주세요">
				                  	<div id="priceError" class="resMsg"></div>
				                  <br>
				                  <label for="file">첨부파일</label><br>
									<jsp:include page="../file/upload.jsp" /> 
								</div>

								<br><br>
			                        <input type="button" name="next" class="next action-button" onClick="javascript:window.scrollTo(0,0)" value="다음">
						</fieldset>
			                            
						<fieldset>
							<div class="form-card">
								<h3 style="color: black">시설 위치</h3> 
									<br><br> 
								<label for="address">위치 정보</label><br>
									<input type="text" id="address" name="address" placeholder="주소" style="width: 487px;">
								<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색" style="width: 100px; padding-top: 5px; margin-left: 34px; margin-top: 13px;">
									<div id="addressError" class="resMsg"></div>
								<br>
								<input type="hidden" id="lat" name="lat">
								<input type="hidden" id="lng" name="lng">
								<div id="map" name="map" style="width:625px; height:350px; margin-top:10px; display:none"></div>
								
								<br>
								
							</div>                            
			                      <br><br>
									<input type="button" name="previous" class="previous action-button-previous" onClick="javascript:window.scrollTo(0,0)"
			                                 value="이전"/>
			                        <input type="button" name="next" class="next2 action-button" onClick="javascript:window.scrollTo(0,0)"
			                                 value="다음"/>
                            
                            <br><br><br><br><br><br><br><br>
						</fieldset>

                            
						<fieldset>
							<div class="form-card">
								<br><br><h2 style="color: black">후기</h2><br><br>
								
								<label>평점</label><br>
									
									<div  name="myform" id="myform">
										<span class="myratings" style="color: #ccc;">5.0</span>
										<input type="radio" name="score" value="5.0" id="rate1"><label for="rate1">★</label>
										<input type="radio" name="score" value="4.0" id="rate2"><label for="rate2">★</label>
										<input type="radio" name="score" value="3.0" id="rate3"><label for="rate3">★</label>
										<input type="radio" name="score" value="2.0" id="rate4"><label for="rate4">★</label>
										<input type="radio" name="score" value="1.0" id="rate5"><label for="rate5">★</label>								
									</div><br><br><br>
									<div id="scoreError" class="resMsg"></div>
									
	                            
								<label>후기글</label><br><br>
									<textarea rows="20" cols="50" id="review" name="review" placeholder="후기글을 작성해주세요"></textarea>
									<div id="reviewError" class="resMsg"></div>
							</div>
							
							<br><br>
							
								<input type="button" name="previous" class="previous action-button-previous" onClick="javascript:window.scrollTo(0,0)"
                                 value="이전"/>
                                <input type="button" name="next" class="next3 action-button" onClick="javascript:window.scrollTo(0,0)"
                                 value="다음"/>
                                 
                                 <br><br><br><br><br><br><br><br>
                                 
						</fieldset>
                            
						<fieldset>
							<div class="form-card">
							<br><br><br><br>
								<h2 style="text-align: center;">게시글을 등록하시겠습니까?</h2>
							<br><br><br><br>
                                    
								<button id="btnCancle">
									<a class="btn block" onclick="if ( confirm('정말 취소하시겠습니까?') == false ) { return false; }" href="/board/reviewBoard" style="text-decoration: none; color: white; font-size: 14px; font-weight: bold; ">취소</a>
								</button>
                                    
								<button type="submit" id="btnInsert" name="btnInsert" style="color: white; font-size: 14px;">등록</button>
                                    
							</div>
						</fieldset>
                        
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>


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




</body>
</html>