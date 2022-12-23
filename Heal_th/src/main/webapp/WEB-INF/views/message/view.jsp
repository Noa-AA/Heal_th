<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table>
	<c:forEach items="${messageList }" var="msg">
		<tr>
			<th>${msg.messageDate }</th>
		</tr>
		<tr>
			<td>${msg.messageCon }</td>
		</tr>
	</c:forEach>
</table>
