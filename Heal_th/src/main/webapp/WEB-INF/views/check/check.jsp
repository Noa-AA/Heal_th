<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
				$table.children().children().last().append($("<td>").html(i).css({"background-image":"url(/resources/img/check/checkicon.png)"
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
	
	$table.appendTo($("#attCheck"))
	
	$("#goCheck").click(()=>{
		console.log("goCheck click")
		console.log(${today})
		$(".cal").find("td:eq(${today-1})").css({
			"background-image":"url(/resources/img/check/checkicon.png)"
			,"background-size":"50px"
			,"background-position": "center"
			,"background-repeat" : "no-repeat"
			
		})
		
		var tdEl = $(".cal").find("td:eq(${today-1})");
                            
		var tdX = tdEl.offset().left;
		var tdY = tdEl.offset().top;
		 
		var tHalfWidth = tdEl.width() / 2;
		var tHalfHeight = tdEl.height() / 2;
		 
		var tCenterX = tdX + tHalfWidth;
		var tCenterY = tdY + tHalfHeight;
		
		console.log(tdX)
		console.log(tdY)
		
		$("#stamp").css({
				"display":"block"
				,"left":"tdY"
				,"top":"tdX"
		})
				
		$("#stamp").css(
			"animation","kenburns-top 0.2s cubic-bezier(0.165, 0.840, 0.440, 1.000) reverse both"
		)

	})
	
	
})
</script>
<style type="text/css">
table,th, td {
    border: 1px solid #ccc;
    text-align: center;
    font-size: 30px;
  }
td{
  	height: 50px;
  	width: 50px;
}
@keyframes kenburns-top {
  
  0% {
    transform: scale(0.1) translateY(0);
    transform-origin: 50% 16%;
  }
  100% {
    transform: scale(1) translateY(-15px);
    transform-origin: top;
  }
}

#attContiner{
/* 	width: 800px; */
/* 	height: 500px; */
	position:relative;
	display: flex;
    justify-content: center;
}
#attCheck{
    display: flex;
    flex-direction: column-reverse;
}
#stamp{
/* 	display: none; */
	position:absolute;
	width: 500px;
	height: 500px;
	display: none;
	margin: 0 auto;
}

</style>
</head>
<body>
<h1>출석 현황</h1>
<hr>
<div id="attContiner">
<img id="stamp" class="kenburns-top" alt="도장" src="/resources/img/check/checkicon.png">

<div id="attCheck">
<button id="goCheck">출석체크</button>
<!-- <button id="test">test</button> -->
</div>
</div>

</body>
<%-- <jsp:include page="../comment/board.jsp" /> --%>
</html>