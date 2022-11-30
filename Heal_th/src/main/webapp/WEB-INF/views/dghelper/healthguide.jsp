<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../layout/header.jsp" %>
<script type="text/javascript">
$(document).ready(function(){
	
	$(window).scroll(function(){  //스크롤이 움직일때마다 이벤트 발생
	      var position = $(window).scrollTop()+300; // 현재 스크롤바의 위치값을 반환
	      $(".Quick").stop().animate({top:position+"px"}, 400); //해당 오브젝트 위치값 재설정
	});
	
	$("#search").click(function(){		
		console.log("#ajax click")	
		
		$.ajax({
			type: "get"
			, url: "/dghelper/calorie?foodname=" + $("#foodname").val()
			, data: {}
			, dataType: "html"
			, success: function(res){
				console.log("AJAX 성공")
				
				console.log(res)
				
				$("#result").html(res)
			}
			, error: function(){
				console.log("AJAX 실패")
				
			}
		})
		
	})
});

</script>
<style type="text/css">
.big-container {
	width: 1440px;
	margin: 0 auto;
	text-align: center;
}

</style>
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
	<span>운동 가이드</span>
	
	<c:set var="bmr" value="${66.47 +(13.75 * bodyInfo.weight) +(5 * bodyInfo.height) - (6.76 * 30) }"  />
	
	<span>나의 기초대사량 : <fmt:formatNumber value="${bmr }"/>칼로리</span>
	
	<p>칼로리 검색</p>
	<p><input type="text" id="foodname", name="foodname" placeholder="음식명을 입력해주세요."></p>
	<button id="search">검색</button>
	<div id="result"></div>
	
	<p>오늘 얼마나 드셨어요 ?</p>
	<p><input type="text" placeholder="섭취한 칼로리를 입력해주세요."></p>	
	<button>저장</button>
	<!-- http://openapi.foodsafetykorea.go.kr/api/인증키/서비스명/요청파일타입/요청시작위치/요청종료위치/변수명=값&변수명=값2 -->
	
	<p>섭취한 칼로리 : </p>
	<p>소모해야할 칼로리 : </p>
</div>
</body>
</html>