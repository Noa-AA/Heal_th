<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../layout/header.jsp" %>

<body>
<!-- 퀵메뉴 시작 -->
<div class="Quick" style="position: absolute; left: 250px; top: 300px;">
    <table class="quickMenuBar" style="">
        <tr>
            <td colspan="2" style="cursor:pointer;"><a href="/dghelper/healthrecord">운동일기장</a></td>
        </tr>
        <tr>
            <td colspan="2" style="cursor:pointer;"><a href="/dghelper/healthguide">운동가이드</a></td>
        </tr>
        <tr>
            <td colspan="2" style="cursor:pointer;"><a href="/dghelper/healthtest">운동성향 테스트</a></td>
        </tr>
        <tr>
            <td colspan="2" style="cursor:pointer;" onclick="window.scrollTo(0,0);">TOP</td>
        </tr>
    </table>
</div>
<!-- 퀵메뉴 끝 -->   
</body>
</html>