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
		<form action="/admin/withdrawProc?wdNo=${w.wdNo }&wdAmount=${w.wdAmount }&userNo=${w.userNo }" method="post">
				<button onclick="return confirm('정말 처리완료되었습니까?')">승인</button>
		</form>
		</c:if>
		</td>
	</tr>
	</c:forEach>
</table>

	<div class="text-center">
	<ul class="pagination pagination-sm">

	<%-- 첫 페이지로 이동 --%>
	<c:if test="${paging.curPage ne 1 }">
		<li><a href="/admin/withdraw">&larr; 처음</a></li>	
	</c:if>
	
	<%-- 이전 페이징 리스트로 이동 --%>
	<c:choose>
	<c:when test="${paging.startPage ne 1 }">
		<li><a href="/admin/withdraw?curPage=${paging.startPage - paging.pageCount }">&laquo;</a></li>
	</c:when>
	<c:when test="${paging.startPage eq 1 }">
		<li class="disabled"><a>&laquo;</a></li>
	</c:when>
	</c:choose>
	
	<%-- 이전 페이지로 가기 --%>
	<c:if test="${paging.curPage > 1 }">
		<li><a href="/admin/withdraw?curPage=${paging.curPage - 1 }">&lt;</a></li>
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
		<li><a href="/admin/withdraw?curPage=${paging.curPage + 1 }">&gt;</a></li>
	</c:if>
	
	<%-- 다음 페이징 리스트로 이동 --%>
	<c:choose>
	<c:when test="${paging.endPage ne paging.totalPage }">
		<li><a href="/admin/withdraw?curPage=${paging.startPage + paging.pageCount }">&raquo;</a></li>
	</c:when>
	<c:when test="${paging.endPage eq paging.totalPage }">
		<li class="disabled"><a>&raquo;</a></li>
	</c:when>
	</c:choose>

	<%-- 끝 페이지로 이동 --%>
	<c:if test="${paging.curPage ne paging.totalPage }">
		<li><a href="/admin/withdraw?curPage=${paging.totalPage }">끝 &rarr;</a></li>	
	</c:if>
	
	</ul>
</div>
