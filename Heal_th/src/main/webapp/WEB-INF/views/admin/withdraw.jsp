<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../layout/adminheader.jsp" %>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css">
<script type="text/javascript">
function showValue(target){
	const selectValue = target.value;
	console.log(selectValue);
	listOrderBy(selectValue);
}

function listOrderBy(selectValue){

	$.ajax({
		type: "get",
		url: "/admin/withdrawOrder",
		data: {
			selectOption: selectValue
		},
		dataType: "html",
		success: (res)=>{
			console.log("AJAX 성공")
			$("#orderResult").html(res);
		},
		error: ()=>{
			console.log("AJAX 실패")
		}
	})
	
}

function withDrawOk(wdNo,wdAmount,userNo){
	console.log(wdNo); 
	console.log(wdAmount);
	console.log(userNo);
	if(confirm("승인처리 하시겠습니까?")){
	$.ajax({
		type: "post",
		url: "/admin/withdrawProc",
		data: {
			wdNo: wdNo,
			wdAmount: wdAmount,
			userNo: userNo
		},
		dataType: "html",
		success: (res)=>{
			console.log("AJAX 성공")
				$.ajax({
					type: "post"
					, url: "/message/insert"
					, data: {
						userNo: ${sessionScope.userNo},
						messageCon: "회원님의 환불계좌로 인출신청하신 금액이 입금되었습니다."
					}
					, dataType: "json"
					, success: function(res){
						console.log("AJAX 성공")
						location.reload();
						}
					, error: function(){
						console.log("AJAX 실패")
						location.reload();
					}
				})
		},
		error: ()=>{
			console.log("AJAX 실패")
		}
	})
	}
}

</script>
<style type="text/css">
th, td {
	border: 1px solid silver;
	padding: 10px;
	text-align: center;
}

td {
	height: 45px;
}

button {
	padding: 0 20px;
}

select {
	margin-bottom: 20px;
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
	<div class="medium-container">
		<h3>인출신청내역 조회</h3><br>
		<select name="orderBy" id="orderBy" onchange="showValue(this)">
			<option value="orderByNew">최신순</option>
			<option value="orderByProc">미처리</option>
		</select>
		<div id="orderResult">
		<table>
			<tr>
				<th width="10%">인출신청 번호</th>
				<th width="20%">인출신청 날짜</th>
				<th width="10%">인출신청 금액</th>
				<th width="10%">예금주</th>
				<th width="10%">은행명</th>
				<th width="10%">계좌번호</th>
				<th width="10%">회원번호</th>
				<th width="10%">처리상태</th>
				<th width="10%">승인</th>
			</tr>
			<c:forEach items="${withDraw }" var="w">
			<tr>
				<td>${w.wdNo }</td>
				<td>${w.wdDate }</td>
				<td>${w.wdAmount }원</td>
				<td>${w.wdUsername }</td>
				<td>${w.bankName }</td>
				<td>${w.wdAccount }</td>
				<td>${w.userNo }</td>
				<td>${w.wdProcess }</td>
				<td>
				<c:if test="${w.wdProcess eq '미처리'}">
<%-- 				<form action="/admin/withdrawProc?wdNo=${w.wdNo }&wdAmount=${w.wdAmount }&userNo=${w.userNo }" method="post">
						<button id="confrimButton" onclick="return confirm('정말 처리완료되었습니까?')">승인</button>
				</form> --%>
					<button id="confrimButton" type="button" onclick="withDrawOk(${w.wdNo}, ${w.wdAmount }, ${w.userNo })">승인</button>
				</c:if>
				</td>
			</tr>
			</c:forEach>
		</table>
	<!-- 페이징 부분 -->
	<div class="text-center">
		<ul class="pagination pagination-sm">
	
		<%-- 첫 페이지로 이동 (이동할게 없을때) --%>
		<c:if test="${paging.curPage eq 1 }">
			<li><a class="none"><span class="material-symbols-outlined">keyboard_double_arrow_left</span></a></li>	
		</c:if>
	
		<%-- 첫 페이지로 이동 --%>
		<c:if test="${paging.curPage ne 1 }">
			<li><a href="/admin/withdraw"><span class="material-symbols-outlined">keyboard_double_arrow_left</span></a></li>	
		</c:if>
		
		
		<%-- 이전 페이지로 가기 --%>
		<c:if test="${paging.curPage > 1 }">
			<li><a href="/admin/withdraw?curPage=${paging.curPage - 1 }"><span class="material-symbols-outlined">navigate_before</span></a></li>
		</c:if>
		
		<%-- 이전 페이지로 가기 (이전으로 갈 페이지 없을때)--%>
		<c:if test="${paging.curPage <= 1 }">
			<li><a class="none"><span class="material-symbols-outlined">navigate_before</span></a></li>
		</c:if>
		
			
		<%-- 페이징 리스트 --%>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="i">
		<c:if test="${paging.curPage eq i }">
			<li class="active"><a href="/admin/withdraw?curPage=${i }">${i }</a></li>
		</c:if>
		<c:if test="${paging.curPage ne i }">
			<li><a href="/admin/withdraw?curPage=${i }">${i }</a></li>
		</c:if>
		</c:forEach>
	
		
		
		<%-- 다음 페이지로 가기 --%>
		<c:if test="${paging.curPage < paging.totalPage }">
			<li><a href="/admin/withdraw?curPage=${paging.curPage + 1 }"><span class="material-symbols-outlined">navigate_next</span></a></li>
		</c:if>
		
		<%-- 다음 페이지로 가기 (다음으로 갈 페이지 없을때) --%>
		<c:if test="${paging.curPage >= paging.totalPage }">
			<li><a class="none"><span class="material-symbols-outlined">navigate_next</span></a></li>
		</c:if>
		
	
		<%-- 끝 페이지로 이동 --%>
		<c:if test="${paging.curPage ne paging.totalPage }">
			<li><a href="/admin/withdraw?curPage=${paging.totalPage }" ><span class="material-symbols-outlined">keyboard_double_arrow_right</span></a></li>	
		</c:if>
		
		<%-- 끝 페이지로 이동 (끝으로갈게 없을때) --%>
        <c:if test="${paging.curPage eq paging.totalPage }">
            <li><a class="none"><span class="material-symbols-outlined">keyboard_double_arrow_right</span></a></li>
        </c:if>
		</ul>
	</div>
	</div>
</div>
</body>
</html>