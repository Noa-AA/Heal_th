<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

    <div class="container">
        <div class="page-header">
            <h1>게시글 목록</h1>
        </div>
        <div class="pull-right" style="width:100px;margin:10px 0;">
            <a href="/board" class="btn btn-primary btn-block">등록</a>
        </div>
        <br/><br/><br/>

        <div id="mainHide">
            <table class="table table-striped table-hover table-condensed">
                <thead>
                <tr>
                	<th style="width: 10%;">글번호</th>
					<th style="width: 45%;">제목</th>
					<th style="width: 20%;">작성자</th>
					<th style="width: 10%;">조회수</th>
					<th style="width: 15%;">작성일</th>
                </tr>
                </thead>
              
                <tbody>
                <c:forEach items="${list }" var="board">
                
                <tr>
                    <td th:text="${board.idx}"></td>
                    <td th:text="${board.boardType.value}"></td>
                    <td><a th:href="'/board?idx='+${board.idx}" th:text="${board.title}"></a></td>
                    <td th:text="${board.createdDate} ?
                    ${#temporals.format(board.createdDate,'yyyy-MM-dd HH:mm')} : ${board.createdDate}"></td>
                    <td th:text="${board.updatedDate} ?
                    ${#temporals.format(board.updatedDate,'yyyy-MM-dd HH:mm')} : ${board.updatedDate}"></td>
                </tr>
                </c:forEach>
                </tbody>
            
            </table>
        </div>
    </div>
    <br/>
    
    <nav aria-label="Page navigation" style="text-align:center;">
        <ul class="pagination" th:with="startNumber=${T(Math).floor(boardList.number/10)}*10+1, 
endNumber=(${boardList.totalPages} > ${startNumber}+9) ? ${startNumber}+9 : ${boardList.totalPages}">
            <li><a aria-label="Previous" href="/board/list?page=1">&laquo;</a></li>
            <li th:style="${boardList.first} ? 'display:none'">
                <a th:href="@{/board/list(page=${boardList.number})}">&lsaquo;</a>
            </li>

            <li th:each="page :${#numbers.sequence(startNumber, endNumber)}" th:class="(${page} == ${boardList.number}+1) ? 'active'">
                <a th:href="@{/board/list(page=${page})}" th:text="${page}"><span class="sr-only"></span></a>
            </li>

            <li th:style="${boardList.last} ? 'display:none'">
                <a th:href="@{/board/list(page=${boardList.number}+2)}">&rsaquo;</a>
            </li>
            <li><a aria-label="Next" th:href="@{/board/list(page=${boardList.totalPages})}">&raquo;</a></li>
        </ul>
    </nav>


</body>
</html>