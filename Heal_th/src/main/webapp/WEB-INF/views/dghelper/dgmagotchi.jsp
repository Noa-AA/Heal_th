<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../layout/header.jsp" %>
<style type="text/css">
@font-face {
	font-family: 'mice';
	src: url('/resources/css/MICEGothic.ttf') format('truetype');
}
.Quick {
	position: absolute;
	top: 200px;
	left: 150px;
	width: 200px;
	height: 300px;
	padding: 20px;
	background: linear-gradient(120deg, #3f94d6 0 , #1869a7);
	text-align: left;
}  

@media screen and (max-width: 1640px) {
	.Quick {
		left: 75px;
	}
}

@media screen and (max-width: 1400px) {
	.Quick {
		left: 0px;
	}
}

@media screen and (max-width: 1200px) {
	.Quick {
		display: none;
	}
}

.Quick a {
	font-size: 18px;
	font-weight: bold;
	color: white;
	padding: 10px;
}

.big-container {
	width: 800px;
	margin: 0 auto;
	text-align: center;
}

.small-container {
	display: flex;
	width: 800px;
	height: 500px;
	padding: 15px;
	background-image: url("/resources/img/dgmagotchi/dgmagotchiBack.png");
}

.main-content {
	width: 400px;
	height: 460px;
}

#awake{
	font-size: 30px;
}

#character {
	position: relative;
	top: 300px;
}


.small-container button {
	border: none;
	outline: none;
	background: none;
}

/* 스테이터스 시작 */
.status-container {
	padding: 10px;
	display: flex;
	justify-content: flex-start;
	width: 200px;
	height: 50%;
	border: 1px solid white;
	background-color: rgba(0,0,0, 0.7);
	text-align: center;
}

#dgbaby {
	position: relative;
	animation: loop 10s infinite;
	transform: rotateY(0deg);
}

.status-container p {
	color: white;
}
/* 스테이터스 끝 */

/* 날씨 시작 */
.weather-container {
	display: flex;
	justify-content: flex-end;
	width: 200px;
	height: 50%;
}

.weather-wrap {
	border: 1px solid white;
	background-color: rgba(0,0,0, 0.7);
	padding: 10px;

}
.weather-container p {
	color: white;
}
/* 날씨 끝 */

/* 애니메이션 시작*/

@keyframes vibration {
  from {
    transform: rotate(3deg);
  }
  to {
    transform: rotate(-3deg);
  }
}

@keyframes vibration2 {
  from {
    transform: rotate(30deg);
  }
  to {
    transform: rotate(-5deg);
  }
}


@keyframes loop{
    0%{
    	top:0px;
    	left:-200px;
    }
    50%{
    	top:0px;
    	left:200px;
   	}
   	100%{
   		top:0px;
   		left:-200px;
   	}
    	

}
/* 애니메이션 끝*/

</style>
<script type="text/javascript">
$(document).ready(function(){
	
	var awake = 0;
	
	$("#dgEgg button").click(function(){
		awake++;
		console.log(awake);
		$(this).css("animation", "vibration 0.1s infinite");
		
		$("#awake").html(awake + " / 20");
		setTimeout(function(){
			$("#dgEgg button").css("animation-play-state", "paused");
		},200);
		
		if(awake==1){
			$("#dgEgg").css("display","none");
			$("#dgbabyawake").css("display","block");
		}
		

	})
	
	$("#dgbabyawake").click(function(){
		awake++;
		$(this).css("animation", "vibration 0.1s infinite");
		
		$("#awake").html(awake + " / 20");
		setTimeout(function(){
			$("#dgbabyawake button").css("animation-play-state", "paused");
		},200);
		
		if(awake==2){
			$("#dgbabyawake").css("display","none");
			$("#dgbaby").css("display","block");
			
		}
	})
	
});

$.getJSON('https://api.openweathermap.org/data/2.5/weather?q=Seoul&appid=89205d456ca75c3e8437b84277bf671e&units=metric'
		, function(result) {
		
			$('.ctemp').append(result.main.temp + '°');
			$('.hightemp').append(result.main.temp_max);
			$('.lowtemp').append(result.main.temp_min);
			
			//result.weather[0].icon
			var wiconUrl = '<img src="http://openweathermap.org/img/wn/'+ result.weather[0].icon +
				'.png" alt="' + result.weather[0].discription +'">'
			$('.icon').append(wiconUrl);
			
			var ct = result.dt;
			
			function convertTime(t) {
				var ot = new Date(t * 1000);
				
				var mt = ot.getMonth()+1;
				var dt = ot.getDate();
				var hr = ot.getHours();
				var m = ot.getMinutes();
				
				return mt + '월 ' + dt + '일  ' + hr + ':' + m
			}
				
			var currentTime = convertTime(ct);
			$('.time').append(currentTime);

	});
</script>
<body>
<div class="big-container">
<!-- 퀵메뉴 시작 -->
<div class="Quick">
    <table class="quickMenuBar">
        <tr>
            <td colspan="2" style="cursor:pointer;"><a href="/dghelper/healthtest">운동성향 테스트</a></td>
        </tr>
        <tr>
            <td colspan="2" style="cursor:pointer;"><a href="/dghelper/healthguide">칼로리사전</a></td>
        </tr>
        <tr>
            <td colspan="2" style="cursor:pointer;"><a href="/dghelper/healthrecord">운동일기장</a></td>
        </tr>
        <tr>
            <td colspan="2" style="cursor:pointer;"><a href="/dghelper/dgmagotchi">득근이 키우기</a></td>
        </tr>
<!--         <tr>
            <td colspan="2" style="cursor:pointer;" onclick="window.scrollTo(0,0);">TOP</td>
        </tr> -->
    </table>
</div>
<!-- 퀵메뉴 끝 -->  
	<div class="small-container">
		<div class="status-container">
			<div class="status-content">
				<p>득근이 상태창</p>
				<p>포만감 : ■■■■■■■□</p>
				<p>피로도 : ■■■■■■□□</p>
				<p>득근력 : ■■■■■■■■</p	>
			</div>
		</div>
		<div class="main-content">
			<div id="awake">
				<p>알을 클릭해주세요 ! </p>
			</div>
			<div id="character">
				<div id="dgEgg" style="display:block;">
					<button>
						<img src="/resources/img/dgmagotchi/dgEgg.png">
					</button>
				</div>
				<div id="dgbabyawake" style="display: none;">
					<button>
						<img src="/resources/img/dgmagotchi/dgbabyawake.png">
					</button>
				</div>
				<div id="dgbaby" style="display: none;">
					<img src="/resources/img/dgmagotchi/dgbaby.png">
				</div>
				<div id="dgbaby2" style="display: none;">
					<img src="/resources/img/dgmagotchi/dgbaby2.png">
				</div>
			</div>
		</div>
		
		<div class="weather-container">
			<div class="weather-content">
				<div class="weather-wrap">
					<div class="weather-widget">
						<div class="weather-back">
						</div>
						<div class="weather-content">
							<p class="time"></p>
							<p class="ctemp">현재 온도 : </p>
						</div>
					</div>
				</div> 
			</div>
		</div>

	</div>
</div>
</body>
</html>