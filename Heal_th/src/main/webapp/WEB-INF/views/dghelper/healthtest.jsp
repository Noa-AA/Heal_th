<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../layout/header.jsp" %>
<style type="text/css">
.big-container {
	width: 800px;
	margin: 0 auto;
	text-align: center;
}

button {
	padding: 10px;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	
	var E = 0;
	var I = 0;
	var F = 0;
	var T = 0;
	
	$("#start").click(function(){
		console.log("테스트를 시작합니다 !")
		console.log(Math.floor(Math.random()*4+1))
		console.log(Math.floor(Math.random()*4+5))
		console.log(Math.floor(Math.random()*4+9))
		console.log(Math.floor(Math.random()*4+13))
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
		console.log("I : " + T)
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
				$("#1").css("display","block");
			} else if(EF==2){
				$("#2").css("display","block");
			} else if(EF==3){
				$("#3").css("display","block");
			} else if(EF==4){
				$("#4").css("display","block");
			}
		} else if(E>I&&T>F) {
			var ET = Math.floor(Math.random()*4+5);
			$(".resultET").css("display","block");
		} else if(I>E&&F>T) {
			var IT = Math.floor(Math.random()*4+9);
			$(".resultIF").css("display","block");
		} else if(I>E&&T>F) {
			var IF = Math.floor(Math.random()*4+13);
			$(".resultIT").css("display","block");
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
				$("#1").css("display","block");
			} else if(EF==2){
				$("#2").css("display","block");
			} else if(EF==3){
				$("#3").css("display","block");
			} else if(EF==4){
				$("#4").css("display","block");
			}
		} else if(E>I&&T>F) {
			$(".resultET").css("display","block");
		} else if(I>E&&F>T) {
			$(".resultIF").css("display","block");
		} else if(I>E&&T>F) {
			$(".resultIT").css("display","block");
		}
	})
	
})

// 카카오톡 공유 기능
function sendLink() {
    let resultImages = document.querySelectorAll(".result-image > img");
    console.log(resultImages);
    console.dir(resultImages);
    let resultTitles = document.querySelectorAll(".result-name > h1");
    console.dir(resultTitles);
    let resultHashtagGroups = document.querySelectorAll(".result-hashtag");
    console.log(resultHashtagGroups);

    let resultImage = resultImages[resultPage];
    let resultTitle = resultTitles[resultPage];
    let resultHashtagGroup = resultHashtagGroups[resultPage];
    let resultHashtags = resultHashtagGroup.querySelectorAll("span");

    Kakao.Link.sendDefault({
      objectType: 'feed',
      content: {
        title: resultTitle.innerText,
        description: resultHashtags[0].innerText + resultHashtags[1].innerText + resultHashtags[2].innerText + resultHashtags[3].innerText,
        imageUrl: resultImage.src,
        link: {
          mobileWebUrl: 'https://worktest1.netlify.app',
          webUrl: 'https://worktest1.netlify.app',
        },
      },
      buttons: [
        {
          title: '테스트하러 가기',
          link: {
            mobileWebUrl: 'https://worktest1.netlify.app',
            webUrl: 'https://worktest1.netlify.app',
          },
        }
      ],
    })
  }

// 트위터 공유 기능
function shareTwitter() {
    var sendText = "업무방식 테스트"; // 전달할 텍스트
    var sendUrl = "https://worktest1.netlify.app"; // 전달할 URL
    window.open("https://twitter.com/intent/tweet?text=" + sendText + "&url=" + sendUrl);
}

// 페이스북 공유 기능
function shareFacebook() {
    var sendUrl = "https://worktest1.netlify.app"; // 전달할 URL
    window.open("http://www.facebook.com/sharer/sharer.php?u=" + sendUrl);
}

</script>
<body>
<!-- 퀵메뉴 시작 -->
<div class="Quick" style="position: absolute; left: 250px; top: 300px;">
    <table class="quickMenuBar" style="">
        <tr>
            <td colspan="2" style="cursor:pointer;"><a href="/dghelper/healthrecord">운동일기장</a></td>
        </tr>
        <tr>
            <td colspan="2" style="cursor:pointer;"><a href="/dghelper/healthguide">운동가이드</a></td>
        </tr>
        <tr>
            <td colspan="2" style="cursor:pointer;"><a href="/dghelper/healthtest">운동성향 테스트</a></td>
        </tr>
        <tr>
            <td colspan="2" style="cursor:pointer;" onclick="window.scrollTo(0,0);">TOP</td>
        </tr>
    </table>
</div>
<!-- 퀵메뉴 끝 -->   

<div class="big-container">
	<div class="start" style="display: block;">
		<button id="start">시작하기</button>
	</div>
	<div class="question1" style="display: none;">
		<p>운동을 해야 하지만 바깥의 날씨는 영하 5도...</p>
		<button id="E">추워도 헬스장은 가야지 !</button>
		<button id="I">집밖은 위험해... 집에서 홈트나 해야지</button>
	</div>
	<div class="question2" style="display: none;">
		<p>집 앞 헬스장에서 그룹PT 무료 이벤트를 하고있다. 당신의 선택은 ?</p>
		<button id="I2">난 혼자하는 운동이 더 좋아 !</button>
		<button id="E2">재밌겠다 ! 바로 신청해야지 ~</button>
	</div>
	<div class="question3" style="display: none;">
		<p>친구가 운동을하다가 다쳤다. 친구에게 건낼 말은?</p>
		<button id="F3">헉.. 괜찮아 ?? 많이다쳤어??</button>
		<button id="T3">뭐하다 다쳤어 ?? 병원 가야하는거 아니야  ??</button>
	</div>
	<div class="question4" style="display: none;">
		<p>헬스장에서 누가 1시간째 운동기구를 독점하고있다. 어떻게 할것인가!? </p>
		<button id="E4">당당하게 가서 말한다.</button>
		<button id="I4">다른운동하며 기다린다.</button>
	</div>
	<div class="question5" style="display: none;">
		<p>친구가 나보고 살이 빠졌다고 한다. 당신의 반응은 ?</p>
		<button id="T5">너도 식단과 운동을 병행하면 할 수 있어 !</button>
		<button id="F5">그런가..?</button>
	</div>
	<div class="question6" style="display: none;">
		<p>누가 나에게 갓성비 프로틴을 추천해줬다.</p>
		<button id="T6">내가 지금 먹고있는것보다 영양성분이 별로다. 패스~</button>
		<button id="F6">갓성비는 무조건 사야지 !!</button>
	</div>
	
	<div class="resultEF" style="display: none;">
		<p id="1" style="display: none">크로스핏</p>
		<p id="2" style="display: none">줌바</p>
		<p id="3" style="display: none">등산</p>
		<p id="4" style="display: none">러닝크루</p>
		<button onclick="sendLink()">카카오톡공유</button>
		<button onclick="shareTwitter()">트위터공유</button>
		<button onclick="shareFacebook()">페이스북공유</button>
	</div>
	<div class="resultET" style="display: none;">
		<p id="5" style="display: none">폴댄스</p>
		<p id="6" style="display: none">VR운동</p>
		<p id="7" style="display: none">테니스</p>
		<p id="8" style="display: none">복싱</p>
		<button onclick="sendLink()">카카오톡공유</button>
		<button onclick="shareTwitter()">트위터공유</button>
		<button onclick="shareFacebook()">페이스북공유</button>
	</div>
	<div class="resultIF" style="display: none;">
		<p id="9" style="display: none">클라이밍</p>
		<p id="10" style="display: none">필록싱</p>
		<p id="11" style="display: none">요가</p>
		<p id="12" style="display: none">라이딩</p>
		<button onclick="sendLink()">카카오톡공유</button>
		<button onclick="shareTwitter()">트위터공유</button>
		<button onclick="shareFacebook()">페이스북공유</button>
	</div>
	<div class="resultIT" style="display: none;">
		<p id="13" style="display: none">클라이밍</p>
		<p id="14" style="display: none">필록싱</p>
		<p id="15" style="display: none">요가</p>
		<p id="16" style="display: none">라이딩</p>
		<button onclick="sendLink()">카카오톡공유</button>
		<button onclick="shareTwitter()">트위터공유</button>
		<button onclick="shareFacebook()">페이스북공유</button>
	</div>

</div>
</body>
</html>