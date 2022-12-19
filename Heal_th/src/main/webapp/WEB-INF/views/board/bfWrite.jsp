<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<jsp:include page="../layout/header.jsp" />

<!-- 스타일 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js">
<script scr="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- <script scr="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css"></script> -->

<!-- 날짜 위젯 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>


<style type="text/css">

* {
    margin: 0;
    padding: 0;
}

html {
/*     height: 100%; */
	height: 1300px;
}


/*form styles*/
#msform {
    text-align: center;
    position: relative;
    margin-top: 20px;
    display: block;
}

#msform fieldset .form-card {
    background: white;
    border: 0 none;
    border-radius: 0px;
    box-shadow: 0 2px 2px 2px rgba(0, 0, 0, 0.2);
    padding: 20px 40px 30px 40px;
    box-sizing: border-box;
    width: 94%;
    margin: 0 3% 20px 3%;

    /*stacking fieldsets above each other*/
    position: relative;
}

#msform fieldset {
    background: white;
    border: 0 none;
    border-radius: 0.5rem;
    box-sizing: border-box;
    width: 750px;
    height: 800px;
    margin: 0;
    padding-bottom: 20px;

    /*stacking fieldsets above each other*/
    position: relative;
}

/*Hide all except first fieldset*/
#msform fieldset:not(:first-of-type) {
    display: none;
}

#msform fieldset .form-card {
    text-align: left;
    color: #9E9E9E;
}

#msform input, #msform textarea {
    padding: 0px 8px 4px 8px;
    border: none;
    border-bottom: 1px solid #ccc;
    border-radius: 0px;
    margin-bottom: 25px;
    margin-top: 2px;
    width: 100%;
    box-sizing: border-box;
    font-family: montserrat;
    color: #2C3E50;
    font-size: 16px;
    letter-spacing: 1px;
}

#msform input:focus, #msform textarea:focus {
    -moz-box-shadow: none !important;
    -webkit-box-shadow: none !important;
    box-shadow: none !important;
    border: none;
    font-weight: bold;
    border-bottom: 2px solid skyblue;
    outline-width: 0;
}

/*Blue Buttons*/
#msform .action-button {
    width: 100px;
    background: #7ca3f5;
    font-weight: bold;
    color: white;
    border: 0 none;
    border-radius: 0px;
    cursor: pointer;
    padding: 10px 5px;
    margin: 10px 5px;
}


/*Previous Buttons*/
#msform .action-button-previous {
     width: 100px; 
     background: #616161; 
     font-weight: bold; 
     color: white; 
     border: 0 none; 
     border-radius: 0px; 
     cursor: pointer; 
     padding: 10px 5px; 
     margin: 10px 5px; 
}

#btnCancle{
     width: 100px; 
     background: #616161; 
     font-weight: bold; 
     color: white; 
     border: 0 none; 
     border-radius: 0px; 
     cursor: pointer; 
     padding: 10px 5px; 
     margin: 10px 5px; 
     margin-left: 208px;
}



#btnInsert {
    width: 100px;
    background: #7ca3f5;
    font-weight: bold;
    color: white;
    border: 0 none;
    border-radius: 0px;
    cursor: pointer;
    padding: 10px 5px; 
    margin: 10px 5px;
    padding-bottom: 14px; 
	height: 52px;
	width: 100px;
}


/*The background card*/
.card {
    z-index: 0;
    border: none;
    border-radius: 0.5rem;
    position: relative;
}

/*FieldSet headings*/
.fs-title {
    font-size: 25px;
    color: #2C3E50;
    margin-bottom: 10px;
    font-weight: bold;
    text-align: left;
}

/*progressbar*/
#progressbar {
    margin-bottom: 30px;
     overflow: hidden; 
    color: lightgrey;
}

#progressbar .active {
    color: #000000;
}

#progressbar li {
    list-style-type: none;
    font-size: 12px;
    width: 25%;
    float: left;
    position: relative;
}

/*Icons in the ProgressBar*/
#progressbar #before:before {
/*     font-family: FontAwesome; */
    content: "\f023";
}

#progressbar #goal:before {
/*     font-family: FontAwesome; */
    content: "\f007";
}

#progressbar #after:before {
/*     font-family: FontAwesome; */
    content: "\f09d";
}

#progressbar #finish:before {
/*     font-family: FontAwesome; */
    content: "\f00c";
}

/*ProgressBar before any progress*/
#progressbar li:before {
    width: 50px;
    height: 50px;
    line-height: 45px;
    display: block;
    font-size: 18px;
    color: #ffffff; 
    background: lightgray;
    border-radius: 50%;
    margin: 0 auto 10px auto;
    padding: 2px;
}

/*ProgressBar connectors*/
#progressbar li:after {
    content: '';
    width: 100%;
    height: 2px;
    background: lightgray;
    position: absolute;
    left: 0;
    top: 25px;
    z-index: -1;
}

/*Color number of the step and the connector before it*/
#progressbar li.active:before, #progressbar li.active:after {
    background: #7ca3f5;
}




</style>


<script type="text/javascript">

$(document).ready(function(){
    
	var current_fs, next_fs, previous_fs; //fieldsets
	var opacity;

	$(".next").click(function(){
	    
	    current_fs = $(this).parent();
	    next_fs = $(this).parent().next();
	    
	    //Add Class Active
	    $("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");
	    
	    //show the next fieldset
	    next_fs.show(); 
	    //hide the current fieldset with style
	    current_fs.animate({opacity: 0}, {
	        step: function(now) {
	            // for making fielset appear animation
	            opacity = 1 - now;

	            current_fs.css({
	                'display': 'none',
	                'position': 'relative'
	            });
	            next_fs.css({'opacity': opacity});
	        }, 
	        duration: 600
	    });
	});

	$(".previous").click(function(){
	    
	    current_fs = $(this).parent();
	    previous_fs = $(this).parent().prev();
	    
	    //Remove class active
	    $("#progressbar li").eq($("fieldset").index(current_fs)).removeClass("active");
	    
	    //show the previous fieldset
	    previous_fs.show();

	    //hide the current fieldset with style
	    current_fs.animate({opacity: 0}, {
	        step: function(now) {
	            // for making fielset appear animation
	            opacity = 1 - now;

	            current_fs.css({
	                'display': 'none',
	                'position': 'relative'
	            });
	            previous_fs.css({'opacity': opacity});
	        }, 
	        duration: 600
	    });
	});

// 	$('.radio-group .radio').click(function(){
// 	    $(this).parent().find('.radio').removeClass('selected');
// 	    $(this).addClass('selected');
// 	});

// 	$(".submit").click(function(){
// 	    return false;
// 	})


	//기간 설정 - 시작일
	$( function() {
	    $( "#sDate" ).datepicker({
	    	showButtonPanel: true,
	    	closeText: '닫기',
	    	dateFormat: "yy-mm-dd"
	    });
	  } );
    
	//기간 설정 - 목표일
	$( function() {
	    $( "#eDate" ).datepicker({
	    	showButtonPanel: true,
	    	closeText: '닫기',
	    	dateFormat: "yy-mm-dd"
	    });
	  } );
	
	$("#btnInsert").click(function() {
		
		$(this).parents("form").submit();
		
// 		$.ajax({
// 			   url: "/board/bfBoard",
// 				 data: {point : point},
// 			   type: "POST"
// 		   })
// 		   .done(function(result){
// 			   const point = result.point; 
// 			   swal(point.toLocaleString() + "포인트가 적립되었습니다");
			   
// 			   const newPoint = Number($("#btnInsert").data("point") + point); 
// 			   $("#btnInsert").text(newPoint.toLocaleString());
// 			   $("#btnInsert").data("point", newPoint);
			   
// 			   $(".point_number_area").fadeToggle(100);
// 				htmlWrite(result);  		   
// 			})
// 			.fail(function(result){
// 			   if(!result.responseJSON) {
// 				   alert("에러");
// 			   } else {
// 				   swal(result.responseJSON.errorMsg);
// 			   }
// 			})

		})
		
		
		
		
		
	});
	
	    
});

</script>


</head>
<body>

<!-- MultiStep Form -->
<div class="container-fluid" id="grad1">
    <div class="row justify-content-center mt-0">
        <div class="col-11 col-sm-9 col-md-7 col-lg-6 text-center p-0 mt-3 mb-2">
            <div class="card px-0 pt-4 pb-0 mt-3 mb-3">
                <h1><strong>Before & After 게시글</strong></h1><br>
                <p>게시글을 작성해주세요</p>
                <div class="row">
                    <div class="col-md-12 mx-0">
                    
                        <form id="msform" method="post" action="/board/bfWrite">
                        
                        
                            <!-- progressbar -->
                            <ul id="progressbar">
                                <li class="active" id="before"><strong>Before</strong></li>
                                <li id="goal"><strong>Goal</strong></li>
                                <li id="after"><strong>After</strong></li>
                                <li id="finish"><strong>Finish</strong></li>
                            </ul>
                            <!-- fieldsets -->
                            
                            
                            
            <fieldset>
	            <div class="form-card">
	             <h2 style="color: black;">Before</h2><br><br>
	             	<label for="bfTitle">제목</label>
						<input type="text" id="bfTitle" name="bfTitle" placeholder="제목을 입력해주세요">
	                 <br><br>
	                        
				<h3 style="color: black;">운동 전 정보</h3><br><br>
					<label for=	"height">신장</label>
						<input type="text" id="height" name="height" placeholder="160cm">
	                <br>
	                 <label for="gender">성별</label>
						<input type="text" id="gender" name="gender" placeholder="여성/남성">
	                 <br>
	                 <label for="weight">몸무게</label>
						<input type="text" id="weight" name="weight" placeholder="50kg">
	                  <br>
	                  <label for="bfExercise">운동종류</label>
	                    <input type="text" id="bfExercise" name="bfExercise" placeholder="현재 하고 있는 운동종류를 입력해주세요">
	                  <br>
	                     <button>첨부파일</button>
				</div>
                                <input type="button" name="next" class="next action-button" onClick="javascript:window.scrollTo(0,0)"
                                 value="다음"/>
                            </fieldset>
                            
                            <fieldset>
                               <div class="form-card">
			<h3 style="color: black">설정 목표</h3>
			<br><br> 
				<label for="gWeight">목표 체중</label>
					<input type="text" id="gWeight" name="gWeight" placeholder="목표 체중을 입력해주세요">
				<br>
				<label for="date">목표 기간</label>
					<input type="text" id="sDate" name="sDate" placeholder="시작일: YYYY-MM-DD"> ~ 
                    <input type="text" id="eDate" name="eDate" placeholder="목표일: YYYY-MM-DD">
                <br>
                <label for="seleExercise">선택 운동</label>
					<input type="text" id="seleExercise" name="seleExercise" placeholder="선택한 운동을 입력해주세요">
                            <br>

			<h4 style="color: black">다짐글</h4><br><br>
				<textarea rows="20" cols="50" id="beforeCon" name="beforeCon" placeholder="다짐글을 작성해주세요"></textarea>
				
			</div>                            
				
                                
                                
                                <input type="button" name="previous" class="previous action-button-previous" onClick="javascript:window.scrollTo(0,0)"
                                 value="이전"/>
                                <input type="button" name="next" class="next action-button" onClick="javascript:window.scrollTo(0,0)"
                                 value="다음"/>
                            </fieldset>
                            
                            
                            <fieldset>
                                <div class="form-card">
                                <h2 style="color: black">After</h2> <br><br>
                                  <h4 style="color: black;">운동 후 현재 정보</h4><br><br>
	        	<label for="cWeight">몸무게</label>
	            	<input type="text" id="cWeight" name="cWeight" placeholder="운동 후 몸무게를 입력해주세요">
				<br><br>
	             <label>첨부파일</label>
					<button>첨부파일</button>
				<br><br>
	            <label for="gResult">결과</label>
					<select id="gResult" name="gResult">
						<option value="매우 성공" selected="selected">매우 성공</option>
						<option value="약간 성공">약간 성공</option>
						<option value="변화 없음">변화 없음</option>
						<option value="약간 실패">약간 실패</option>
						<option value="매우 실패">매우 실패</option>
					</select>
				<br><br><br>
	                            
				<h3>후기글</h3><br><br>
					<textarea rows="20" cols="50" id="afterCon" name="afterCon" placeholder="후기글을 작성해주세요"></textarea>
				
                                 
                                 </div>
                                <input type="button" name="previous" class="previous action-button-previous" onClick="javascript:window.scrollTo(0,0)"
                                 value="이전"/>
                                <input type="button" name="next" class="next action-button" onClick="javascript:window.scrollTo(0,0)"
                                 value="다음"/>
                            </fieldset>
                            
                            <fieldset>
                                <div class="form-card">
                                <br><br><br><br>
                                    <h2 style="text-align: center;">게시글을 등록하시겠습니까?</h2>
                                    <br><br><br><br>
                                    
                                    
                                    
                                    <button id="btnCancle">
								        <a class="btn block" onclick="if ( confirm('정말 취소하시겠습니까?') == false ) { return false; }" href="/board/bfBoard" style="text-decoration: none; color: white; font-size: 14px; font-weight: bold; ">취소</a>
								     </button>
                                    
                                    <button type="submit" id="btnInsert" name="btnInsert" style="color: white; font-size: 14px;">등록</button>
                                    
                                </div>
                            </fieldset>
                        
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>