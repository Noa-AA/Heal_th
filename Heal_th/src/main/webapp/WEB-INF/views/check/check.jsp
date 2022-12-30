<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>출석판</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">
$(document).ready(()=>{
	var $table = $("<table class='cal'>")
// 	var attDays = ${attDays}
// 	console.log(attDays)
// 	console.log(attDays.include(3))
	$table.append($("<tr>"))
	for(var i=1; i<=${lastDay}; i++){
			if(${attDays}.includes(i)){
				$table.children().children().last().append($("<td>").html(i).css({"background-image":"url(/resources/img/check/checkicon3.png)"
																				,"background-size":"cover"
																				,"background-position": "center"
																				,"background-repeat" : "no-repeat"}))		
			}else {
				$table.children().children().last().append($("<td>").html(i))				
			}
		if(i%7==0){
			$table.append($("<tr>"))
		}
	}
	
	$table.prependTo($("#attCheck"))
	
	$("#goCheck").click(()=>{
		
		if($(".cal").find("td:eq(${today-1})").css("background-image")!="none"){
			alert("오늘의 출석체크는 이미 하셨습니다")
			return false
		}else{
			
			console.log("goCheck click")
			console.log(${today})
			$(".cal").find("td:eq(${today-1})").css({
				"background-image":"url(/resources/img/check/checkicon3.png)"
				,"background-size":"50px"
				,"background-position": "center"
				,"background-repeat" : "no-repeat"
				
			})
			
			var tdEl = $(".cal").find("td:eq(${today-1})");
			
	// 		$("#stamp").appendTo( tdEl )
			
			
			console.log("1-",tdEl.css("background-image"))
			
	        console.log("offset-",tdEl.offset())
	        console.log("position-",tdEl.position())
	        
	        
	// 		var tdLeft = tdEl.offset().left - stampWidth;
	// 		var tdTop = tdEl.offset().top - stampHeight;
	// 		var tdLeft = tdEl.offset().left;
	// 		var tdTop = tdEl.offset().top;
	// 		var tdLeft = tdEl.position().left - stampWidth;
	// 		var tdTop = tdEl.position().top - stampHeight;
			var tdLeft = tdEl.position().left;
			var tdTop = tdEl.position().top;
			 
			console.log("left",tdLeft)
			console.log("top",tdTop)
			
			var tHalfWidth = tdEl.width() / 2;
			var tHalfHeight = tdEl.height() / 2;
			 
			var tdCenterX = tdLeft + tHalfWidth;
			var tdCenterY = tdTop + tHalfHeight;
			
			console.log("tdCenter-",tdCenterX,tdCenterY)
			
	        var stampWidth = parseInt($("#stamp").css("width")) / 2
	        var stampHeight = parseInt($("#stamp").css("height")) / 2
			
			var imgLeft = tdCenterX - stampWidth
			var imgTop = tdCenterY - stampHeight
			
			
			$("#stamp").css({
					"display":"block"
					,"left":imgLeft
					,"top":imgTop
			})
			
			$("#stamp").css(
				"animation","kenburns-top 0.2s cubic-bezier(0.165, 0.840, 0.440, 1.000) reverse both"
			)
			alert("10 포인트가 적립됐습니다")
		}
		
		$.ajax({
			type: "post"
			,url: "/check/check"
			,data: {}
			,dataType: "html"
			,success: function(commentList){
				console.log("checkPost 성공")
			}
			,error: function(){
				console.log("checkPost 실패")
			}
		})

	})
	
	
})
</script>
<style type="text/css">
table,th, td {
 	margin: 0 auto; 
    border: 2px solid #ccc;
    text-align: center;
    font-size: 30px;
    border-collapse: collapse;
    
  }
td{
  	height: 50px;
  	width: 50px;
  	color: white;
}
@keyframes kenburns-top {
  0%{
  	transform: scale(0.2);
  	opacity:0;
  }
  40% {
    transform: scale(0.1);
    opacity:0.5;
/*     transform: scale(0.1) translateY(0); */
/*      transform-origin: 50% 16%;  */
  }
  100% {
    transform: scale(1);
/*     transform: scale(1) translateY(-15px); */
/*      transform-origin: top;  */
  }
}

#attContiner{
/* 	width: 800px; */
/* 	height: 500px; */
 	position:relative;
 	display: flex; 
    justify-content: center; 
    align-items: center; 
	text-align: center;
}
#attCheck{
}
#stamp{
	position:absolute;
/*
	width: 50px;
	height: 50px;
*/
 	width: 500px;
 	height: 500px;
	display: none;
	margin: 0 auto;
}
body{
    height: 670px;
    margin: 0;
    font-family: UhBeeSkyrain;
    background-image: url("/resources/img/check/checkback.png");
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
    overflow: hidden;
}
@font-face {
font-family: 'UhBeeSkyrain';
src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_five@.2.0/UhBeeSkyrain.woff') format('woff');
font-weight: normal;
font-style: normal;
}
#attAll{
	background-image: url("/resources/img/check/checkboard.png");
	width:100%;
	background-repeat: no-repeat;
	background-position: center;
	background-size: cover;
	margin: 0;
    height: 100%;
}
#atts{
	color: white;
	text-align: center;
}
#attCheck{
/* 	color: white; */
}
#attAll img{
	top: 100px;
	
}

#goCheck{
	border: none;
	background-color: green;
	width: 100px;
	height: 50px;
	border-radius: 12px;
	font-size: 20px;
	color: white;
	cursor: pointer;
	font-family: UhBeeSkyrain;
}
</style>
</head>
<body onresize="parent.resizeTo(500,750)" onload="parent.resizeTo(500,750)">
<div id="attAll">
<br><br><br>
<h1 id="atts">출석판</h1>
<br>
<div id="attContiner">
	<img id="stamp" class="kenburns-top" alt="도장" src="/resources/img/check/checkicon3.png">

	<div id="attCheck">
	<br>
	<button id="goCheck">출석체크</button>
	<!-- <button id="test">test</button> -->
	</div>
</div>
</div>
</body>
</html>