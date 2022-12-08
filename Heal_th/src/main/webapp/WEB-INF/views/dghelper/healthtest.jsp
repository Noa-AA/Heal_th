<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../layout/header.jsp" %>
<script src="https://t1.kakaocdn.net/kakao_js_sdk/v1/kakao.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	var E = 0;
	var I = 0;
	var F = 0;
	var T = 0;
	
	$("#start").click(function(){
		console.log("테스트를 시작합니다 !")
		$(".start").css("display","none");
		$(".question1").css("display","block");
	})
	
	$("#E").click(function(){
		E++;
		console.log("E : " + E)
		$(".question1").css("display","none");
		$(".question2").css("display","block");
	})
	
	$("#I").click(function(){
		I++;
		console.log("I : " + I)
		$(".question1").css("display","none");
		$(".question2").css("display","block");
	})

	$("#E2").click(function(){
		E++;
		console.log("E : " + E)
		$(".question2").css("display","none");
		$(".question3").css("display","block");
	})
	
	$("#I2").click(function(){
		I++;
		console.log("I : " + I)
		$(".question2").css("display","none");
		$(".question3").css("display","block");
	})

	$("#F3").click(function(){
		F++;
		console.log("F : " + F)
		$(".question3").css("display","none");
		$(".question4").css("display","block");
	})
	
	$("#T3").click(function(){
		T++;
		console.log("T : " + T)
		$(".question3").css("display","none");
		$(".question4").css("display","block");
	})
	
	$("#E4").click(function(){
		E++;
		console.log("E : " + E)
		$(".question4").css("display","none");
		$(".question5").css("display","block");
	})
	
	$("#I4").click(function(){
		I++;
		console.log("I : " + I)
		$(".question4").css("display","none");
		$(".question5").css("display","block");
	})

	$("#T5").click(function(){
		T++;
		console.log("T : " + T)
		$(".question5").css("display","none");
		$(".question6").css("display","block");
	})
	
	$("#F5").click(function(){
		F++;
		console.log("F : " + F)
		$(".question5").css("display","none");
		$(".question6").css("display","block");
	})

	$("#T6").click(function(){
		T++;
		console.log("T : " + T)
		$(".question6").css("display","none");
		
		if(E>I&&F>T){
			var EF = Math.floor(Math.random()*4+1);
			$(".resultEF").css("display","block");
			if(EF==1){
				$("#result1").css("display","block");
			} else if(EF==2){
				$("#result2").css("display","block");
			} else if(EF==3){
				$("#result3").css("display","block");
			} else if(EF==4){
				$("#result4").css("display","block");
			}
		} else if(E>I&&T>F) {
			var ET = Math.floor(Math.random()*4+5);
			$(".resultET").css("display","block");
			console.log("hihi")
			if(ET==5){
				$("#result5").css("display","block");
			} else if(ET==6){
				$("#result6").css("display","block");
			} else if(ET==7){
				$("#result7").css("display","block");
			} else if(ET==8){
				$("#result8").css("display","block");
			}
		} else if(I>E&&F>T) {
			var IF = Math.floor(Math.random()*4+9);
			$(".resultIF").css("display","block");
			if(IF==9){
				$("#result9").css("display","block");
			} else if(IF==10){
				$("#result10").css("display","block");
			} else if(IF==11){
				$("#result11").css("display","block");
			} else if(IF==12){
				$("#result12").css("display","block");
			}
		} else if(I>E&&T>F) {
			var IT = Math.floor(Math.random()*4+13);
			$(".resultIT").css("display","block");
			if(IT==13){
				$("#result13").css("display","block");
			} else if(IT==14){
				$("#result14").css("display","block");
			} else if(IT==15){
				$("#result15").css("display","block");
			} else if(IT==16){
				$("#result16").css("display","block");
			}
		}
	})
	
	$("#F6").click(function(){
		F++;
		console.log("F : " + F)
		$(".question6").css("display","none");
		
		if(E>I&&F>T){
			var EF = Math.floor(Math.random()*4+1);
			$(".resultEF").css("display","block");
			if(EF==1){
				$("#result1").css("display","block");
			} else if(EF==2){
				$("#result2").css("display","block");
			} else if(EF==3){
				$("#result3").css("display","block");
			} else if(EF==4){
				$("#result4").css("display","block");
			}
		} else if(E>I&&T>F) {
			var ET = Math.floor(Math.random()*4+5);
			$(".resultET").css("display","block");
			console.log("eroor?")
			if(ET==5){
				$("#result5").css("display","block");
			} else if(ET==6){
				$("#result6").css("display","block");
			} else if(ET==7){
				$("#result7").css("display","block");
			} else if(ET==8){
				$("#result8").css("display","block");
			}
		} else if(I>E&&F>T) {
			var IF = Math.floor(Math.random()*4+9);
			$(".resultIF").css("display","block");
			if(IF==9){
				$("#result9").css("display","block");
			} else if(IF==10){
				$("#result10").css("display","block");
			} else if(IF==11){
				$("#result11").css("display","block");
			} else if(IF==12){
				$("#result12").css("display","block");
			}
		} else if(I>E&&T>F) {
			var IT = Math.floor(Math.random()*4+13);
			$(".resultIT").css("display","block");
			if(IT==13){
				$("#result13").css("display","block");
			} else if(IT==14){
				$("#result14").css("display","block");
			} else if(IT==15){
				$("#result15").css("display","block");
			} else if(IT==16){
				$("#result16").css("display","block");
			}
		}
	})
	$(window).scroll(function(){  //스크롤이 움직일때마다 이벤트 발생
	      var position = $(window).scrollTop()+200; // 현재 스크롤바의 위치값을 반환
	      $(".Quick").stop().animate({top:position+"px"}, 400); //해당 오브젝트 위치값 재설정
	});
	
})

// init 체크
if (!Kakao.isInitialized()) {
  Kakao.init('91152ab1d3a261705a53abef71578596');
}
console.log(Kakao.isInitialized());

// 카카오톡 공유 기능
function sendLink() {
    Kakao.Link.sendDefault({
      objectType: 'feed',
      content: {
        title: 'Heal_th\n',
        description: '[나에게 맞는 운동은?]',
        imageUrl:
          'https://i.ibb.co/2Z6mvtn/dgmsct.png',
        link: {
          mobileWebUrl: 'http://localhost:8888/dghelper/healthtest',
          webUrl: 'http://localhost:8888/dghelper/healthtest',
        },
      },
      social: {
        likeCount: 258,  //좋아요 수
        commentCount: 32,  //댓글 수
        sharedCount: 117,  //공유 수
      },
      buttons: [
        {
          title: '웹으로 보기',  //첫 번째 버튼 
          link: {
            mobileWebUrl: 'http://localhost:8888/dghelper/healthtest',  //버튼 클릭 시 이동 링크
            webUrl: 'http://localhost:8888/dghelper/healthtest',
          },
        },
        {
          title: '앱으로 보기',  //두 번째 버튼
          link: {
            mobileWebUrl: 'http://localhost:8888/dghelper/healthtest',
            webUrl: 'http://localhost:8888/dghelper/healthtest',
          },
        },
      ],
    })
}

//링크 복사하여 공유하기 기능
function clip(){

	var url = 'http://localhost:8888/dghelper/healthtest';
	var textarea = document.createElement("textarea");
	document.body.appendChild(textarea);
	url = window.document.location.href;
	textarea.value = url;
	textarea.select();
	document.execCommand("copy");
	document.body.removeChild(textarea);
	alert("URL이 복사되었습니다.")
}
</script>
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

button {
	padding: 10px;
}

.kakaoShareButton {
	width: 10%;
	border: none;
	outline: none;
	background: none;
}

.linkShareButton {
	width: 10%;
	border: none;
	outline: none;
	background: none;
}

#kakaoShareImg {
	width: 100%;
	margin-top: 15px;
}

#linkShareImg {
	width: 100%;
	margin-top: 15px;
}

.start {
	height: 800px;
	background-image: url("/resources/img/dgtest/HtestMain.png");
	margin-bottom: 50px;
}

.question1 {
	height: 800px;
	background-image: url("/resources/img/dgtest/HtestQuestion1.png");
	margin-bottom: 50px;
}

.question2 {
	height: 800px;
	background-image: url("/resources/img/dgtest/HtestQuestion2.png");
	margin-bottom: 50px;
}

.question3 {
	height: 800px;
	background-image: url("/resources/img/dgtest/HtestQuestion3.png");
	margin-bottom: 50px;
}

.question4 {
	height: 800px;
	background-image: url("/resources/img/dgtest/HtestQuestion4.png");
	margin-bottom: 50px;
}

.question5 {
	height: 800px;
	background-image: url("/resources/img/dgtest/HtestQuestion5.png");
	margin-bottom: 50px;
}

.question6 {
	height: 800px;
	background-image: url("/resources/img/dgtest/HtestQuestion6.png");
	margin-bottom: 50px;
}

#result1 {
	height: 800px;
	background-image: url("/resources/img/dgtest/result1.png");
	margin-bottom: 50px;
}

#result2 {
	height: 800px;
	background-image: url("/resources/img/dgtest/result2.png");
	margin-bottom: 50px;
}

#result3 {
	height: 800px;
	background-image: url("/resources/img/dgtest/result3.png");
	margin-bottom: 50px;
}

#result4 {
	height: 800px;
	background-image: url("/resources/img/dgtest/result4.png");
	margin-bottom: 50px;
}

#result5 {
	height: 800px;
	background-image: url("/resources/img/dgtest/result5.png");
	margin-bottom: 50px;
}

#result6 {
	height: 800px;
	background-image: url("/resources/img/dgtest/result6.png");
	margin-bottom: 50px;
}

#result7 {
	height: 800px;
	background-image: url("/resources/img/dgtest/result7.png");
	margin-bottom: 50px;
}

#result8 {
	height: 800px;
	background-image: url("/resources/img/dgtest/result8.png");
	margin-bottom: 50px;
}

#result9 {
	height: 800px;
	background-image: url("/resources/img/dgtest/result9.png");
	margin-bottom: 50px;
}

#result10 {
	height: 800px;
	background-image: url("/resources/img/dgtest/result10.png");
	margin-bottom: 50px;
}

#result11 {
	height: 800px;
	background-image: url("/resources/img/dgtest/result11.png");
	margin-bottom: 50px;
}

#result12 {
	height: 800px;
	background-image: url("/resources/img/dgtest/result12.png");
	margin-bottom: 50px;
}

#result13 {
	height: 800px;
	background-image: url("/resources/img/dgtest/result13.png");
	margin-bottom: 50px;
}

#result14 {
	height: 800px;
	background-image: url("/resources/img/dgtest/result14.png");
	margin-bottom: 50px;
}

#result15 {
	height: 800px;
	background-image: url("/resources/img/dgtest/result15.png");
	margin-bottom: 50px;
}

#result16 {
	height: 800px;
	background-image: url("/resources/img/dgtest/result16.png");
	margin-bottom: 50px;
}

.mbti-content{
	position: relative;
	top: 420px;
	font-family: 'mice';
}

#start, #E, #I, #E2, #I2, #F3, #T3, #E4, #I4, #T5, #F5, #T6, #F6 {
	margin-top: 150px;
	width: 300px;
	height: 100px;
	border-radius: 12px;
	border: none;
}

.question-container {
	box-shadow: 1px 1px 10px 0px rgb(0 0 0 / 30%);	
}
.question-container button:hover {
	background-color: #59d9b0;
}

.question-container button {
	font-family: 'dalseo';
	box-shadow: 1px 1px 10px 0px rgb(0 0 0 / 30%);
}
</style>
<body>
<div id="subvisual">
	<div id="subvisual-A">
		<p id="subv-title">운동성향 테스트</p>
		<p id="subv-content">운동성향테스트 어쩌구저쩌구</p>
	</div>
</div>
<div class="big-container">
	<div class="question-container">
		<div class="start" style="display: block;">
			<div class="mbti-content">
				<button id="start">시작하기</button>
			</div>
		</div>
		<div class="question1" style="display: none;">
			<div class="mbti-content">
				<button id="E">추워도 헬스장은 가야지 !</button>
				<button id="I">집밖은 위험해... 집에서 홈트나 해야지</button>
			</div>
		</div>
		<div class="question2" style="display: none;">
			<div class="mbti-content">
				<button id="I2">난 혼자하는 운동이 더 좋아 !</button>
				<button id="E2">재밌겠다 ! 바로 신청해야지 ~</button>
			</div>
		</div>
		<div class="question3" style="display: none;">
			<div class="mbti-content">
				<button id="F3">헉.. 괜찮아 ?? 많이다쳤어??</button>
				<button id="T3">뭐하다 다쳤어 ?? 병원 가야하는거 아니야  ??</button>
			</div>
		</div>
		<div class="question4" style="display: none;">
			<div class="mbti-content">
				<button id="E4">정중하게 가서 얘기한다.</button>
				<button id="I4">다른운동하며 기다린다.</button>
			</div>
		</div>
		<div class="question5" style="display: none;">
			<div class="mbti-content">
				<button id="T5">내가 한 방법을 친구에게도 알려준다.</button>
				<button id="F5">그런가..? 머쓱해한다.</button>
			</div>
		</div>
		<div class="question6" style="display: none;">
			<div class="mbti-content">
	 			<button id="T6">영양성분이 별로다. 패스~</button>
				<button id="F6">갓성비는 무조건 사야지 !!</button>
			</div>
		</div>
	</div>
	<div class="resultEF" style="display: none;">
		<div id="result1" style="display: none;">
			<div class="mbti-content">
				<p>크로스핏</p>
				<span>▶ 나와 찰떡궁합 운동은?</span>
				<p>사교성도 풍부하고 동정심이 많지만 남의 칭찬이나 비판에 지나치게 민감하게 반응하는 예민보스!</p>
				<p>하지만 운동에 있어 이런 성격은 오히려 스스로를 발전시키는 동기부여 요소가 되어,</p>
				<p>체력을 아끼지 않고 운동을 즐기는 타입이 될 가능성이 있어요.</p>
				<p>당신은 혼자보다는 함께 성장할 수 있는 운동이 제격!</p>
				<p>타고난 카리스마와 화합력을 발휘할 수 있는 팀별 혹은 1:1로 활동하는 커플 크로스핏을 추천합니다!</p><br>
				<p>▶ 이렇게 운동하면 올해도 작심삼일..</p>
				<p>팩폭을 어려워해 상대의 운동 효과는 미미해지는 상황이 벌어질 수도 있어요.</p>
				<p>좀 더 적극적인 표현도 괜찮아요!</p>
				<button onclick="sendLink()" class="kakaoShareButton"><img src="/resources/img/dgtest/kakaoshare.png" id="kakaoShareImg">
				</button>
				<button onclick="clip(); return false;" class="linkShareButton"><img src="/resources/img/dgtest/sharelink.png" id="linkShareImg">
				</button>
			</div>
		</div>
		<div id="result2" style="display: none;">
			<div class="mbti-content">
				<p>줌바</p>
				<p>▶ 나와 찰떡궁합 운동은?</p>
				<p>한눈에 보기에도 재미있어 보이는 운동에 충동적으로 달려들지만 집중력이 부족하고,</p>
				<p>엄격한 규율을 극혐하는 성격이라 반복적이고 규칙이 복잡한 운동을 만날 경우 손절할 가능성이 있어요.</p>
				<p>화려한 것을 좋아하는 즉흥러에겐 줌바댄스가 찰떡이네요!</p>
				<p>춤추듯 운동하며 큰 규율도 없고 반복적이지 않으니 당신에겐 더할 나위 없는 운동입니다</p><br>
				<p>▶ 이렇게 운동하면 올해도 작심삼일..</p>
				<p>자신의 능력을 과시하기 십상이라 어떤 운동이든 감정적으로 덤빌 염려가 있어요!</p>
				<p>이 점만 유의하세요!</p>
				<button onclick="sendLink()" class="kakaoShareButton"><img src="/resources/img/dgtest/kakaoshare.png" id="kakaoShareImg">
				</button>
				<button onclick="clip(); return false;" class="linkShareButton"><img src="/resources/img/dgtest/sharelink.png" id="linkShareImg">
				</button>
			</div>
		</div>
		<div id="result3" style="display: none;">
			<div class="mbti-content">
				<p>동호회 활동</p>
				<p>▶ 나와 찰떡궁합 운동은?</p>
				<p>낙천적이고 지금 생활에 적당히 만족하는 긍정파.</p>
				<p>남들과 단합해가면서 여유 있게 즐기는 정도라면 모를까,</p>
				<p>굳이 스트레스 받아가며 운동하는 것을 이해하지 못해요.</p>
				<p>이런 성향의 당신에겐 동호회 활동(낚시, 산책.. 등)을 할 수 있는 운동이 잘 맞아요!</p>
				<p>익스트림한 운동만 아니면 무난하게 적응하며 건강도 챙길 수 있습니다!</p><br>
				<p>▶ 이렇게 운동하면 올해도 작심삼일..</p>
				<p>일대일로 경쟁하거나 서바이벌을 필요로 하는 운동은 쥐약.</p>
				<p>단순한 승부보단 팀 안에서의 공헌과 협동을 추구하는 타입이라 괜히 의욕이 저하될 수 있으니 주의!</p>
				<button onclick="sendLink()" class="kakaoShareButton"><img src="/resources/img/dgtest/kakaoshare.png" id="kakaoShareImg">
				</button>
				<button onclick="clip(); return false;" class="linkShareButton"><img src="/resources/img/dgtest/sharelink.png" id="linkShareImg">
				</button>
			</div>
		</div>
		<div id="result4" style="display: none;">
			<div class="mbti-content">
				<p>러닝크루</p>
				<p>▶ 나와 찰떡궁합 운동은?</p>
				<p>사교성이 좋고 만사를 즐기는 긍정 보스!</p>
				<p>주목받을수록 에너지가 솟구치는 타입이라 야외 스포츠를 추천할게요!</p>
				<p>여럿 사이에서 빛을 발하는 러닝 크루어떠세요?</p>
				<p>야외에서 사람들과 소통하며 운동하는 것만으로도 당신은 충만한 만족감을 느끼게 될 거에요</p><br>
				<p>▶ 이렇게 운동하면 올해도 작심삼일..</p>
				<p>부족한 것은 바로 계획성.</p>
				<p>운동하다가도 급 술 약속이 생기면 튀어 나가기 십상.</p>
				<button onclick="sendLink()" class="kakaoShareButton"><img src="/resources/img/dgtest/kakaoshare.png" id="kakaoShareImg">
				</button>
				<button onclick="clip(); return false;" class="linkShareButton"><img src="/resources/img/dgtest/sharelink.png" id="linkShareImg">
				</button>
			</div>
		</div>
	</div>
	<div class="resultET" style="display: none;">
		<div id="result5" style="display: none;">
			<div class="mbti-content">
				<p>폴댄스</p>
				<p>▶ 나와 찰떡궁합 운동은?</p>
				<p>머리가 좋고 타고난 정신력 덕에 트레이너 없이도 혼자 척척!</p>
				<p>에너지가 넘치고 운동 능력도 뛰어나지만</p>
				<p>자칫 과도한 승부욕, 과시욕으로 헬스장 꼴불견이 될 수 있는 점에 주의하세요!</p>
				<p>어려운 동작을 익혀나가며 눈에 띄는 성과가 보이는 폴댄스를 추천합니다</p><br>
				<p>▶ 이렇게 운동하면 올해도 작심삼일..</p>
				<p>열정적인 만큼 번아웃이 오기도 쉬운 타입.</p>
				<p>목표도 좋지만 자신의 컨디션을 섬세하게 살피는 주의력이 필수!</p>
				<button onclick="sendLink()" class="kakaoShareButton"><img src="/resources/img/dgtest/kakaoshare.png" id="kakaoShareImg">
				</button>
				<button onclick="clip(); return false;" class="linkShareButton"><img src="/resources/img/dgtest/sharelink.png" id="linkShareImg">
				</button>
			</div>
		</div>
		<div id="result6" style="display: none;">
			<div class="mbti-content">
				<p>VR운동</p>
				<p>▶ 나와 찰떡궁합 운동은?</p>
				<p>운동을 끊으면 길어야 한 달.</p>
				<p>반복적이고 일상적인 운동은 쉽게 지루함을 느끼는 전형적인 뒷심 부족 스타일.</p>
				<p>한번 시작하면 곧잘 기본은 해내는 능력치를 가졌지만</p>
				<p>세부적인 디테일에는 약해 겉핥기식 운동을 할 가능성이 높아요! </p>
				<p>언제라도 내가 원하는 때 자유롭게 할 수 있는 VR운동 어떠세요?</p>
				<p>VR 화면을 통해 내 움직임을 면밀히 확인할 수 있는 피트니스도 시도해보면 좋을 거에요.</p><br>
				<p>▶ 이렇게 운동하면 올해도 작심삼일..</p>
				<p>자신에게 매우 관대해지면서 자기 합리화의 시기가 빨리 오는 편.</p>
				<p>좀 더 세부적인 계획과 목표를 설정해야 해요!</p>
				<button onclick="sendLink()" class="kakaoShareButton"><img src="/resources/img/dgtest/kakaoshare.png" id="kakaoShareImg">
				</button>
				<button onclick="clip(); return false;" class="linkShareButton"><img src="/resources/img/dgtest/sharelink.png" id="linkShareImg">
				</button>
			</div>
		</div>
		<div id="result7" style="display: none;">
			<div class="mbti-content">
				<p>테니스</p>
				<p>▶ 나와 찰떡궁합 운동은?</p>
				<p>활동을 잘 주도하고 구체적이고 현실적인 것이 이 유형의 가장 큰 특성.</p>
				<p>자기 관리가 철저하고 쉴 때도 부지런하게 움직이는 성향이라</p>
				<p>자신과 맞는 종목이라면 운동도 생활화할 타입이에요.</p>
				<p>테니스, 그 중에서도 팀별 랠리가 딱이에요!</p>
				<p>어디서도 지지않는 승부욕과 리더쉽으로 당신 팀이 승승장구하겠네요!</p><br>
				<p>▶ 이렇게 운동하면 올해도 작심삼일..</p>
				<p>여럿이 함께하는 운동이 잘 맞지만 자칫 꼰대 리더가 될 가능성이 농후...</p>
				<button onclick="sendLink()" class="kakaoShareButton"><img src="/resources/img/dgtest/kakaoshare.png" id="kakaoShareImg">
				</button>
				<button onclick="clip(); return false;" class="linkShareButton"><img src="/resources/img/dgtest/sharelink.png" id="linkShareImg">
				</button>
			</div>
		</div>
		<div id="result8" style="display: none;">
			<div class="mbti-content">
				<p>복싱</p>
				<p>▶ 나와 찰떡궁합 운동은?</p>
				<p>"피할 수 없다면 즐겨~"가 모토.</p>
				<p>기본적으로 운동을 좋아하는 타입인데 이는 타고난 순발력과 적응력에서 비롯된 성향 때문이죠.</p>
				<p>다만 천성이 게을러 마음먹기까지 많은 시간이 소요 되시죠?</p>
				<p>차라리 한눈에도 스릴 넘치고 흥미로워 보이는 운동이 오히려 자극이 될 수 있어요.</p>
				<p>타고난 순발력과 위기 대응 능력을 발휘하기 좋은 복싱으로</p>
				<p>건강과 다이어트 두마리 토끼를 잡으세요!</p><br>
				<p>▶ 이렇게 운동하면 올해도 작심삼일..</p>
				<p>내면적인 수양이나 긴 설명을 필요로 하는 운동은 이들의 잠재 욕구도 떨어뜨릴 수 있단 사실을 기억하도록.</p>
				<button onclick="sendLink()" class="kakaoShareButton"><img src="/resources/img/dgtest/kakaoshare.png" id="kakaoShareImg">
				</button>
				<button onclick="clip(); return false;" class="linkShareButton" class="linkShareButton"><img src="/resources/img/dgtest/sharelink.png" id="linkShareImg">
				</button>
			</div>
		</div>
	</div>
	<div class="resultIF" style="display: none;">
		<div id="result9" style="display: none;">
			<div class="mbti-content">
				<p>클라이밍</p>
				<p>▶ 나와 찰떡궁합 운동은?</p>
				<p>조화로운 관계를 중요시하는 만큼 내면에 갈등이 많은 편.</p>
				<p>공감력이 높은 만큼 상처받기도 쉬운 타입이라</p>
				<p>단체 운동을 했다간 불편한 관계가 생길 수 있으니 홀로 집중할 수 있는 종목이 베스트에요.</p>
				<p>당신에겐 문제 풀이를 하듯 뛰어난 집중력을 발휘할 수 있는 클라이밍이 제격!</p>
				<p>복잡한 상념을 잠시 잊기에도 딱 좋아요</p><br>
				<p>▶ 이렇게 운동하면 올해도 작심삼일..</p>
				<p>스트레스 받거나 눈에 띄는 결과가 없으면 쉽게 포기하는 편이니</p>
				<p>운동 강도를 섬세하게 조절하자.</p>
				<button onclick="sendLink()" class="kakaoShareButton"><img src="/resources/img/dgtest/kakaoshare.png" id="kakaoShareImg">
				</button>
				<button onclick="clip(); return false;" class="linkShareButton" class="linkShareButton"><img src="/resources/img/dgtest/sharelink.png" id="linkShareImg">
				</button>
			</div>
		</div>
		<div id="result10" style="display: none;">
			<div class="mbti-content">
				<p>필록싱</p>
				<p>▶ 나와 찰떡궁합 운동은?</p>
				<p>이상과 목표는 높지만 실행력은 부족한 스타일.</p>
				<p>막상 하게 되면 타고난 완벽주의 성향 덕에 고강도 운동도 무난히 클리어하곤 하죠.</p>
				<p>자신의 가치 기준에 부합해야 꾸준히 지속하는 편인 당신에겐</p>
				<p>필록싱 같은 하이브리드 운동이 딱이에요!</p><br>
				<p>▶ 이렇게 운동하면 올해도 작심삼일..</p>
				<p>식단과 일상까지 샅샅이 알려고 하는 프로 참견러가 있다면 운동 손절!</p>
				<button onclick="sendLink()" class="kakaoShareButton"><img src="/resources/img/dgtest/kakaoshare.png" id="kakaoShareImg">
				</button>
				<button onclick="clip(); return false;" class="linkShareButton"><img src="/resources/img/dgtest/sharelink.png" id="linkShareImg">
				</button>
			</div>
		</div>
		<div id="result11" style="display: none;">
			<div class="mbti-content">
				<p>요가</p>
				<p>▶ 나와 찰떡궁합 운동은?</p>
				<p>인내심 깊고 꼼꼼하지만 주변 사람을 배려하고 챙기는 특유의 사려 깊음이 운동할 때도 어김없이 발휘되는 타입!</p>
				<p>제대로 효과를 보고 싶다면 오로지 혼자서 하는 운동을 추천해요.</p>
				<p>무덤덤해 보여도 속으로는 수만 가지 생각을 하는 편인 당신에겐</p>
				<p>요가처럼 스스로에게 차분히 집중할 수 있는 종목이 베스트!</p><br>
				<p>▶ 이렇게 운동하면 올해도 작심삼일..</p>
				<p>수업을 잘 못 따라오는 동료가 옆에 있다?</p>
				<p>챙기느라 바빠 운동 효과는 0에 수렴.</p>
				<button onclick="sendLink()" class="kakaoShareButton"><img src="/resources/img/dgtest/kakaoshare.png" id="kakaoShareImg">
				</button>
				<button onclick="clip(); return false;" class="linkShareButton"><img src="/resources/img/dgtest/sharelink.png" id="linkShareImg">
				</button>
			</div>
		</div>
		<div id="result12" style="display: none;">
			<div class="mbti-content">
				<p>라이딩</p>
				<p>▶ 나와 찰떡궁합 운동은?</p>
				<p>온화하지만 결단력, 추진력이 부족해 운동도 차일피일 마냥 미루는 스타일.</p>
				<p>하지만 한 번 시작하면 누구보다 적극적이죠.</p>
				<p>여유롭게 혼자만의 시간과 공간이 필요한 당신에겐 라이딩이 제격!</p><br>
				<p>▶ 이렇게 운동하면 올해도 작심삼일..</p>
				<p>여린 마음에 팩폭을 서슴없이 날리는 트레이너는 운동을 회피하게 만드는 주범.</p>
				<button onclick="sendLink()" class="kakaoShareButton"><img src="/resources/img/dgtest/kakaoshare.png" id="kakaoShareImg">
				</button>
				<button onclick="clip(); return false;" class="linkShareButton"><img src="/resources/img/dgtest/sharelink.png" id="linkShareImg">
				</button>
			</div>
		</div>
	</div>
	<div class="resultIT" style="display: none;">
		<div id="result13" style="display: none;">
			<div class="mbti-content">
				<p>클레이사격</p>
				<p>▶ 나와 찰떡궁합 운동은?</p>
				<p>특유의 차분하고 냉철한 성격으로 꾸준히 한 우물만 파는 당신.</p>
				<p>다만 다소 고집스럽고 타인에 무관심 편이라 나와 기구, 둘만의 세상 속에서 운동하는 쪽이 나아요.</p>
				<p>이런 성향의 당신에겐 오로지 표적과 나만이 존재하는 클레이 사격을 추천!</p>
				<p>집중력 킹인 당신이니까 좋은 두각을 나타낼 거에요!</p><br>
				<p>▶ 이렇게 운동하면 올해도 작심삼일..</p>
				<p>뒤풀이가 동반되는 운동 동호회는 이들의 활동 욕구를 반감시키는 마이너스 요소.</p>
				<button onclick="sendLink()" class="kakaoShareButton"><img src="/resources/img/dgtest/kakaoshare.png" id="kakaoShareImg">
				</button>
				<button onclick="clip(); return false;" class="linkShareButton"><img src="/resources/img/dgtest/sharelink.png" id="linkShareImg">
				</button>
			</div>
		</div>
		<div id="result14" style="display: none;">
			<div class="mbti-content">
				<p>EMS트레이닝</p>
				<p>▶ 나와 찰떡궁합 운동은?</p>
				<p>귀차니즘이 온몸을 잠식해버리는 타입!</p>
				<p>소파에 늘어져 홈 트레이닝 영상을 보면서 의심하고 비판할 거리를 계속해서 찾아내요.</p>
				<p>웬만한 팩폭도 딱히 먹히지 않는 강철 멘탈 소유자 당신에겐 생각할 시간 따위 주지 않고</p>
				<p>단시간에 최대의 운동 효과를 낼 수 있는 종목이 제격입니다.</p>
				<p>EMS 트레이닝 어떠세요?</p><br>
				<p>▶ 이렇게 운동하면 올해도 작심삼일..</p>
				<p>강압적인 트레이너와는 상극, 밑도 끝도 없는 근력 뽐뿌 운동과는 초상극!</p>
				<button onclick="sendLink()" class="kakaoShareButton"><img src="/resources/img/dgtest/kakaoshare.png" id="kakaoShareImg">
					
				</button>
				<button onclick="clip(); return false;" class="linkShareButton"><img src="/resources/img/dgtest/sharelink.png" id="linkShareImg">
				</button>
			</div>
		</div>
		<div id="result15" style="display: none;">
			<div class="mbti-content">
				<p>수영</p>
				<p>▶ 나와 찰떡궁합 운동은?</p>
				<p>즉흥적인 것은 극혐.</p>
				<p>계획을 짜고 그 테두리 안에서 움직이는 걸 좋아하는 타입이라</p>
				<p>반복적, 규칙적인 스포츠가 적합해요.</p>
				<p>남들의 의견보다는 나 자신을 신뢰하는 편이라</p>
				<p>팀워크가 필요한 단체 운동이나 대인 운동보다는 혼자서 할 수 있는 종목이 제격이죠.</p>
				<p>예를 들면 수영!</p>
				<p>혼자서 차근차근 목표를 설정하고 달성하는 데서 만족감을 느낄 수 있을 거에요</p><br>
				<p>▶ 이렇게 운동하면 올해도 작심삼일..</p>
				<p>계획이나 가이드가 없으면 초반부터 흔들리기 십상이니</p>
				<p>전문가의 트레이닝으로 스텝을 밟아나갈 것.</p>
				<button onclick="sendLink()" class="kakaoShareButton"><img src="/resources/img/dgtest/kakaoshare.png" id="kakaoShareImg">
				</button>
				<button onclick="clip(); return false;" class="linkShareButton"><img src="/resources/img/dgtest/sharelink.png" id="linkShareImg">
				</button>
			</div>
		</div>
		<div id="result16" style="display: none;">
			<div class="mbti-content">
				<p>서핑</p>
				<p>▶ 나와 찰떡궁합 운동은?</p>
				<p>겁이 없고 위기에 강하며 순간 집중력이 좋은 당신!</p>
				<p>하지만 프로 귀찮러답게 자의적 아싸의 기질을 가지고 있군요.</p>
				<p>단체로 가도 각자의 재미와 스릴을 즐길 수 있는 서핑을 추천합니다.</p>
				<p>▶ 이렇게 운동하면 올해도 작심삼일..</p>
				<p>호불호가 강하고 충동적인 성향이 강하기 때문에</p>
				<p>장기적으로 레슨을 받아야하는 대기만성형 운동은</p>
				<p>당신의 집중력과 흥미를 떨어뜨리기 쉬워요.</p>
				<button onclick="sendLink()" class="kakaoShareButton"><img src="/resources/img/dgtest/kakaoshare.png" id="kakaoShareImg">
				</button>
				<button onclick="clip(); return false;" class="linkShareButton"><img src="/resources/img/dgtest/sharelink.png" id="linkShareImg">
				</button>
			</div>
		</div>
	</div>

</div>
</body>
</html>