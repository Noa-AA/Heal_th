<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="../layout/header.jsp" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<style type="text/css">

*{
  margin:0; padding:0;
  font-size:15px; 
  line-height:1.3;
}
ul{list-style:none;}
.tabmenu{ 
  max-width:1200px; 
  margin: 0 auto; 
  position:relative; 
}

label: hover{
	backgorund-color: #c583d6;
}

.tabmenu ul{
  position: relative;
  border-radius: 10px;
  text-align: center;
}
.tabmenu ul li{
  display:  inline-block;
  width:150px; 
  float:left;  
  text-align:center; 
  background :#f9f9f9;
  line-height:40px;
}
.tabmenu label{
  display:block;
  width:100%; 
  height:40px;
  line-height:40px;
  border-radius: 5px;
}
.tabmenu input{display:none;}

.tabCon{
  display:none; 
  width: 100%;
  height:1500px;
  text-align:left; 
  padding: 20px;
  position:absolute; 
  left:0; top:40px; 
  box-sizing: border-box; 
  border : 5px solid #f9f9f9;
}
.tabmenu input:checked ~ label{
  background:#7ca3f5;
  color: white;
  font-weight: bold;
}
.tabmenu input:checked ~ .tabCon{
  display:block;
}




</style>

<script type="text/javascript">

var param = ${paramJson};

</script>



</head>
<body>

 <div class="tabmenu out-tabmenu">
  <ul style="text-align: center;">
    <li id="tab1" class="btnCon"> 
      <input type="radio" checked name="tabmenu" id="tabmenu1">
      <label for="tabmenu1">소개</label>
      
    </li>
    <li id="tab2" class="btnCon"><input type="radio" name="tabmenu" id="tabmenu2">
      <label for="tabmenu2"><a href="/board/bfBoard">비포 애프터</a></label>
      
    </li>    
    <li id="tab3" class="btnCon"><input type="radio" name="tabmenu" id="tabmenu3">
      <label for="tabmenu3">운동 인증</label>
      
    </li>
    
     <li id="tab4" class="btnCon"><input type="radio" name="tabmenu" id="tabmenu4">
      <label for="tabmenu4">식단 공유<a href="/board/dietBoard"></a></label>
      
    </li>
    
     <li id="tab5" class="btnCon"><input type="radio" name="tabmenu" id="tabmenu5">
      <label for="tabmenu5">후기<a href="/board/reviewBoard"></a></label>
      
    </li>
    
  </ul>
</div>

	
	

</body>
</html>