<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<jsp:include page="../layout/header.jsp" />

<style type="text/css">
.star_rating {font-size:0; letter-spacing:-4px;}

.star_rating a {
    font-size:22px;
    letter-spacing:0;
    display:inline-block;
    margin-left:5px;
    color:#ccc;
    text-decoration:none;
}
.star_rating a:first-child {margin-left:0;}
.star_rating a.on {color:#F8AF0D;}

</style>

<script type="text/javascript">
$( document ).ready(function() {
	$( ".star_rating a" ).click(function() {
	     $(this).parent().children("a").removeClass("on");
	     $(this).addClass("on").prevAll("a").addClass("on");
	     return false;
	});

});

</script>

</head>
<body>

<p class="star_rating">
    <a href="#" class="on">★</a>
    <a href="#" >★</a>
    <a href="#" >★</a>
    <a href="#">★</a>
    <a href="#">★</a>
</p>

</body>
</html>