<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<span>운동 가이드</span>

<c:set var="bmr" value="${66.47 +(13.75 * bodyInfo.weight) +(5 * bodyInfo.height) - (6.76 * 30) }" />
<span>나의 기초대사량 : <c:out value="${bmr }"/>칼로리</span>

<p>오늘 먹은 음식을 입력하세요 !</p>

<p><input type="text"></p>

<button>칼로리 조회</button>
<!-- http://openapi.foodsafetykorea.go.kr/api/인증키/서비스명/요청파일타입/요청시작위치/요청종료위치/변수명=값&변수명=값2 -->
<p>섭취한 칼로리 : x</p>
<p>소모해야할 칼로리 : x</p>
</body>
</html>