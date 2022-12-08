<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../layout/header.jsp" %>
<link rel="icon" href="<c:url value='/resources/favicon.ico'/>" type="image/x-icon"/>
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

ul {
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
	border-radius: 10px;
	box-shadow: 1px 1px 10px 0px rgb(0 0 0 / 15%);
	text-align: center;
	border: none;
	background-color: aliceblue;
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

#delete {
	border: none;
	box-shadow: 1px 1px 10px 0px rgb(0 0 0 / 15%);
	background-color: #f0ebff;
}

#delete, #recordDate, #recordNo {
	margin: 10px;
}

.content-0:nth-child(odd) {
    display: flex;
    flex-direction: column;
    width: 550px;
    margin-bottom: -335px;
    position: relative;
    left: 25px;
} 

.content-0:nth-child(even) {
    display: flex;
    flex-direction: column;
    width: 550px;
    position: relative;
    left: 625px;
}

.content-3 {
	display: flex;
	justify-content: right;
}

button {
	width: 150px;
}

.write-container {
	display: flex;
	justify-content: center;
}
body {
	padding-top: 355px;
}
</style> 
<body>
<div id="subvisual">
	<div id="subvisual-A">
		<p id="subv-title">운동 일기장</p>
		<p id="subv-content">나의 오늘 운동기록을 매일매일 기록해 봐요</p>
	</div>
</div>
<div class="big-container">
<!-- <!-- 퀵메뉴 시작 --> 
<!-- <div class="Quick"> -->
<!--     <table class="quickMenuBar"> -->
<!--         <tr> -->
<!--             <td colspan="2" style="cursor:pointer;"><a href="/map/find">주변 시설 찾기</a></td> -->
<!--         </tr> -->
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
<!-- <!-- 퀵메뉴 끝 --> 
	<div id="recordlist">
	<span id="healthcount">나의 일기 작성 횟수 [ ${paging.totalCount } 회 ]</span><br>
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
	
	<div class="text-center">
		<ul class="pagination pagination-sm">
	
		<%-- 첫 페이지로 이동 --%>
		<c:if test="${paging.curPage ne 1 }">
			<li><a href="/dghelper/healthrecord">&larr; 처음</a></li>	
		</c:if>
		
		<%-- 이전 페이징 리스트로 이동 --%>
		<c:choose>
		<c:when test="${paging.startPage ne 1 }">
			<li><a href="/dghelper/healthrecord?curPage=${paging.startPage - paging.pageCount }">&laquo;</a></li>
		</c:when>
		<c:when test="${paging.startPage eq 1 }">
			<li class="disabled"><a>&laquo;</a></li>
		</c:when>
		</c:choose>
		
		<%-- 이전 페이지로 가기 --%>
		<c:if test="${paging.curPage > 1 }">
			<li><a href="/dghelper/healthrecord?curPage=${paging.curPage - 1 }">&lt;</a></li>
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
			<li><a href="/dghelper/healthrecord?curPage=${paging.curPage + 1 }">&gt;</a></li>
		</c:if>
		
		<%-- 다음 페이징 리스트로 이동 --%>
		<c:choose>
		<c:when test="${paging.endPage ne paging.totalPage }">
			<li><a href="/dghelper/healthrecord?curPage=${paging.startPage + paging.pageCount }">&raquo;</a></li>
		</c:when>
		<c:when test="${paging.endPage eq paging.totalPage }">
			<li class="disabled"><a>&raquo;</a></li>
		</c:when>
		</c:choose>
	
		<%-- 끝 페이지로 이동 --%>
		<c:if test="${paging.curPage ne paging.totalPage }">
			<li><a href="/dghelper/healthrecord?curPage=${paging.totalPage }">끝 &rarr;</a></li>	
		</c:if>
		
		</ul>
	</div>
</div>

</body>
</html>