<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../layout/header.jsp" %>

<style type="text/css">
#subvisual {
    position: relative;
    top: -100px;
    width: 100%;
    height: 275px;
    background: linear-gradient(#fbf5fd 0 , #eaecfb);
    text-align: center;
}

#subvisual-A {
    height: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
}

#subvisual #subv-title {
    font-family: 'SUIT';
    font-size: 40px;
    font-weight: 700;
}

#subvisual #subv-content {
    font-family: 'SUIT';
	font-size: 15px;
	color: #888888;
}
</style>
<body> 
<div id="subvisual">
	<div id="subvisual-A">
		<p id="subv-title">운동성향 테스트</p>
		<p id="subv-content">운동성향테스트 어쩌구저쩌구</p>
	</div>
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
	</div>



</body>
</html>