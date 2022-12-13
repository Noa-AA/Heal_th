<%@page import="java.io.IOException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">
table,tr,th,td {
	border: 1px solid #bdbdbd;
}

table {
	width: 325px;
    position: absolute;
    left: 450px;
}

th {
	padding: 10px;
}

th, td {
	width: 150px;
}

</style>
<table>
	<tr>
	<th>섭취한 칼로리</th>
	<td><fmt:formatNumber value = "${param.kcal}"/>kcal</td>
	</tr>
	<tr>
	<th>소모해야할 칼로리</th>
	<td><fmt:formatNumber value="${param.kcal - param.bmr}"/>kcal</td>
	</tr>
</table>

<c:if test="${(param.kcal - param.bmr)<0}">
</c:if>
<c:if test="${(param.kcal - param.bmr)>=0}">
	<div style="position: relative; top: 100px;">
		<a href="/dghelper/healthtest">나에게 맞는 운동 추천받기</a>
	</div>
</c:if>

