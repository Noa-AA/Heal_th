<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- 부트스트랩 Bootstrap 3 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<style type="text/css">
@import url('https://webfontworld.github.io/sunn/SUIT.css');

html, body, pre, h1, h2, h3, h4, h5, h6, dl, dt, dd, ul, li, ol, th, td, p, blockquote, form, fieldset, legend, menu, nav, section, hgroup, article, header, aside, footer, input, select, textarea, button {
    margin: 0;
    padding: 0;
    list-style:none;
    font-family: 'SUIT';
}

a {
    color: #000;
    text-decoration: none;
}
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
	box-shadow: 1px 1px 10px 0px rgb(0 0 0 / 30%);
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
	box-shadow: 1px 1px 10px 0px rgb(0 0 0 / 30%);
} 

.main-content {
	width: 400px;
	height: 460px;
	margin: 0 auto;
}

.message-container {
	display: flex;
	width: 400px;
	margin: 0 auto;
	justify-content: center;
}

#level {
	color: white;
	
}
#message{
	display: flex;
	font-size: 27px;
	position: absolute;
	font-weight: bold;
}

#savemessage{
    position: absolute;
    top: 100px;
    background-color: rgba(0,0,0, 0.7);
    width: 200px;
    border: 1px solid white;
    color: navajowhite;
    height: 50px;
    padding-top: 12px;
}

#poopzone {
	position: absolute;
	left: 200px;
}
/* 캐릭터 시작 */
#character {
	position: relative;
	top: 270px;
}

#dgbaby {
	position: relative;
	animation: vibration2 1s infinite;
	top: 30px;
/* 	animation: loop 10s infinite; */
/* 	transform: rotateY(0deg); */
}

.poop {
	width: 38px;
	height: 38px;
	position: absolute;
	left: 300px;
	top: 330px;
	background-image: url("/resources/img/dgmagotchi/poop.png");
}

/* .poopsound { */
/* 	width: 50x; */
/* 	height: 42px; */
/* 	position: relative; */
/* 	top: 330px; */
/* 	background-image: url("/resources/img/dgmagotchi/poopsound.png"); */
/* } */
/* 캐릭터 끝 */

.small-container button {
	border: none;
	outline: none;
	background: none;
}

/* 스테이터스 시작 */
.status-container {
	padding: 10px;
	display: flex;
	justify-content: space-around;
	width: 200px;
	height: 210px;
	border: 1px solid white;
	background-color: rgba(0,0,0, 0.7);
	text-align: center;
}

.status-container p, .status-container span {
	color: white;
}

.dginfo {
	width: 100%;
	display: flex;
	justify-content: space-between;
	margin-bottom: 10px;
}

#dgname {
	display: flex;
	border: 1px solid white;
	padding: 5px;
	width: 80px;
    justify-content: center;
    flex-direction: column
}

#dginfo {
	display: flex;
	justify-content: center;
	border: 1px solid white;
	width: 80px;
	padding: 5px;
}

#dginfo p {
	display: contents;
}

#exp-name, #statA-name, #statB-name, #statC-name {
	display: flex;
	justify-content: left;
}

#exp-value, #statA-value, #statB-value, #statC-value {
	display: flex;
	justify-content: right;
	position: relative;
	margin-top: -20px;
}

#save {
	width: 158px;
	height: 45px;
	color: white;
	border: 1px solid white;
	margin-top: 20px;
	position: relative;
}
/* 스테이터스 끝 */

.button-container {
	width: 800px;
	position: relative;
    top: -80px;
}

.button-container p {
	color: white;
}

.button-container button {
	padding: 10px 30px;
	margin: 0 10px;
	background: linear-gradient(120deg, #3f94d6 0 , #1869a7);
	box-shadow: 1px 1px 10px 0px rgb(0 0 0 / 30%);
	border:none;
	border-radius: 5px;
} 

#food:hover, #sleep:hover, #removePoop:hover, #health:hover {
	width: 140px;
	height: 50px;
}


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
	width: 130px;

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
    transform: rotate(20deg);
    left: 0;
  }
  to {
    transform: rotate(-10deg);
    left: -20px;
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
	
	//경험치
	var exp = ${dgmainfo.dgmaExp};
	var statA = ${dgmainfo.dgmaStata};
	var statB = ${dgmainfo.dgmaStatb};
	var statC = ${dgmainfo.dgmaStatc};
	
	if(exp>=10){
		$("#level").html(1);
	}
	if(exp>=20){
		$("#level").html(2);
	}
	if(exp>=50){
		$("#level").html(3);
	}
	if(exp>=100){
		$("#level").html(4);
	}	
	if(exp>=250){
		$("#level").html(5);
	}	
	
	if(statA==0||statB==0||statC==0){
		exp--;
	}
	
	//현재시간
	function convertTime() {
		var ot = new Date();
		
		var mt = ot.getMonth()+1;
		var dt = ot.getDate();
		var hr = ot.getHours();
		var m = ot.getMinutes();
		var s = ot.getSeconds();
		
		if(m<10){
			m = '0' + m;
		}
		if(s<10){
			s = '0' + s;
		}
		return mt + '월 ' + dt + '일  ' + hr + ':' + m + ':' + s
	}

	function interval(){
		var currentTime = convertTime();
		$('.time').html(currentTime);
		
	}

	function init(){
		interval();
		setInterval(interval, 1000);
	}
	
	init();

	function interval2(){
		if(statA>0){
			statA--;
			$("#statA").html(statA);
		}
		if(statB>0){
			statB--;
			$("#statB").html(statB);
		}
		if(statC>0){
			statC--;
			$("#statC").html(statC);
		}
		
	}

	function init2(){
		interval2();
		setInterval(interval2, 2000);
	}
	
	init2();
	
	//현재 온도
	$.getJSON('https://api.openweathermap.org/data/2.5/weather?q=Seoul&appid=89205d456ca75c3e8437b84277bf671e&units=metric'
		, function(result) {
		
			$('.ctemp').append(result.main.temp + '°');
			$('.hightemp').append(result.main.temp_max);
			$('.lowtemp').append(result.main.temp_min);
			
			//result.weather[0].icon
			var wiconUrl = '<img src="http://openweathermap.org/img/wn/'+ result.weather[0].icon +
				'.png" alt="' + result.weather[0].discription +'">'
			$('.icon').append(wiconUrl);
				

	});
	
	

	//득근이 부화시키기
	$("#dgEgg button").click(function(){
		
		exp++;
		$("#exp").html(exp);
		console.log($("#expvalue").val())
		$(this).css("animation", "vibration 0.1s infinite");
		
		$("#message").html(exp + " / 20");
		setTimeout(function(){
			$("#dgEgg button").css("animation-play-state", "paused");
		},200);
		
		if(exp==1){
			$("#dgEgg").css("display","none");
			$("#dgbabyawake").css("display","block");
		}
		

	})

	//득근이 부화
	$("#dgbabyawake").click(function(){
		
		exp++;
		$("#exp").html(exp);
		$(this).css("animation", "vibration2 10s infinite");
		
		$("#message").html(exp + " / 20");
		setTimeout(function(){
			$("#dgbabyawake button").css("animation-play-state", "paused");
		},200);
		
		if(exp==2){
			$("#message").html("");
			$("#dgbabyawake").css("display","none");
			$("#dgbaby").css("display","block");
// 			$("#dgbaby").css("animation", "vibration 0.1s infinite");
			$(".button-container").css("display","block");
		}
	})
	
	//득근이 똥쌈
	function poop(){
		if(exp>=2){
			var bodyWidth = document.querySelector("#character").offsetWidth;
			var randPosX = Math.floor((Math.random()*bodyWidth));
// 			console.log(randPosX);
			
			$("#poopzone").html("<div class='poop'></div>");
			$("#message").fadeIn();
			$("#message").html("득근이의 똥을 치워주세요");
	    	$(".poop").each(function () {
	            $(this).css({
	                left: randPosX
	            });
	        }); 
		}
	}
	
 	function pooploop(){
		setInterval(poop, 10000);
	}
	
	pooploop();
	
	//득근이 똥 치우기
	$("#removePoop").click(function(){
		$(".poop").remove();
		$("#exp").html(exp);
		$("#message").html("");
		exp++;
		statC+=3;
		$("#statC").html(statC);
	
	})
	
	//득근이 밥먹이기
	$("#food").click(function(){
		
		if(statA<100){
				
			$("#dgbaby").css("display","none");
			$("#dgfood").css("display","block");
			$("#exp").html(exp);
			$("#message").fadeIn();
			$("#message").html("냠냠 냠냠 !!");
			$("#message").fadeOut(2000);
			
			setTimeout(function(){
				$("#dgfood").css("display","none");
				$("#dgbaby").css("display","block");
			},2000);
		
			exp+=5;
			statA+=7;
			statB+=3;
			$("#statA").html(statA);
		} else {
			$("#message").fadeIn();
			$("#message").html("배불러요 ㅠㅠ");
			$("#message").fadeOut(2000);
		}
		
	}) 

	//득근이 잠재우기
	$("#sleep").click(function(){
		
		if(statB<100){
			
			$("#dgbaby").css("display","none");
			$("#dgsleep").css("display","block");
			$("#exp").html(exp);
			$("#message").html("드르렁 드르렁 !!");
			$("#message").fadeIn();
			$("#message").fadeOut(2000);
			
			setTimeout(function(){
				$("#dgsleep").css("display","none");
				$("#dgbaby").css("display","block");
			},2000);
		
			exp+=5;
			statB+=10;
			$("#statA").html(statA);
		} else {
			$("#message").fadeIn();
			$("#message").html("안졸려요 ㅠㅠ");
			$("#message").fadeOut(2000);
		}
	})
	
	//득근이 운동하기
	$("#health").click(function(){
		exp+=2;
		$("#dgbaby").css("display","none");
		$("#dgpress").css("display","block");
		$("#exp").html(exp);
		$("#message").html("득근 득근 !!");
		$("#message").fadeIn();
		$("#message").fadeOut(2000);
		
		setTimeout(function(){
			$("#dgpress").css("display","none");
			$("#dgbaby").css("display","block");
		},2000);
	})
	
	$("#save").click(function(){
		console.log("save click")
		$.ajax({
			type: "post",
			url: "/dghelper/dgmasave",
			data: {
				dgmaNo:${dgmainfo.dgmaNo},
				dgmaStata:${dgmainfo.dgmaStata},
				dgmaStatb:${dgmainfo.dgmaStatb},
				dgmaStatc:${dgmainfo.dgmaStatc},
				dgmaStatd:${dgmainfo.dgmaStatd},
				dgmaExp:exp,
				userNo:${dgmainfo.userNo}
			},
			dataType: "json",
			success: (res)=>{
				console.log("AJAX 성공")
				console.log(res)
				$("#savemessage").css("display","block");
				$("#savemessage").fadeIn();
				$("#savemessage").html("저장완료")
				$("#savemessage").fadeOut(3000);
			},
			error: ()=>{
				console.log("AJAX 실패")
			}
		})
	})
	
	if(${dgmainfo.dgmaExp}>=2){
		$("#dgEgg").css("display","none");
		$("#message").html("");
		$("#dgbabyawake").css("display","none");
		$("#dgbaby").css("display","block");
		$(".button-container").css("display","block");
	}


});



</script>
<body>
<div class="big-container">
<!-- <!-- 퀵메뉴 시작
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
        <tr>
            <td colspan="2" style="cursor:pointer;" onclick="window.scrollTo(0,0);">TOP</td>
        </tr>
    </table>
</div>
퀵메뉴 끝   -->
	<div class="small-container">
		<div class="status-container">
			<div class="status-content">
				<div class="dginfo">
					<div id="dgname">
						<p>득근이</p>
					</div>
					<div id="dginfo">
						<p>Lv.</p><div id="level">0</div><br>
					</div>
				</div>
				<span id="statA-name">배부름 : </span>
				<span id="statA-value"><div id="statA">${dgmainfo.dgmaStata }</div>  %</span>
				<span id="statB-name">에너지 : </span>
				<span id="statB-value"><div id="statB">${dgmainfo.dgmaStatb }</div>  %</span>
				<span id="statC-name">청결도 : </span>
				<span id="statC-value"><div id="statC">${dgmainfo.dgmaStatc }</div>  %</span>
				<span id="exp-name">득근력 : </span>
				<span id="exp-value"><div id="exp">${dgmainfo.dgmaExp }</div>  Power</span>
				<button id="save">저장하기</button>
			</div>
		</div>
		<div class="main-content">
			<div class="message-container">
				<div id="message">
					<p>알을 클릭해주세요 ! </p>
				</div>
				
				<div id="savemessage" style="display:none"></div>
			</div>
			<div id="poopzone"></div>
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
				<div id="dgfood" style="display: none;">
					<img src="/resources/img/dgmagotchi/dgfood.png">
				</div>
				<div id="dgsleep" style="display: none;">
					<img src="/resources/img/dgmagotchi/dgsleep.png">
				</div>
				<div id="dgpress" style="display: none;">
					<img src="/resources/img/dgmagotchi/dgpress.png">
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
	<div class="small-content2">
		<div class="button-container" style="display: none;">
			<button id="food"><p>밥먹이기</p></button>
			<button id="sleep"><p>잠재우기</p></button>
			<button id="removePoop"><p>똥치우기</p></button>
			<button id="health"><p>운동하기</p></button>
		</div>
	</div>
</div>
</body>
</html>