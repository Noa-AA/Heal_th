<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${msg eq '<MSG>정상처리되었습니다.</MSG>'}">
	<p>1회 제공량 : ${serving }g</p>
	<p>칼로리 : ${cal }kcal</p>
	<p>검색된 음식 : ${food }</p>
	<p>${food }의 ${serving }g당 칼로리는 ${cal }kcal 입니다.</p>
</c:if>
<c:if test="${msg eq '<MSG>해당하는 데이터가 없습니다.</MSG>'}">
	<p>검색 결과가 없습니다.</p>
</c:if>
