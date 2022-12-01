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
		console.log("#search click")	
		$("#result").html("- L O A D I N G -")
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

	$("#save").click(function(){		
		console.log("#save click")	
		
		if(!$.isNumeric($("#kcal").val())){
			alert("숫자만 입력해주세요 !")
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
	width: 800px;
	margin: 0 auto;
}
.small-container {
	position: relative;
	height: 100px;
	border: 1px solid silver;
}
.small-container2 {
	position: relative;
	border: 1px solid silver;
}

.cal, .food {
	margin: 5px;
	text-align: center;
	border: 1px solid silver;
}

input {
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
	<div class="small-container">     
		<span>운동 가이드</span>
	
		<!-- male일 경우 기초대사량 -->
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
	</div>
	
	<div class="small-container2">
		<div class=cal>
			<p>칼로리 검색</p>
			<p><input type="text" id="foodname" name="foodname" placeholder="음식명을 입력해주세요."></p>
			<button id="search">검색</button>
			<div id="result"></div>
		</div> 
		
		<div class=food>
			<p>오늘 얼마나 드셨어요 ?</p>
			<p><input type="text" id="kcal" placeholder="섭취한 칼로리를 입력해주세요."></p>	
			<button id="save">저장</button>
			<div id="resultkcal"></div>
		</div>
	</div>
</div>
</body>
</html>