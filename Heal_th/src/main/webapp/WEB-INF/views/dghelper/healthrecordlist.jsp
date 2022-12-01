<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<span id="healthcount">나의 운동 횟수 : ${paging.totalCount }회</span>
	<table>
		<c:forEach items="${list }" var="i">
		<tr class="record">
			<%-- <td class="record">기록번호 : ${i.recordNo }</td> --%>
			<td class="record">내용 : ${i.recordCon }</td>
			<%-- <td class="record">날짜 : ${i.recordDate }</td> --%>
			<td class="record">
				<a href="/dghelper/deleterecord?recordNo=${i.recordNo }">
				<button id="delete" type="button">
					삭제
				</button>
				</a>
				<br>
			</td>
		</tr>
		</c:forEach>
	</table>
