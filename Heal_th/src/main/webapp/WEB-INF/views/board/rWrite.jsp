<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/assets/css/star.css" rel="stylesheet"/>

<jsp:include page="../layout/header.jsp" />

<!-- 스타일 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js">
<script scr="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- <script scr="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css"></script> -->





<style type="text/css">

* {
    margin: 0;
    padding: 0;
}

html {
/*     height: 100%; */
	height: 1300px;
}

#btnCancle {
    width: 100px;
    background: #616161;
    font-size: 21px;
    font-weight: bold;
    color: white;
    border: 0 none;
    border-radius: 5px;
    cursor: pointer;
    padding: 10px 5px; 
    margin: 10px 5px;
    padding-bottom: 14px; 
	height: 52px;
	width: 100px;
	margin-right: 15px;
}

#btnWrite {
    width: 100px;
    background: #7ca3f5;
    font-size: 21px;
    font-weight: bold;
    color: white;
    border: 0 none;
    border-radius: 5px;
    cursor: pointer;
    padding: 10px 5px; 
    margin: 10px 5px;
    padding-bottom: 14px; 
	height: 52px;
	width: 100px;
}




/* star rating */
/* .star_rating {font-size:0; letter-spacing:-4px;} */

/* .star_rating a { */
/*     font-size:22px; */
/*     letter-spacing:0; */
/*     display:inline-block; */
/*     margin-left:5px; */
/*     color:#ccc; */
/*     text-decoration:none; */
/* } */
/* .star_rating a:first-child {margin-left:0;} */
/* .star_rating a.on {color:#F8AF0D;} */

#myform{
    display: inline-block;
    direction: rtl;
    border:0;
}
#myform legend{
    text-align: right;
}
#myform input[type=radio]{
    display: none;
}
#myform label{
    font-size: 3em;
    color: transparent;
    text-shadow: 0 0 0 #f0f0f0;
}
#myform label:hover{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#myform label:hover ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#myform input[type=radio]:checked ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

span{
font-size: 25px;
float: left;
margin-right: 15px;
margin-top: 3px;
}


</style>


<!-- 스마트 에디터 2 로드 -->
<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	
	$( ".star_rating a" ).click(function() {
	     $(this).parent().children("a").removeClass("on");
	     $(this).addClass("on").prevAll("a").addClass("on");
	     return false;
	});
	
	$("input[type='radio']").click(function(){
        var sim =  $("input[type='radio']:checked").val();
        //alert(sim);
        if (sim<3) {
        $('.myratings').css('color','red'); 
        $(".myratings").text(sim);
     }else{
        $('.myratings').css('color','green');
        $(".myratings").text(sim);
     }
     });

	
	$("#btnWrite").click(function() {
		$(this).parents("form").submit();
	});
	
})

function updateContents() {
	//스마트 에디터에 작성된 내용을 #content에 반영한다
	oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", [])
}
</script>

</head>
<body>

<div class="container">


<form action="/board/rWrite" method="post" enctype="multipart/form-data">
<div class="form-group">
	<h1>헬스장 리뷰</h1><br>
</div>


<div class="form-group">
	<label for="rTitle">제목</label>
	<input type="text" id="rTitle" name="rTitle" class="form-control">
</div><br><br>

<div class="form-group">
<h3>시설 소개</h3><br>
	<label for="gymName">시설명</label>
	<input type="text" id="gymName" name="gymName" class="form-control">
</div>	
	
<div class="form-group">
	<label for="classification">분류</label>
	<input type="text" id="classification" name="classification" class="form-control">
</div>	

<div class="form-group">
	<label for="gymIntroduce">간단 소개</label>
	<input type="text" id="gymIntroduce" name="gymIntroduce" class="form-control">
</div>	

<div class="form-group">
	<label for="price">가격</label>
	<input type="text" id="price" name="price" class="form-control">
</div>	


<br><br><hr><br><br>



<div class="form-group">
	<h3>위치</h3>
	<label for="address">시설 위치</label>
	<input type="text" id="address" name="address" class="form-control">
</div>




<br><br><hr><br><br>


<!-- <div id="map" style="width:100%;height:350px;"></div> -->

<!-- <input type="text" id="address" name="address" class="form-control"> -->
<!-- <button id="search">찾기</button> -->

<div class="form-group">
	<h3>후기</h3><br>


	<fieldset name="myform" id="myform">
		<span class="myratings" style="color: #ccc;">5.0</span>
		<input type="radio" name="score" value="5.0" id="rate1"><label for="rate1">★</label>
		<input type="radio" name="score" value="4.0" id="rate2"><label for="rate2">★</label>
		<input type="radio" name="score" value="3.0" id="rate3"><label for="rate3">★</label>
		<input type="radio" name="score" value="2.0" id="rate4"><label for="rate4">★</label>
		<input type="radio" name="score" value="1.0" id="rate5"><label for="rate5">★</label>
		</fieldset>
	
	

</div>



	
<div class="form-group">
	<label for=review">후기글 작성</label>
	<textarea rows="10" style="width: 100%;" id="review" name="review" placeholder="이용하신 시설의 장단점을 작성해주세요"></textarea>
</div>

<br><br>

<div class="text-center">
	
		<a class="btn block" id="btnCancle" onclick="if ( confirm('정말 취소하시겠습니까?') == false ) { return false; }" href="/board/reviewBoard" >취소</a>
	<button type="submit" class="btn btn-primary" id="btnWrite">등록</button>
</div>
</form>

<!-- 스마트 에디터 스킨 적용 -->
<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "content",
	sSkinURI: "/resources/se2/SmartEditor2Skin.html",
	fCreator: "createSEditor2"
})
</script>

</div><!-- .container end -->






<!-- MultiStep Form -->
<!-- <div class="container-fluid" id="grad1"> -->
<!--     <div class="row justify-content-center mt-0"> -->
<!--         <div class="col-11 col-sm-9 col-md-7 col-lg-6 text-center p-0 mt-3 mb-2"> -->
<!--             <div class="card px-0 pt-4 pb-0 mt-3 mb-3"> -->
<!--                 <h1><strong>Before & After 게시글</strong></h1><br> -->
<!--                 <p>게시글을 작성해주세요</p> -->
<!--                 <div class="row"> -->
<!--                     <div class="col-md-12 mx-0"> -->
                    
<!--                         <form id="msform" method="post" action="/board/bf_write"> -->
                        
                        
<!--                             fieldsets -->
<!--             <fieldset> -->
<!-- 	            <div class="form-card"> -->
<!-- 	             <h2 style="color: black;">Before</h2><br><br> -->
<!-- 	             	<label for="bfTitle">제목</label> -->
<!-- 						<input type="text" id="bfTitle" name="bfTitle" placeholder="제목을 입력해주세요"> -->
<!-- 	                 <br><br> -->
	                        
<!-- 				<h3 style="color: black;">운동 전 정보</h3><br><br> -->
<!-- 					<label for=	"height">신장</label> -->
<!-- 						<input type="text" id="height" name="height" placeholder="160cm"> -->
<!-- 	                <br> -->
<!-- 	                 <label for="gender">성별</label> -->
<!-- 						<input type="text" id="gender" name="gender" placeholder="여성/남성"> -->
<!-- 	                 <br> -->
<!-- 	                 <label for="weight">몸무게</label> -->
<!-- 						<input type="text" id="weight" name="weight" placeholder="50kg"> -->
<!-- 	                  <br> -->
<!-- 	                  <label for="bfExercise">운동종류</label> -->
<!-- 	                    <input type="text" id="bfExercise" name="bfExercise" placeholder="현재 하고 있는 운동종류를 입력해주세요"> -->
<!-- 	                  <br> -->
<!-- 	                     <button>첨부파일</button> -->
<!-- 				</div> -->
<!--                                 <input type="button" name="next" class="next action-button" value="다음"/> -->
<!--                             </fieldset> -->
                            
<!--                             <fieldset> -->
<!--                                <div class="form-card"> -->
<!-- 			<h3 style="color: black">설정 목표</h3> -->
<!-- 			<br><br>  -->
<!-- 				<label for="gWeight">목표 체중</label> -->
<!-- 					<input type="text" id="gWeight" name="gWeight" placeholder="목표 체중을 입력해주세요"> -->
<!-- 				<br> -->
<!-- 				<label for="date">목표 기간</label> -->
<!-- 					<input type="text" id="sDate" name="sDate" placeholder="시작일: YYYY-MM-DD"> ~  -->
<!--                     <input type="text" id="eDate" name="eDate" placeholder="목표일: YYYY-MM-DD"> -->
<!--                 <br> -->
<!--                 <label for="seleExercise">선택 운동</label> -->
<!-- 					<input type="text" id="seleExercise" name="seleExercise" placeholder="선택한 운동을 입력해주세요"> -->
<!--                             <br> -->

<!-- 			<h4 style="color: black">다짐글</h4><br><br> -->
<!-- 				<textarea rows="20" cols="50" id="beforeCon" name="beforeCon" placeholder="다짐글을 작성해주세요"></textarea> -->
				
<!-- 			</div>                             -->
				
                                
                                
<!--                                 <input type="button" name="previous" class="previous action-button-previous" value="이전"/> -->
<!--                                 <input type="button" name="next" class="next action-button" value="다음"/> -->
<!--                             </fieldset> -->
                            
                            
<!--                             <fieldset> -->
<!--                                 <div class="form-card"> -->
<!--                                 <h2 style="color: black">After</h2> <br><br> -->
<!--                                   <h4 style="color: black;">운동 후 현재 정보</h4><br><br> -->
<!-- 	        	<label for="cWeight">몸무게</label> -->
<!-- 	            	<input type="text" id="cWeight" name="cWeight" placeholder="운동 후 몸무게를 입력해주세요"> -->
<!-- 				<br><br> -->
<!-- 	             <label>첨부파일</label> -->
<!-- 					<button>첨부파일</button> -->
<!-- 				<br><br> -->
<!-- 	            <label for="gResult">결과</label> -->
<!-- 					<select id="gResult" name="gResult"> -->
<!-- 						<option value="매우 성공" selected="selected">매우 성공</option> -->
<!-- 						<option value="약간 성공">약간 성공</option> -->
<!-- 						<option value="변화 없음">변화 없음</option> -->
<!-- 						<option value="약간 실패">약간 실패</option> -->
<!-- 						<option value="매우 실패">매우 실패</option> -->
<!-- 					</select> -->
<!-- 				<br><br><br> -->
	                            
<!-- 				<h3>후기글</h3><br><br> -->
<!-- 					<textarea rows="20" cols="50" id="afterCon" name="afterCon" placeholder="후기글을 작성해주세요"></textarea> -->
				
                                 
<!--                                  </div> -->
<!--                                 <input type="button" name="previous" class="previous action-button-previous" value="이전"/> -->
<!--                                 <input type="button" name="next" class="next action-button" value="다음"/> -->
<!--                             </fieldset> -->
                            
<!--                             <fieldset> -->
<!--                                 <div class="form-card"> -->
<!--                                 <br><br><br><br> -->
<!--                                     <h2 style="text-align: center;">게시글을 등록하시겠습니까?</h2> -->
<!--                                     <br><br><br><br> -->
                                    
                                    
                                    
<!--                                     <button id="btnCancle"> -->
<!-- 								        <a class="btn block" onclick="if ( confirm('정말 취소하시겠습니까?') == false ) { return false; }" href="/board/bfBoard" style="text-decoration: none; color: white; font-size: 14px; font-weight: bold; ">취소</a> -->
<!-- 								     </button> -->
                                    
<!--                                     <button type="submit" id="btnInsert" name="btnInsert" style="color: white; font-size: 14px;">등록</button> -->
                                    
<!--                                 </div> -->
<!--                             </fieldset> -->
                        
<!--                         </form> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
<!--     </div> -->
<!-- </div> -->

</body>
</html>