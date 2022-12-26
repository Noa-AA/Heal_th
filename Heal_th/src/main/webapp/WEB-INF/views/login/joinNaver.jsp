<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../layout/header.jsp" %>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">

$(document).ready(function(){

	var naverPhone = $("#userPhone").val()
  	
  	if(naverPhone =="${naverJoin.userPhone}"){
  	var userPhoneN	=naverPhone.split("-").join("")
  		console.log(userPhoneN)
  		 $("#userPhone").attr("value",userPhoneN)
  	}
  	
  if($("#userBirth").val() == "${naverJoin.userBirth}"){
	  var naverBirth = $("#userBirth").val().split("-").join("")
	  console.log(naverBirth)
	   $("#userBirth").attr("value",naverBirth)
  }
	

	  //회원 본인 인증 
  $("#btn_userchk").click(function(){
	console.log("btn_userchk클릭")
	 $("#smschk").toggle()
	 //보인인증을 위한 문자 보내는 요청하기
		 $.ajax({
			 type:"post"
			 ,url:"/login/userChk"
			,data:{
				userPhone : $("#userPhone").val()
			  }
			,dataType:"json"
			,success:function(res){
				console.log("문자 요청 성공")
			}
			,error: function(){
	  			console.log("문자요청 실패")
		  			alert("전화번호를 확인해주세요")
	  		}
		 })
		 
});//문자보내기 완료 
	
$("#btn_code").click(function(){

	console.log("btn_code 클릭")
	$.ajax({
		 type:"post"
		,url:"/login/codeChk"
		,data :{
			code: $("#code").val()
		}
		,dataType:"json"				
		,success:function(res){
			console.log(res)
			console.log("본인인증 성공")
			
			if(res) {
				//본인인증 성공 시 
			$("#result_code").html("본인인증 성공!")
			$("#result_code").css("color","green")
			} else {
				
			//본인인증 실패시
			console.log('본인인증 실패')
			$("#result_code").html("본인인증을 다시 해주세요")
			$("#result_code").css("color","red")
				return false
			}
		}
		,error :function(){
			alert("관리자에게 문의해주세요")
			console.log("실패!!!!")	
		}
	}); 
	
}) //문자인증 완료 


//회원가입 form 전송
$("#joinbtn").click(function(){
	console.log("submit event")

	//유효성 검증 후 submit*(조건이 모두 만족해야 가입이됨)
	if(validate()&& validatePw()&&pwChk()){
		$("#joinNaverform").submit();
    }
		return false;	//조건 만족하지 않으면 회원가입 되지 않음	
	})
	
	
	 //비밀번호 유효성 검사
    $("#userPw").change(function(){
    		console.log("비밀번호 유효성 검사")
			validatePw()
    })
    
    //비밀번호 재확인
    $("#userPwChk").keyup(function(){
		console.log("비밀번호 입력 확인")
		pwChk()
	})
    
   
    //input박스 초기화
    $("#userName").focus(function(){
    	$("#nameAlert").html("");
    })
    
    //첫번째 입력창에 포커스 주기
    $("input").eq(0).focus()
    
    //취소하기 버튼(뒤로가기)
    $("#joinCancel").click(function(){
    	console.log("취소하기")
    	history.go(-1) 
    })
    
 

    
   //메시지 영역 초기화
   $("#userName").focus(function(){ //이름 메시지 영역 초기화
	   $("#nameAlert").html("")
   })
   
   $("#userEmail").focus(function(){//이메일 메시지 영역 초기화
	   $("#emailAlert").html("")
   })
   
   $("#userId").focus(function(){//아이디 메시지 영역 초기화
	   $("#checkIdResult").html("")
   })
   
    $("#userPw").focus(function(){//비밀번호 메시지 영역 초기화
	   $("#pwAlert").html("")
   })
    $("#userPwChk").focus(function(){//비밀번호 확인 메시지 영역 초기화
	   $("#pwAgain").html("")
   })
   
    $("#userNick").focus(function(){//닉네임 메시지 영역 초기화
	   $("#nickAlert").html("")
   })
   
   $("#userPhone").focus(function(){//휴대폰 메시지 영역 초기화
	   $("#result_code").html("")
   })
   

   $("#male").focus(function(){//성별 메시지 영역 초기화
	   $("#genderAlert").html("")
   })
   
   $("#female").focus(function(){//성별 메시지 영역 초기화
	   $("#genderAlert").html("")
   })
   
   $("#userBirth").focus(function(){//생년월일 메시지 영역 초기화
	   $("#birthAlert").html("")
   })
   
   $("#userJob").focus(function(){//직업 메시지 영역 초기화
	   $("#jobAlert").html("")
   })
   
   $("#detailAddress").focus(function(){//주소 메시지 영역 초기화
	   $("#addressAlert").html("")
   })
   

    
	
})
  //비밀번호 유효성 검사
 function validatePw(){
	  
	  var vPw = document.getElementById("userPw").value

	  
	  if(!/^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/.test(vPw)){
		  console.log("비밀번호 유효성검사")
			document.getElementById("pwAlert").innerHTML="<span style='color:red;'> * 비밀번호는 영문대소문자,숫자,특수문자를 모두 포함 8자 이상이어야 합니다.</span>"
	  		return false;
	  }else{
		  console.log("비밀번호 확인")
			document.getElementById("pwAlert").innerHTML="<span style='color:green;'> 강력한 비밀번호입니다</span>"
	  		return true;
	  }
	  
	
	  
  }
  
 function pwChk(){
	  
	  var vPw = document.getElementById("userPw").value
	  var vPwagain = document.getElementById("userPwChk").value
	  
	  //비밀번호 입력 확인
	  if( vPw != vPwagain) {
	  		console.log("비밀번호 불일치")
			document.getElementById("pwAgain").innerHTML="<span style='color:red;'> 비밀번호가 일치하지않습니다. 다시한번 확인해주세요</span>"
			return false;
	  }else {
		  	console.log("비밀번호 일치")
			document.getElementById("pwAgain").innerHTML="<span style='color:green;'> 비밀번호 확인 완료</span>"
		  	return true;
	  }
	 
 }

 function validate(){
 	//이름이 빈칸일 때 
 	if(document.getElementById("userName").value =="") {
 		console.log("이름입력 알림")
 		document.getElementById("nameAlert").innerHTML="<span style='color:red;'>* 이름을 입력해주세요</span>"
 		return false;
 	} 
 	
 	//이메일이 빈칸일 때 
 	if(document.getElementById("userEmail").value =="") {
 		console.log("이메일입력 알림")
 		document.getElementById("emailAlert").innerHTML="<span style='color:red;'>* 이메일을 입력해주세요</span>"
 			return false;
 	}
 	
 	//아이디가 빈칸일 때 
 	var testId = document.getElementById("userId").value
 	if(testId =="") {
 		console.log("아이디입력 알림")
 		document.getElementById("checkIdResult").innerHTML="<span style='color:red;'>* 아이디를 입력해주세요</span>"
 			return false;
 	}
 	
 
 

 	//비밀번호가 빈칸일 때 
 	if(document.getElementById("userPw").value =="") {
 		console.log("비밀번호입력 알림")
 		document.getElementById("pwAlert").innerHTML="<span style='color:red;'>* 비밀번호를 입력해주세요</span>"
 			return false;
 	}
 	
//  	//비밀번호 유효성 검사 ,비밀번호 확인이 빈칸  
 	if(document.getElementById("userPwChk").value =="") {
 		console.log("비밀번호입력 알림")
 		document.getElementById("pwAgain").innerHTML="<span style='color:red;'>* 비밀번호를 확인해주세요</span>"
 			return false;
 	}
 	
 		//닉네임이 빈칸일 때 
 	if(document.getElementById("userNick").value =="") {
 		console.log("닉네임입력 알림")
 		document.getElementById("nickAlert").innerHTML="<span style='color:red;'>* 닉네임을 입력해주세요</span>"
 		return false;
 	}
 	
 		//연락처가 빈칸일 때 
 	if(document.getElementById("userPhone").value =="") {
 		console.log("연락처입력 알림")
 		document.getElementById("result_code").innerHTML="<span style='color:red;'>* 연락처를 입력하고 본인인증을 해주세요</span>"
 			return false;
 	}
 		
 		
//  		//본인인증번호가 안되었을 때 ->
//  	if(document.getElementById("code").value =="") {
//  		console.log("본인인증입력 알림")
//  		document.getElementById("result_code").innerHTML="<span style='color:red;'>* 본인인증을 해주세요</span>"
//        return false; 		    	
//			 }	

 		
		//성별이 빈칸일 때 
		var genderRadioF = document.querySelector('input[id="female"]').checked;
		var genderRadioM = document.querySelector('input[id="male"]').checked;
		console.log(genderRadioF)
		console.log(genderRadioM)
 	if(!genderRadioF && !genderRadioM) {
 		console.log("성별입력 알림")
 		document.getElementById("genderAlert").innerHTML="<span style='color:red;'>* 성별을 입력해주세요</span>"
 			return false;
 	}
		//생년월일이 빈칸일 때 
 	if(document.getElementById("userBirth").value =="") {
 		console.log("생년월일입력 알림")
 		document.getElementById("birthAlert").innerHTML="<span style='color:red;'>* 생년월일을 입력해주세요</span>"
 			return false;
 	}
		
 	//직업이 빈칸일 때 
 	
 	if(document.getElementById("userJob").value == "") {
 		console.log("직업입력 알림")
 		document.getElementById("jobAlert").innerHTML="<span style='color:red;'>* 직업을 입력해주세요</span>"
 			return false;
 	}	
 	//주소가 빈칸일 때 
 	if(document.getElementById("postcode").value =="") {
 		console.log("주소입력 알림")
 		document.getElementById("addressAlert").innerHTML="<span style='color:red;'>* 주소를 입력해주세요</span>"
 			return false;
 	}	
 	
 	return true;

}
</script>

<script>
    function addressFind() {
            	console.log("주소검색");
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("useraddress").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }
    
    
 
</script>
 
 <style type="text/css">
 #joinBody{
 	background-color: white;
 
 }
body{
	padding-top:0;
}
 

#boxArea{
	margin: 0px 60px;
    height: 1680px;

}
input:focus{
	border-bottom-color:#7ca3f5; 
}
 
#joinArea {
	width: 542px;
    height: 1680px;
    position: relative;
    background-color: white;
    border-radius: 12px;
	box-shadow: 1px 1px 10px 0px rgb(0 0 0 / 15%);
    margin: 0 auto;
 }
 

 #title {
 	padding: 40px 70px; 
    height: 189px;
    width: 422px;
    padding: 50px 0px;
   text-align: center;
 }
 
 #hLogo{
 text-align: center;
 }
 
 #intro_description{
     width: 422px;
    font-size: 16px;
    margin-top: 42px;
 }
 #logoImg{
 		
    text-align: center;
    left: 160px;
    width: 223px;
 
 }
 
#formArea{
    height: 1680px;

}

#btnArea{
	    position: absolute;
    height: 50px;
    left: 60px;
margin: 16px 0 0 0;
}
 
.resMsg{
	position: absolute;
    top: 85px;
    margin: 7px 0 0;
}

.inputArea{
	margin: 0;
	position:relative;
	height:114px;
}
.formTitle{
	font-size: 17px;
	color:gray;
	 position: absolute;
    top: 0px;
    margin: 10px 0 0;
}

.inputInfo{
	width: 422px;
    height: 33px;
    margin-left: 0;
    outline: none;
    border: none;
    border-bottom: 2px solid lightgray;
    position:absolute;
    top:39px;
     font-size: 17px;
}
.inputAddress{
    height: 33px;
    outline: none;
    border: none;
    border-bottom: 2px solid lightgray;
	font-size: 17px;
}

#userPhone,#postcode,#code{
width: 312px;
}

#btnsmschk{
	    position: absolute;
    top: 14px;
    left: 314px;
}
#userJob{
    width: 171px;
    height: 32px;
    position: absolute;
    top: 53px;
    border: 2px solid lightgray;
}

#userJob:focus{
	 border: 3px solid #7ca3f5;
}

#checkId{
	width: 111px;
    height: 38px;
    position: absolute;
    left: 374px;
    top: 414px;

}

#btn_checkId,#btn_userchk,#btnaddressFind,#btn_code{
	width: 108px;
    height: 36px;
    background-color: transparent;
    border: 2px solid #7ca3f5;
    color:#7ca3f5;
    font-size:17px;
    border-radius: 8px;
}

#btn_checkId:hover,#btn_userchk:hover,#btnaddressFind:hover,#btn_code:hover{
	color: white;
    background-color: #7ca3f5;
    width: 108px;
    height: 36px;
    border-radius: 8px;
}
#userchk{
	 width: 111px;
    height: 38px;
    position: absolute;
    left: 314px;
    top: 35px;

}

#codeChk{
 	height: 88px;
    top: -1px;

}
#code{
	top:16px;
}
#genderchk{

    position: absolute;
    top: 38px;
    width: 200px;
    height: 45px;
}
#femaleArea{
    position: absolute;
    width: 100px;
    left: 100px;
    top: -1px
}
.male,.female{
	padding-left: 8px;
    position: absolute;
    top: -10px;
}

#address{
height: 180px;

}
#postcode{
    position: absolute;

}

#userAddress{
    position: absolute;
    top:76px;

}
#detailAddress{
    position: absolute;
    top: 113px;
}
#extraAddress{
	position: absolute;
    top: 113px;
    left: 218px;
    

}

#result_code{
	    top: 55px;
}
#btnaddressFind{
	border: none;
    position: absolute;
    left: 314px;
    top: 36px;
    border: 2px solid #7CA3F4;
    padding: 0 5px;
}

#joinbtn,#joinCancel{
	width: 190px;
    height: 47px;
      border-radius: 8px;
}
#joinbtn{
	background-color: #7ca3f5;
	font-size: 17px;
	color:white;
}
#joinCancel{
	margin-left: 40px;
	font-size: 17px;
    color: #7ca3f5;
    background-color: transparent;
    border:2px solid #7ca3f5;
}

#addressAlert{
top:154px;
}

#genderAlert{
	top:70px;
}
 
 </style>
<body id="joinBody">


<div id="joinArea">
	<div id="boxArea">
		<div id="title">
				<div id="hLogo">
					<img id="logoImg" src="/resources/img/logo_purple.png">
				</div>
				<div id="intro_description"><p class="notice">네이버 아이디로 회원가입 추가적인 정보를 기입해주세요!</p> 
				<span class="notice">아이디는 수정이 불가합니다</span>
				</div>
			</div>
			
		<div id="formArea">
			<form action="/login/join" method="post" id="joinNaverform">
				<div id="howJoin">
						<input id="joinType" name="joinType" value="Naver" style="display: none;">
					</div>
				<div id="name" class="inputArea">	
				 	<label for="userName">
			 			<span class="formTitle name">이름</span>
			 		</label> 
			 		<input type="text" name="userName" id="userName" class="inputInfo" value='${naverJoin.userName }'>
					<div id="nameAlert"  class="resMsg"></div>
				</div>
				
			
				<div id="email" class="inputArea">
					<label for="userEmail">
						<span class="formTitle email">이메일</span>
					</label>
					<input type="text" name="userEmail" id="userEmail" class="inputInfo" value="${naverJoin.userEmail }">
					<div id="emailAlert" class="resMsg"></div>
				</div>
				
				
				<div id="id" class="inputArea">
					<label for="userId">
						<span class="formTitle id">아이디</span>
					</label>
					<input type="text" name="userId" id="userId" class="inputInfo" value="${naverJoin.userId}" readonly="readonly">
					<div id="checkIdResult" class="resMsg"></div>
					
				</div>
			
			
				<div id="pw"  class="inputArea">
						<label for="userPw">
							<span class="formTitle pw">비밀번호</span>
						</label>
						<input type="password" name="userPw" id="userPw" class="inputInfo">
						<div id="pwAlert" class="resMsg"></div>
				</div>
				
				
				<div id="pwChk" class="inputArea">
						<label for="userPwChk">
							<span class="formTitle pwCheck">비밀번호 확인</span>
						</label>
						<input type="password" name="userPwChk" id="userPwChk" class="inputInfo">
					<div id="pwAgain" class="resMsg"></div>
				</div>
				
				
				
				<div id="nick" class="inputArea">
					<label for="userNick">
						<span class="formTitle nickName">닉네임</span>
					</label>
					<input type="text" name="userNick" id="userNick"  class="inputInfo" value="${naverJoin.userNick }">
					<div id="nickAlert" class="resMsg"></div>
				</div>
				
				
				<div id="forPhone">
					<div id="phone" class="inputArea">
						<label for="userPhone">
						<span class="formTitle mobilePhone">연락처</span>
						</label>
						<input type="text" name="userPhone" id="userPhone" class="inputInfo" value="${naverJoin.userPhone}">
						
						<div id="userchk">
								<button type="button" id="btn_userchk"><span class="btnTitle userchk">본인인증</span></button>
						</div>
						<div id="userchkAlert" class="resMsg"></div>
					</div>
				</div>
					
					<div id="codeChk" class="inputArea" style="display:none;" >
						<div id="smschk" >
							<input type="text" name="code" id="code" class="inputInfo">
							<div id="btnsmschk">
								<button type="button" id="btn_code"><span class="btnTitle btnsmsCodeChk">인증번호 확인</span></button>			
							</div>
						</div>
							<div id="result_code" class="resMsg"></div>
					</div>	
				
				
					<div id="gender" class="inputArea">
						<div id="genderTitle">
							<span class="formTitle gender">성별</span>			
						</div>
						<div id="genderchk">
							<div id="maleArea"><input type="radio" name="userGender" value="M" id="male"><span class="formTitle male">남성</span></div>
							<div id="femaleArea"><input type="radio" name="userGender" value="F" id="female"><span class="formTitle female">여성</span></div>
						</div>
						<div id="genderAlert" class="resMsg"></div>
					</div>
					
					
				<div id="birth" class="inputArea">>
					<label for="birth">
						<span class="formTitle birth">생년월일</span>
					</label>
						<input type="text" id="userBirth"name="userBirth" placeholder="생년월일 예)19930101" class="inputInfo" value="${naverJoin.userBirth }">
					<div id="birthAlert"></div>
				</div>
				
				
					<div id="job" class="inputArea">
						<label for="userJob">
							<span class="formTitle job">직업</span>
						</label>
						<select name="userJob" id="userJob">
							<option value="" selected disabled>선택해주세요</option>
							<option value="회사원">회사원</option>
							<option value="교사">교사</option>
							<option value="공무원">공무원</option>
							<option value="트레이너">트레이너</option>
							<option value="자영업">자영업</option>
							<option value="학생">학생</option>
							<option value="기타">기타</option>
						</select>
							
						<div id="jobAlert" class="resMsg"></div>
					</div>
				
			
			
				<div id="address" class="inputArea">
						<label for="userAddress"><span class="formTitle address">주소</span></label>
							<input type="text" name="userAddress" id="postcode" placeholder="우편번호" class="inputInfo">
							<input type="button" onclick="addressFind()" id="btnaddressFind" name="userAddress" value="우편번호 찾기"><br>
							<input type="text" name="userAddress" id="userAddress" placeholder="주소" class="inputInfo"><br>
							<input type="text" name="userAddress" id="detailAddress" placeholder="상세주소" class="inputAddress">
							<input type="text" name="userAddress" id="extraAddress" placeholder="참고항목" class="inputAddress">
							<div id="addressAlert" class="resMsg"></div>
				</div>
					
					
				<div id="btnArea">
						<button type="button" id="joinbtn">가입 완료</button>
						<button  type="button" id="joinCancel">가입 취소</button>
				</div>
			</form>
		</div>
	</div>
</div>
</body>
<jsp:include page="../layout/footer.jsp"/>

</html>