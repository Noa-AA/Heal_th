<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../layout/header.jsp" %>
<link rel="icon" href="<c:url value='/resources/favicon.ico'/>" type="image/x-icon"/>

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css">
<script type="text/javascript">
$(document).ready(function(){
// 	$(window).scroll(function(){  //스크롤이 움직일때마다 이벤트 발생
// 	      var position = $(window).scrollTop()+200; // 현재 스크롤바의 위치값을 반환
// 	      $(".Quick").stop().animate({top:position+"px"}, 400); //해당 오브젝트 위치값 재설정
// 	});
	
	$("#save").click(function(){
		console.log("#save click")
		
		var str = $("#recordCon").val().replaceAll(/\n/g, "<br>").replaceAll(" ","&nbsp")
		
		
		if(str.length>=5){
			$.ajax({
				type: "post"
				, url: "/dghelper/healthrecord"
				, data: {
					recordCon: str
				}
				, dataType: "json"
				, success: function(res){
					console.log("AJAX 성공")
					
					console.log(res)
					$.ajax({
						type: "get"
						, url: "/dghelper/healthrecord"
						, data: {}
						, dataType: "html"
						, success: function(res){
							console.log("AJAX 성공")
							$("#recordCon").val('')
							
							$("#recordlist").html(res)
							location.reload();
 						}
						, error: function(){
							console.log("AJAX 실패")
						}
					})
					$("#recordlist").html(res)
				}
				, error: function(){
					console.log("AJAX 실패")
				}
			})
		} else {
			alert("최소 5자 이상 입력해주세요")	
		}
	})
	
	if(${paging.totalCount}<3){
		$("#recordlist").css("min-height","430.7px");
	} else {
		$("#recordlist").css("min-height","750.7px");
	}
	

});

/* function submit(i){

	console.log(this.parentElement)
} */
</script>
<style type="text/css">

/* .Quick {
	position: absolute;
	top: 200px;
	left: 150px;
	width: 200px;
	height: 300px;
	padding: 20px;
	background: linear-gradient(120deg, #3f94d6 0 , #1869a7);
	box-shadow: 1px 1px 10px 0px rgb(0 0 0 / 30%);
}   */

/* @media screen and (max-width: 1640px) {
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
} */

.big-container {
	width: 1200px;
	margin: 0 auto;
}

#id, #save {
	float:right;
}

textarea {
	width: 100%;
	height: 200px;
	padding: 10px;
	resize: none;
	margin: 20px 0 20px 0;
}

.textcenter ul {
	list-style:none;
}

.record {
	width: 800px;
	height: 200px;
	margin: 0 auto;
	text-align: center;
	border: 1px solid silver;
}

#recordDate {
	float: left;
}
 
#recordlist {
	display: flex;
	width: 1200px;
	min-height: 750.7px;
    flex-direction: column;
}
#healthcount {
	display: flex;
	justify-content: right;
	margin-right: 25px;
	font-size: 25px;
}
#content {
	min-height: 250px;
	width: 550px; 
	padding: 20px;
	border-radius: 8px;
	box-shadow: 1px 1px 10px 0px rgb(0 0 0 / 15%);
	text-align: center;
}

#recordNo {
	float: left;
}

#recordDate {
	float: right;
}

#recordCon {
	width: 800px;
	box-shadow: 1px 1px 10px 0px rgb(0 0 0 / 15%);
	border: none;
	padding: 20px;
}

#delete, #save {
	border: none;
	box-shadow: 1px 1px 10px 0px rgb(0 0 0 / 15%);
	background-color: #7ca3f5;
	height: 40px;
	border-radius: 8px;
}

#delete, #recordDate, #recordNo {
	margin: 10px;
}

.content-0:nth-child(odd) {
    display: flex;
    flex-direction: column;
    width: 550px;
    position: relative;
    left: 625px;
} 

.content-0:nth-child(even) {
    display: flex;
    flex-direction: column;
    width: 550px;
    margin-bottom: -350px;
    position: relative;
    left: 25px;
}

.contentempty {
	margin: 0 auto;
}

.content-3 {
	display: flex;
	justify-content: right;
}

.big-container button {
	width: 150px;
}

.write-container {
	display: flex;
	justify-content: center;
}

body {
	padding-top: 355px;
}

.medium-container {
	width: 1200px;
	min-height: 800px;
    box-shadow: 1px 0px 10px 0px rgb(0 0 0 / 30%);
}

#twoDepth-list a:nth-child(2){
	color: #b571e9;
	border-bottom: 2px solid #b571e9;
	margin-top: 1px;
	font-weight: 700;
}


/* 페이징 부분 */

.text-center {
	display: flex;
	justify-content: center; 
	margin-top: 50px;
}

.pagination {
	display: flex;
	margin: 0;
}

.pagination > li{
	display: flex;
}

.pagination > li > a {
	display: flex;
	margin: 0 4px;
	width: 40px;
	height: 40px;
	border-radius: 20px !important;
	font-size: 16px;
	justify-content: center;
	align-items: center;
	color: #7ca3f5;
}

.none:hover {
	cursor: default;
}

.pagination>.active>a, .pagination>.active>a:focus, .pagination>.active>a:hover, .pagination>.active>span, .pagination>.active>span:focus, .pagination>.active>span:hover {
	background-color: #7ca3f5;
    border-color: #7ca3f5;
}


.material-symbols-outlined {
	font-variation-settings:
	'FILL' 0,
	'wght' 400,
	'GRAD' 0,
	'opsz' 48
}

 
</style> 
<body>
<div id="subvisual">
	<div id="subvisual-A">
		<p id="subv-title">운동 도우미</p>
<!-- 		<p id="subv-content">나의 오늘 운동기록을 매일매일 기록해 봐요</p> -->
	</div>
</div>
<div id="twoDepth">
	<div id="twoDepth-list">
		<a href="/map/find">운동 시설 추천</a>
		<a href="/dghelper/healthrecord">운동 일기장</a>
		<a href="/dghelper/healthtest">운동 성향 테스트</a>
		<a href="/dghelper/healthguide">칼로리 사전</a>
		<a href="/dghelper/dgmagotchi">득근이 키우기</a>
	</div>
</div>
<div class="big-container">
<h3 style="margin: 0 auto; width: 1200px; text-align: center;">운동 일기장</h3>
	<div id="recordlist">
	<div class="small-container">
		<span id="healthcount">나의 일기 작성 횟수 [ ${paging.totalCount } 회 ]</span><br>
	</div>
	<c:if test="${empty list }">
		<div class="contentempty">
			<div id="content">작성한 일기내용이 없습니다.</div>
		</div>
	</c:if>
		<c:forEach items="${list }" var="i">
		
		<div class="content-0">
			<div class="content-1">
				<span id="recordNo">${i.recordNo }번째 이야기</span>
				<span id="recordDate">작성일 ${i.recordDate}</span>
			</div>
			
			<div class="content-2">
				<div id="content">
					<span>${i.recordCon }</span>
				</div>
			</div>
			
			<div class="content-3">
				<form action="/dghelper/deleterecord?recordNo=${i.recordNo }" method="post">
					<button id="delete" onclick="return confirm('정말로 삭제하시겠습니까?')">삭제</button>
				</form>
			</div>
		</div>
		</c:forEach>
	</div>
	<div class="write-container">
		<form action="./healthrecord" method="post">
<textarea id="recordCon" name="recordCon">
섭취한 칼로리
[  ] kcal
소모한 칼로리
[  ] kcal
오늘의 운동 일기
 - 
 - </textarea>
			<p><button id="save" type="button">운동일기 추가</button></p>
		</form>
	</div>
	
	<!-- 페이징 부분 -->
	<div class="text-center">
		<ul class="pagination pagination-sm">
	
		<%-- 첫 페이지로 이동 (이동할게 없을때) --%>
		<c:if test="${paging.curPage eq 1 }">
			<li><a class="none"><span class="material-symbols-outlined">keyboard_double_arrow_left</span></a></li>	
		</c:if>
	
		<%-- 첫 페이지로 이동 --%>
		<c:if test="${paging.curPage ne 1 }">
			<li><a href="/dghelper/healthrecord"><span class="material-symbols-outlined">keyboard_double_arrow_left</span></a></li>	
		</c:if>
		
		
		<%-- 이전 페이지로 가기 --%>
		<c:if test="${paging.curPage > 1 }">
			<li><a href="/dghelper/healthrecord?curPage=${paging.curPage - 1 }"><span class="material-symbols-outlined">navigate_before</span></a></li>
		</c:if>
		
		<%-- 이전 페이지로 가기 (이전으로 갈 페이지 없을때)--%>
		<c:if test="${paging.curPage <= 1 }">
			<li><a class="none"><span class="material-symbols-outlined">navigate_before</span></a></li>
		</c:if>
		
			
		<%-- 페이징 리스트 --%>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="i">
		<c:if test="${paging.curPage eq i }">
			<li class="active"><a href="/dghelper/healthrecord?curPage=${i }">${i }</a></li>
		</c:if>
		<c:if test="${paging.curPage ne i }">
			<li><a href="/dghelper/healthrecord?curPage=${i }">${i }</a></li>
		</c:if>
		</c:forEach>
	
		
		
		<%-- 다음 페이지로 가기 --%>
		<c:if test="${paging.curPage < paging.totalPage }">
			<li><a href="/dghelper/healthrecord?curPage=${paging.curPage + 1 }"><span class="material-symbols-outlined">navigate_next</span></a></li>
		</c:if>
		
		<%-- 다음 페이지로 가기 (다음으로 갈 페이지 없을때) --%>
		<c:if test="${paging.curPage >= paging.totalPage }">
			<li><a class="none"><span class="material-symbols-outlined">navigate_next</span></a></li>
		</c:if>
		
	
		<%-- 끝 페이지로 이동 --%>
		<c:if test="${paging.curPage ne paging.totalPage }">
			<li><a href="/dghelper/healthrecord?curPage=${paging.totalPage }" ><span class="material-symbols-outlined">keyboard_double_arrow_right</span></a></li>	
		</c:if>
		
		<%-- 끝 페이지로 이동 (끝으로갈게 없을때) --%>
        <c:if test="${paging.curPage eq paging.totalPage }">
            <li><a class="none"><span class="material-symbols-outlined">keyboard_double_arrow_right</span></a></li>
        </c:if>
		</ul>
	</div>
</div>

</body>
<%@include file="../layout/footer.jsp" %>
</html>