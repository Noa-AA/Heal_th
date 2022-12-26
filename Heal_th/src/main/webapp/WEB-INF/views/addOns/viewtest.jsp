<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<body>

<h1>게시글 뷰</h1>
<hr>
내용내용
<hr>

<jsp:include page="../file/upload.jsp" /> <!-- 작성페이지 파일업로드 자리에 넣기 -->
<jsp:include page="../file/file.jsp" /> <!-- 뷰페이지 사진목록 자리에 넣기 -->
<jsp:include page="../addOns/addOn.jsp" />
<jsp:include page="../comment/board.jsp" />

</body>
</html>