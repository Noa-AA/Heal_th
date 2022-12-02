<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1" />
    <script src=
"https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
    </script>

<title>Insert title here</title>

<style type="text/css">


body {
    height: 100%;
    overflow: hidden;
    width: 100%;
    box-sizing: border-box;
}

   
/* Adding background image to right side */
.background-Right {
    position: absolute;
    right: 0;
    width: 50%;
    height: 100%;
    background: linear-gradient(to right, #000428, #004e92);
    background-size: cover;
    background-position: 50% 50%;
}

/* Adding background image to left side */
.background-Left {
    position: absolute;
    left: 0;
    width: 50%;
    height: 100%;
    background: linear-gradient(to right, #02a8a8, #4fb783);
    background-size: cover;
    background-position: 50% 50%;
}
   
#background {
    width: 100%;
    height: 100%;
    position: absolute;
    z-index: -3;
}
   
/* Slide is used to slide the form left-right 
    sides when toggle on button */
#slide {
    width: 50%;
    max-height: 100%;
    height: 100%;
    overflow: hidden;
    margin-left: 50%;
    position: absolute;
    box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25),
            0 10px 10px rgba(0, 0, 0, 0.22);
}
   
/* This make forms z-index greater 
   than background-image */
.top {
    width: 200%;
    height: 100%;
    position: relative;
    left: 0;
    left: -100%;
}
   
/* This indicates Login-form will 
   appear on the left side */
.left {
    width: 50%;
    /*     height: 100%; */
	height: 1800px;
    background: #ffff;
    left: 0;
    position: absolute;
}
   
/* This indicates Register-form 
    will appear on the right side */
.right {
    width: 50%;
/*     height: 100%; */
	height: 1800px;
    background: #ffff;
    right: 0;
    position: absolute;
}
   
/* Position the form into center 
   of the viewbox */
.content {
    width: 250px;
    margin: 0 auto;
    top: 10%;
    position: absolute;
    left: 50%;
    margin-left: -125px;
}
   
.content h2 {
    color: #4caf50;
    font-size: 35px;
}
   
button {
    background-color: #4caf50;
    color: white;
    width: auto;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
}
   
input[type="text"],
input[type="password"] {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
}
   
/* off class is used to indicate 
   the active button like login 
   or register button */
.on-off {
    background: none;
    color: #4caf50;
    box-shadow: none;
}

</style>


<script type="text/javascript">

$(document).ready(function () {
	 $("#LeftToRight").on("click", function () {
	        $("#slide").animate({
	            marginLeft: "50%",
	        });
	        $(".top").animate({
	            marginLeft: "0",
	        });
	    });
	
	$("#RightToLeft").on("click", function () {
        $("#slide").animate({
            marginLeft: "0",
        });
        
        $(".top").animate({
            marginLeft: "100%",
        });
        
    });

	//등록 버튼
	$("#btnInsert").click(function() {
		$(this).parents("form").submit();
	});
	
	
});

</script>


</head>

<body>
    <div id="background">
        <div class="background-Right"></div>
        <div class="background-Left"></div>
    </div>
 
    <div id="slide" style="overflow: scroll; height: 1000px;">
        <div class="top">
        
        
            <div class="left">
                
                <div class="content">
                
                    <h2>After</h2>
                    <form method="post"
                        onsubmit="return false;">
                        
                        <div>
                        <h3>설정 목표</h3>
                       	  <label for="bfTitle">목표 체중</label>
                            <input type="text"
                                placeholder="email" />
                            <br>
                            <label for="bfTitle">목표 기간</label>
                            <input type="text">-<input type="text">
                            <br>
                                <label for="bfTitle">선택 운동</label>
                            <input type="text"
                                placeholder="email" />
                        </div>
                    
                    <br><br>
                    <div>
                    	<h3>운동 후 현재 정보</h3>
                    	<label for="bfTitle">몸무게</label>
                            <input type="text"
                                placeholder="email" />
                            <br><br>
                            
                            <label>첨부파일</label>
                            <button>첨부파일</button>
                            <br><br>
                    	<label for="bfTitle">결과</label>
                            <select id="g_result">
				<option value="매우 성공" selected="selected">매우 성공</option>
				<option value="약간 성공">약간 성공</option>
				<option value="변화 없음">변화 없음</option>
				<option value="약간 실패">약간 실패</option>
				<option value="매우 실패">매우 실패</option>
		</select>
                            <br><br>
                            
                            <h3>후기글</h3>
						<textarea rows="20" cols="60"></textarea>
                    </div>
                    </form>
 
                    <button id="LeftToRight"
                        class="on-off">이전
                    </button>
                     
                    <button id="btnInsert">등록</button>
                     <button id="btnCancle" style="margin-right: 10px;">
                        <a class="btn block" onclick="if ( confirm('정말 삭제하시겠습니까?') == false ) { return false; }" href="/board/bfBoard">취소</a></button>
                </div>
            </div>
 
 
 
 
 
            <div class="right">
                <div class="content">
                    <h2>Before</h2>
                    <form method="post"
                        onsubmit="return false;">
                        <div>
                        <label for=	"bfTitle">제목</label>
                            <input type="text"
                                placeholder="제목을 입력해주세요">
                            <br>
                        	<h3>현재 정보</h3>
                            <label for=	"height">신장</label>
                            <input type="text"
                                placeholder="160cm">
                            <br>
                            <label for=	"bfTitle">성별</label>
                            <input type="text"
                                placeholder="여성/남성">
                            <br>
                            <label for=	"bfTitle">몸무게</label>
                            <input type="text"
                                placeholder="50kg">
                            <br>
                            <label for=	"bfTitle">운동종류</label>
                            <input type="text"
                                placeholder="운동종류를 입력해주세요">
                            <br>
                            <button>첨부파일</button>
                        </div>
						
						<div>
							<h3>설정 목표</h3>
                            <label for=	"bfTitle">목표 체중</label>
                            <input type="text"
                                placeholder="목표 체중을 입력해주세요">
                            <br>
                            <label for=	"bfTitle">목표 기간</label>
                            <input type="text">-
                            <input type="text">
                            <br>
                             <label for="bfTitle">선택 운동</label>
                            <input type="text"
                                placeholder="목표 체중을 입력해주세요">
                            <br>
                            
						</div>                            
						
						<h3>다짐글</h3>
						<textarea rows="20" cols="60"></textarea>
 
 
                        <button id="RightToLeft"
                            class="on-off">After
                        </button>
                         
                        
                        <button id="btnCancle" style="margin-right: 10px;">
                        <a class="btn block" onclick="if ( confirm('정말 삭제하시겠습니까?') == false ) { return false; }" href="/board/bfBoard">취소</a></button>
                        
                        
                    </form>
                </div>
            </div>
        </div>
    </div>



</body>
</html>