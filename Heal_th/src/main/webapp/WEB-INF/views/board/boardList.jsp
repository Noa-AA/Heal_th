<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- <jsp:include page="../layout/header.jsp" /> --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<style type="text/css">

 #nav { 
   padding: 100px 50px; 
   font-family: "Quicksand", sans-serif; 
   font-size: 20px; 
   line-height: 1.3; 
 } 

ul {
  margin: 100px auto 0;
  list-style: none;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  text-align: center;
  padding: 0;     
  max-width: 600px;
}

@media screen and (min-width: 600px) {
   ul {
        flex-direction: row;
    }
}

li { 
  position: relative; 
  padding: 15px 0;
}



a {
  text-transform: uppercase;
  text-decoration: none;
  letter-spacing: 0.15em;
  display: inline-block;
  padding: 15px 20px;
  position: relative;
  color:gray;
}

a::after { 
  content: "";
  position: absolute;
  bottom: 0;
  left: 50%;
  display: block;
  background: none repeat scroll 0 0 transparent;
  height: 2px;
  width: 0;
  background: #02a8a8;
  transition: width 0.3s ease 0s, left 0.3s ease 0s;
}

a:hover::after { 
  width: 100%; 
  left: 0; 
}


</style>




</head>
<body>

<div id="nav">
	<ul>
	  <li><a href="/board/bfBoard">비포 애프터</a></li>
	  <li><a href="/board/veryfiyBoard">운동 인증</a></li>
	  <li><a href="/board/dietBoard">식단 공유</a></li>
	  <li><a href="/board/reviewBoard">후기</a></li>
	</ul>
</div>

<hr>


</body>
</html>