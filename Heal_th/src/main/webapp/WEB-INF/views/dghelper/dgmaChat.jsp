<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style type="text/css">
#chatchat {
	display: flex;
	flex-direction: column-reverse;
}
</style>
<div id="chatchat">
<c:forEach items="${chat }" var="ch">
	<p>[ ${ch.userNick} ] ${ch.dgmachatCon }</p>
</c:forEach>
</div>