<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../layout/header.jsp" %>
<script type="text/javascript">
$(document).ready(function(){
	
/* 	$(window).scroll(function(){  //스크롤이 움직일때마다 이벤트 발생
	      var position = $(window).scrollTop()+200; // 현재 스크롤바의 위치값을 반환
	      $(".Quick").stop().animate({top:position+"px"}, 400); //해당 오브젝트 위치값 재설정
	}); */
	
	$("#search").click(function(){
		
		if($("#foodname").val()){
			console.log("#search click")
			$("html").css("cursor", "wait");
			$("#result").html("- L O A D I N G -")
			$.ajax({
				type: "get"
				, url: "/dghelper/calorie?foodname=" + $("#foodname").val()
				, data: {}
				, dataType: "html"
				, success: function(res){
					console.log("AJAX 성공")
					
					console.log(res)
					$("html").css("cursor", "default");
					$("#result").html(res)
				}
				, error: function(){
					console.log("AJAX 실패")
					
				}
			})
		} else {
			$("#result").html("음식명을 입력해주세요.");
		}
		
	})

	$("#save").click(function(){		
		console.log("#save click")	
		
		if(!$.isNumeric($("#kcal").val())){
			$("#resultkcal").html("숫자값을 입력해주세요.");
		} else {
		
			$.ajax({
				type: "get"
				, url: "/dghelper/calorieProc?kcal=" + $("#kcal").val() + "&bmr=" +$("#bmrvalue").val()
				, data: {}
				, dataType: "html"
				, success: function(res){
					console.log("AJAX 성공")
					
					console.log(res)
					
					$("#resultkcal").html(res)
				}
				, error: function(){
					console.log("AJAX 실패")
					
				}
			})
		}
	})
});

</script>
<style type="text/css">
#bmr {
	float: right;
}
.big-container {
	width: 1200px;
	margin: 0 auto;
}

.medium-container {
    box-shadow: 1px 0px 10px 0px rgb(0 0 0 / 30%);	
}

.small-container {
    height: 80px;
    display: flex;
    flex-direction: column;
    align-items: end;
    justify-content: center;
    padding: 15px;
    font-family: 'SUIT';
    font-weight: bold;
    font-size: 14px;
    color: black;
    background: linear-gradient(#fbf5fd 0 , #eaecfb);
}
.small-container2 {
	position: relative;
	min-height: 550px;
	width: 1200px;
    display: flex; 
}

.cal, .food {
	text-align: center;
	border: 1px solid silver;
	min-height: 275px;
	padding: 15px;
	width: 450px;
}

.calc {
	text-align: center;
	border: 1px solid silver;
	min-height: 275px;
	padding: 15px;
	width: 300px;
}
input {
	text-align: center;
}

#foodname, #kcal {
	padding: 10px;
	margin: 0;
	height: 48px;
	width: 252px;
	outline: none;
	border: none;
}
#search, #save {
	padding: 10px;
	border: none;
	outline: none;
	background: #18a9ec;
}

.input-box {
	display: flex;
	justify-content: center;
	margin: 10px auto;
	width: 300px;
	box-shadow: 1px 1px 10px 0px rgb(0 0 0 / 30%);
}

body {
	padding-top: 355px;
}
</style>
<body>
<div id="subvisual">
	<div id="subvisual-A">
		<p id="subv-title">칼로리 사전</p>
		<p id="subv-content">칼로리를 계산하여 체계적으로 관리해봐요</p>
	</div>
</div>
<!-- <!-- 퀵메뉴 시작 -->
<!-- <div class="Quick"> -->
<!--     <table class="quickMenuBar"> -->
<!--         <tr> -->
<!--             <td colspan="2" style="cursor:pointer;"><a href="/dghelper/healthtest">운동성향 테스트</a></td> -->
<!--         </tr> -->
<!--         <tr> -->
<!--             <td colspan="2" style="cursor:pointer;"><a href="/dghelper/healthguide">칼로리사전</a></td> -->
<!--         </tr> -->
<!--         <tr> -->
<!--             <td colspan="2" style="cursor:pointer;"><a href="/dghelper/healthrecord">운동일기장</a></td> -->
<!--         </tr> -->
<!--         <tr> -->
<!--             <td colspan="2" style="cursor:pointer;"><a href="/dghelper/dgmagotchi">득근이 키우기</a></td> -->
<!--         </tr> -->
<!-- <!--         <tr> -->
<!--             <td colspan="2" style="cursor:pointer;" onclick="window.scrollTo(0,0);">TOP</td> -->
<!--         </tr> -->
<!--     </table> -->
<!-- </div> -->
<!-- 퀵메뉴 끝 --> 
<div class="big-container">
	<div class="medium-container">
		<div class="small-container">     
		
			<!-- male일 경우 기초대사량 -->
			<c:if test="${bodyInfo ne undefined}">
				<c:if test="${user.userGender eq 'male'}">
						<c:set var="bmr" value="${66.47 +(13.75 * bodyInfo.weight) +(5 * bodyInfo.height) - (6.76 * age) }"/>
					<div id="bmr">
						<p>성별 : 남성</p>
						<p>나이 : ${age }세</p>
						<input type="hidden" id="bmrvalue" value="${bmr }">
						<span>기초대사량 : <fmt:formatNumber value="${bmr }"/>칼로리</span>
					</div>
				</c:if>
				
				<!-- female일 경우 기초대사량 -->
				<c:if test="${user.userGender eq 'female'}">
						<c:set var="bmr" value="${665.1 +(9.56 * bodyInfo.weight) +(1.85 * bodyInfo.height) - (4.68 * age) }"/>
					<div id="bmr">
						<p>성별 : 여성</p>
						<p>나이 : ${age }세</p>
						<input type="hidden" id="bmrvalue" value="${bmr }">
						<span>기초대사량 : <fmt:formatNumber value="${bmr }"/>칼로리</span>
					</div>
				</c:if>
			</c:if>
		</div>
		
		<div class="small-container2">
			<div class="cal">
				<p>칼로리 검색</p>
				<div class="input-box">
					<p><input type="text" id="foodname" name="foodname" placeholder="음식명을 입력해주세요."><button id="search"><img src="/resources/img/dgsearch.png"></button></p>
				</div>		
				<div id="result"></div>
			</div> 
			
			<div class="food">
				<p>오늘 얼마나 드셨어요 ?</p>
				<div class="input-box">
					<p><input type="text" id="kcal" placeholder="섭취한 칼로리를 입력해주세요."><button id="save"><img src="/resources/img/dgsearch.png"></button></p>
				</div>	
				<div id="resultkcal"></div>
			</div>
			<div class="calc">
				<p>계산기</p>
				<input type="text"><button>버튼</button>
			</div>
		</div><!-- small-container2 END -->
	</div><!-- medium-container END -->
</div><!-- big-container END -->
</body>
</html>