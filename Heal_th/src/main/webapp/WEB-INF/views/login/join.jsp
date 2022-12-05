<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../layout/header.jsp" %>
 <script type="text/javascript">
 
  $(document).ready(function(){
	  			
	  	
	  			
	  			
	  
				//아이디 중복 검사 
			  $("#btn_checkId").click(function(){
				
				  	console.log("checkId 클릭")
				
				  	$.ajax({
				  		
				  		type:"post"
				  		,url:"/login/checkId"
				  		,data:{
				  			userId : $("#userId").val()
				  			}
				  		,dataType:"json"
				  		,success:function(res){
// 				  			
				  			console.log(res)
				  			if(res ==0) {	
				  			$("#checkIdResult").html("사용가능한 아이디입니다.")
				  			$("#checkIdResult").css("color","green")
				  			
				  			} else {
				  				$("#checkIdResult").html("사용할 수 없는  아이디입니다.")
				  				$("#checkIdResult"). css("color","red")
				  			}
				  		}
				  		,error: function(){
				  			console.log("중복확인 실패")
				  			alert("시스템 오류: 관리자에게 문의하세요")
				  			
				  		}
				  	})
			  })
			  
			  
			  
// 			  //회원 본인 인증 
			  $("#btn_userchk").click(function(){
				console.log("btn_userchk클릭")
				 $("#smschk").toggle()
				 
				 
				 //보인인증을 위한 문자 보내는 요청하기
				 new Promise(function(resolve, reject) { 
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
// 	 			  			alert("전화번호를 확인해주세요")
				  			
				  		}
						 
					 })
					 
					 
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
						
						if(res==true) {
							//본인인증 성공 시 
						$("#result_code").html("본인인증 성공!")
						$("#result_code").css("color","green")
							
						} else {
							
						//본인인증 실패시
						console.log('본인인증 실패')
						$("#result_code").html("본인인증을 다시 해주세요")
						$("#result_code").css("color","red")
						}
					}
					,error :function(){
						alert("관리자에게 문의해주세요")
						console.log("실패!!!!")	
					}
					
					
				}); 
				
			}) //문자인증 완료 
			
	
		
  })			

				  
				  
			 
			  
			  
 
  
  </script>
 
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
 

 
</head>


<body>


회원 가입

<div id="joinform">
	<form action="/login/join" method="post">
		<div id="name">		
		 	<label for="userName">이름
	 		<input type="text" name="userName" id="userName">
	 		</label> 
		</div>
	
		<div id="email">
			<label for="userEmail">이메일
			<input type="text" name="userEmail" id="userEmail">
			</label>
		</div>
		<div id="id">
			<label for="userId">아이디
			<input type="text" name="userId" id="userId">
			</label>
		</div>
		
		<div id="checkId">
			<button type="button"  id="btn_checkId">중복확인</button>
		</div>
		
		<div id="checkIdResult"></div>
	
		<div id="pw">
			<label for="userPw">비밀번호
			<input type="text" name="userPw" id="userPw">
			</label>
		</div>
		
		<div id="nick">
			<label for="userNick">닉네임
			<input type="text" name="userNick" id="userNick">
			</label>
		</div>
		<div id="phone">
			<label for="userPhone">연락처
			<input type="text" name="userPhone" id="userPhone">
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
			<input type="radio" name="userGender" value="male">남성
			<input type="radio" name="userGender" value="female">여성
			</label>
			
		<div id="birth">
			<label for="birth">생년월일
				<input type="text" name="userBirth" placeholder="생년월일 예)19930101">
			</label>
		</div>
		<div id="job">
			<label for="userJob">직업</label>
			<select name="userJob">
				<option value="staff">회사원</option>
				<option value="teacher">교사</option>
				<option value="publicOfficial">공무원</option>
				<option value="trainer">트레이너</option>
				<option value="business">자영업</option>
				<option value="student">학생</option>
				<option value="etc">기타</option>
			</select>
				
		</div>
		
		
		</div>
	
		<div id="address">
			<label for="userAddress">주소</label>
				<input type="text" name="userAddress" id="postcode" placeholder="우편번호">
				<input type="button" onclick="addressFind()" name="userAddress" value="우편번호 찾기"><br>
				<input type="text" name="userAddress" id="useraddress" placeholder="주소"><br>
				<input type="text" name="userAddress" id="detailAddress" placeholder="상세주소">
				<input type="text" name="userAddress" id="extraAddress" placeholder="참고항목">
			
		</div>
		
		
		<button id="joinbtn">가입 완료</button>
	
	</form>

</div>
</body>
</html>