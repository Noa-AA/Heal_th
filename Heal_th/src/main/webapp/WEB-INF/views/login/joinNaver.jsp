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
#joinarea {
 	width:500px;
 	margin : 0 auto;
 }
 
 </style>
<body>



<div id="joinarea">
	<div id="intro">
			<h1>네이버 아이디로 회원가입</h1>
			<div id="intro_description">추가적인 정보를 기입해주세요 ! 아이디는 수정이 불가합니다</div>
		</div>
		
		
	<form action="/login/join" method="post" id="joinNaverform">
		<div id="howJoin">
				<input id="joinType" name="joinType" value="Naver" style="display: none;">
			</div>
		<div id="name">		
		 	<label for="userName">이름
	 		<input type="text" name="userName" id="userName" value='${naverJoin.userName }'>
	 		</label> 
		</div>
		
		<div id="nameAlert"></div>
	
		<div id="email">
			<label for="userEmail">이메일
			<input type="text" name="userEmail" id="userEmail" value="${naverJoin.userEmail }">
			</label>
		</div>
		
		<div id="emailAlert"></div>
		
		<div id="id">
			<label for="userId">아이디
			<input type="text" name="userId" id="userId" value="${naverJoin.userId}" readonly="readonly">
			</label>
		</div>
	
		<div id="checkIdResult"></div>
	
		<div id="pw">
			<label for="userPw">비밀번호
			<input type="password" name="userPw" id="userPw">
			</label>
		</div>
		<div id="pwAlert"></div>
		
		
		<div id="pwChk">
			<label for="userPwChk">비밀번호 확인
			<input type="password" name="userPwChk" id="userPwChk">
			</label>
		</div>
		<div id="pwAgain"></div>
		
		
		
		<div id="nick">
			<label for="userNick">닉네임
			<input type="text" name="userNick" id="userNick" value="${naverJoin.userNick }">
			</label>
		</div>
			<div id="nickAlert"></div>
		
		<div id="phone">
			<label for="userPhone">연락처
			<input type="text" name="userPhone" id="userPhone" value="${naverJoin.userPhone}">
			</label>
			
			<div id="userchk">
				<button type="button" id="btn_userchk">본인인증</button>
		</div>
		
			<div id="smschk" style="display:none;">
				<input type="text" name="code" id="code">
				<button type="button" id="btn_code">인증번호 확인</button>			
			</div>
			
			<div id="result_code"></div>
			
		</div>
		
		<div id="gender">
			<label for="userGender">성별			
			<input type="radio" name="userGender" value="M" id="male">남성
			<input type="radio" name="userGender" value="F" id="female">여성
			</label>
		</div>
		<div id="genderAlert"></div>
			
			
		<div id="birth">
			<label for="birth">생년월일
				<input type="text" id="userBirth"name="userBirth" placeholder="생년월일 예)19930101" value="${naverJoin.userBirth }">
			</label>
		</div>
		
		<div id="birthAlert"></div>
		
		<div id="job">
			<label for="userJob">직업</label>
			<select name="userJob" id="userJob">
				<option value="" selected disabled>선택해주세요</option>
				<option value="staff">회사원</option>
				<option value="teacher">교사</option>
				<option value="publicOfficial">공무원</option>
				<option value="trainer">트레이너</option>
				<option value="business">자영업</option>
				<option value="student">학생</option>
				<option value="etc">기타</option>
			</select>
				
		</div>
		<div id="jobAlert"></div>
		
	
	
		<div id="address">
			<label for="userAddress">주소</label>
				<input type="text" name="userAddress" id="postcode" placeholder="우편번호">
				<input type="button" onclick="addressFind()" name="userAddress" value="우편번호 찾기"><br>
				<input type="text" name="userAddress" id="useraddress" placeholder="주소"><br>
				<input type="text" name="userAddress" id="detailAddress" placeholder="상세주소">
				<input type="text" name="userAddress" id="extraAddress" placeholder="참고항목">
		</div>
			<div id="addressAlert"></div>
			
			
		<button type="button" id="joinbtn">가입 완료</button>
		<button  type="button" id="joinCancel">가입 취소</button>
	</form>

	<div id="addressChk"></div>
	
</div>

</body>
</html>