<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
