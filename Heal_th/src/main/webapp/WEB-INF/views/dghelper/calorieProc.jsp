<%@page import="java.io.IOException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<p>섭취한 칼로리 : ${param.kcal}kcal</p>
<p>소모해야할 칼로리 : <fmt:formatNumber value="${param.kcal - param.bmr}"/>kcal</p>

<c:if test="${(param.kcal - param.bmr)<0}">
	더 드셔도 됩니다 !
</c:if>
<c:if test="${(param.kcal - param.bmr)>=0}">
	<a href="/dghelper/healthtest">나에게 맞는 운동 추천받기</a>
</c:if>

