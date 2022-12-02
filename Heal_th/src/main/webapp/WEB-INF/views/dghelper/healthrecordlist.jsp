<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<span id="healthcount">나의 운동 횟수 : ${paging.totalCount }회</span><br>
		<c:forEach items="${list }" var="i">
		<span id="recordDate">작성일 ${i.recordDate}</span><br>
		<div id="content">
			<span>${i.recordCon }</span>
		</div>
			<br>
			<form action="/dghelper/deleterecord?recordNo=${i.recordNo }" method="post">
				<button id="delete" type="button" onclick="return confirm('정말로 삭제하시겠습니까?')">삭제</button>
			</form>
			<br>
		</c:forEach>
