<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../layout/header.jsp" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">


$(document).ready(function(){
	

	$("#userJob").change(function(){
	var job = $("select[name=userJob]").val()
	console.log(job)
		$("#userJobFromDB").attr("value",job)
		
	})
	
	//네이버,카카오 회원은 아이디 변경 금지 처리
	var joinType="${userInfo.jointype}"
	console.log(joinType)
	if( joinType !="Dg"){
		$("#userEmail").attr("readonly","readonly")
		$("#btn_emailchk").hide()
		console.log("버튼 안됨")
		$("#userEmail").css("background","#7ca3f5")
	}else {
		console.log("득근 아이디")	
	}
	
	//DB에 있는 성별에 따라 체크 되게 하기
	$("input[name='userGender'][value='${userInfo.userGender}']").prop("checked",true);
	
	//DB에 있는 직업 값 default로 체스 되게 하기 
	

	
	//이메일 인증 클릭시 이메일 인증 하기 
	$("#btn_emailchk").click(function(){
		//이메일 변경 시 인증 전 update 금지
		console.log("버튼 클릭")
		$("#confirmEmail").css("display","block")
			$.ajax({
				type:"post"
				,url:"/mypage/getEmailCodeForUpdate"
				,data :{
					userEmail: $("#userEmail").val()
					,userName:$("#userName").val()
				}
				,dataType : "json"
				,success : function(res){
					console.log(res)
					console.log("이메일 보내기 성공")
					if(res){
					$("#emailAlert").html("인증번호 전송!회원님의 이메일함을 확인해주세요")
					$("#emailAlert").css("color","green")				
				
					
					}else {
						console.log("이메일 보내기 실패")
						$("#emailAlert").html("회원님의 이메일을 다시 한번 확인해주세요 ")
						$("#emailAlert").css("color","red")				
					
					}
				}
				,error:function(){
					console.log("이메일 인증요청 실패")
				alert("시스템 오류 관리자에게 문의하세요")
				}
		})
		
	}) //이메일 인증번호 요청 완료
	
	
	
	//인증번호 검사하기
	$("#chkemailCode").click(function(){
	
		$.ajax({
			type:"post"
			,url:"/mypage/chkEmailCdoeForUpdate"
			,data:{
				emailCode: $("#emailCode").val()
			}
			,dataType :"json"
			,success : function(res){
				if(res){
					console.log("이메일 인증 성공")
						$("#email_result").html("이메일 인증 성공")
						$("#email_result").css("color","green")
					}else {
						console.log("이메일 인증 실패")
						$("#email_result").html("이메일 인증 실패")
						$("#email_result").css("color","red")
					}
			}
			,error:function(){
				console.log("시스템 오류")
				alert("시스템 오류 관리자에게 문의하세요")
			}
			
		})
		
		
		
	})
	
	
	//문자 인증하기
	$("#btn_userchk").click(function(){
		console.log("문자 인증 클릭")
		$("#smschk").css("display","block")
		$.ajax({
			type :"post"
			,url: "/mypage/smsCodeForUpdate"
			,data: {
				userPhone :$("#userPhone").val()
			}
			,dataType : "json"
			,success : function(res){
				console.log(res)
				if(res){
				console.log("문자 보내기 성공")
					$("#userchkAlert").html("회원님의 휴대폰으로 인증번호가 전송되었습니다.")
					$("#userchkAlert").css("color","green")
				}else {
					$("#userchkAlert").html("회원님의 전화번호를 확인해주세요.")
					$("#userchkAlert").css("color","red")
				}
			}
			,error:function(){
				console.log("이메일 인증요청 실패")
			alert("시스템 오류 관리자에게 문의하세요")
			}
		})
		
	}) //문자로 인증번호 보내기 완료
	
	//문자 인증번호 검증하기
	$("#btn_code").click(function(){
		console.log("버튼 클릭")
		$.ajax({
			type:"post"
			,url:"/mypage/chkSmsCode"
			,data:{
				smsCode: $("#code").val()
			}
			,dataType :"json"
			,success : function(res){
				if(res ==true){
					console.log("문자 인증 성공")
						$("#result_code").html("본인 인증 성공")
						$("#result_code").css("color","green")
						
						
					}else {
						console.log("문자 인증 실패")
						$("#result_code").html("본인 인증 실패")
						$("#result_code").css("color","red")
					}
			}
			,error:function(){
				console.log("시스템 오류")
				alert("시스템 오류 관리자에게 문의하세요")
			}
			
		})
		
		
		
	})
	
	
	//수정완료 버튼 클릭 시 제출
	$("#joinbtn").click(function(){
		console.log("submit 클릭")
		if(update()){
			$("#updateInfoForm").submit()
			
		}
		return false;
		
	})
	
})	

	
	
function update(){
	console.log("회원정보 수정하기")
	 if($("#confirmEmail").css("display") == 'block' && $("#emailCode").val() == ""){
		 $("#email_result").html("이메일 변경시 이메일 인증을 해주세요")
			$("#email_result").css("color","red")
			return false
	 }else if( $("#smschk").css("display") == 'block' && $("#code").val() == ""){
		 $("#userchkAlert").html("전화번호 변경시 본인 인증을 해주세요")
			$("#userchkAlert").css("color","red")
			return false
	 }
			 
	
		 return true
	 }
		
	

function cancel(){
	console.log("취소하기")
	history.go(-1)
}
	

</script>






<script type="text/javascript">


	//주소 검색 API
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
#updateBody{
	padding-top:0;

}
#boxArea{
	margin: 0px 60px;
    height: 1610px;

}
#titleForHead{
	font-size: 30px;
    font-weight: 600;
    color: gray;
}
#updateInfoArea{
	width: 542px;
    height: 1610px;
    position: relative;
    background-color: white;
    border-radius: 12px;
	box-shadow: 1px 1px 10px 0px rgb(0 0 0 / 15%);
    margin: 0 auto;
	
}
inputInfo:focus{
	border-bottom-color:#7ca3f5; 
}
#title{
	padding: 61px 0px;
    height: 150px;
    text-align: center;
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

#userEmail,#emailCode,#userPhone,#postcode,#code{
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
    top: 40px;
    border: 2px solid lightgray;
    left: 250px;
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

#btn_userchk,#btnaddressFind,#btn_code,.btnCode{
	width: 108px;
    height: 36px;
    background-color: transparent;
    border: 2px solid #7ca3f5;
    color:#7ca3f5;
    font-size:17px;
    border-radius: 8px;
}

#btn_userchk:hover,#btnaddressFind:hover,#btn_code:hover,.btnCode:hover{
	color: white;
    background-color: #7ca3f5;
    width: 108px;
    height: 36px;
    border-radius: 8px;
}
#userchk,.btnCode{
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
#userJobFromDB{
width: 247px;
}

</style>

<body id="updateBody">

<div id="updateInfoArea">
	<div id="boxArea">
		<div id="title">
			<span id="titleForHead">회원 정보 수정하기</span>
		</div>
	
		<div id="formArea">
			<form action="/mypage/updateInfo" method="post" id="updateInfoForm">
				<div id="name" class="inputArea">	
					<label for="userName">	
				 		<span class="formTitle name">이름</span>
			 		</label> 
			 		<input type="text" name="userName" id="userName" value="${userInfo.userName }" class="inputInfo" readonly="readonly">
				</div>
			
					<div id="email" class="inputArea">
						<label for="userEmail">
							<span class="formTitle email">이메일</span>
						</label>
						<input type="text" name="userEmail" id="userEmail" value="${userInfo.userEmail}" class="inputInfo">
					
						<div id="btnGetCode">
							<button type="button" id="btn_emailchk" class="btnCode">이메일 인증</button>
						</div>
						<div id="emailAlert"  class="resMsg"></div>
					</div>
				
					<div id="confirmEmail" style="display:none;"class="inputArea">
						<label for="emailCode" >
							<span class="formTitle name">인증번호</span>
						</label>
							<input type="text" name="emailCode" id="emailCode" class="inputInfo" placeholder="인증번호를 입력하세요">
						<div id="btnEmailchk">
							<button type="button" id="chkemailCode" class="btnCode">인증번호 확인</button>
						</div>
						<div id="email_result" class="resMsg"></div>
					</div>
				
				<div id="id"  class="inputArea">
					<label for="userId" >
						<span class="formTitle name">아이디</span>
					</label>
					<input type="text" name="userId" id="userId" value="${userInfo.userId }" class="inputInfo" readonly="readonly">
				</div>
				<div id="nickname"class="inputArea">
					<label for="userNick" >
						<span class="formTitle nickName">닉네임</span>
					</label>
					<input type="text" name="userNick" id="userNick" class="inputInfo" value="${userInfo.userNick }">
				</div>
				
				<div id="phone" class="inputArea">
					<label for="userPhone" >
						<span class="formTitle mobilePhone">연락처</span>
					</label>
					<input type="text" name="userPhone" id="userPhone" class="inputInfo" value="${userInfo.userPhone }">
					
					<div id="userchk" class="inputArea">
						<button type="button" id="btn_userchk">본인인증</button>
					</div>
					<div id="userchkAlert" class="resMsg"></div>
				</div>
				
				<div id="smschk" style="display:none;" class="inputArea">
					<div id="smschk" >
						<input type="text" name="code" id="code" class="inputInfo">
					</div>
					<div id="btnsmschk">
							<button type="button" id="btn_code">인증번호 확인</button>			
					</div>
					<div id="result_code" class="resMsg"></div>		
				</div>
					
				
				<div id="gender" class="inputArea">
					<div id="genderTitle">
							<span class="formTitle gender">성별</span>			
					</div>		
					<div id="genderchk">	
						<div id="maleArea">	<input type="radio" name="userGender" value="M" id="male" onclick="return false;"  ><span class="formTitle male">남성</span></div>
						<div id="femaleArea"><input type="radio" name="userGender" value="F" id="female" onclick="return false;"><span class="formTitle female">여성</span></div>
					</div>
				</div>
				
				
					<div id="birth" class="inputArea">
					<label for="birth">
						<span class="formTitle birth">생년월일</span>
					</label>
					<input type="text" id="userBirth" name="userBirth" class="inputInfo" value="${userInfo.userBirth }" readonly="readonly">
				</div>
				
				<div id="job" class="inputArea">
					<label for="userJob">
						<span class="formTitle job">직업</span>
					</label>
						<input type="text" id="userJobFromDB" class="inputInfo" value="${userInfo.userJob}" readonly="readonly">
					<select name="userJob" id="userJob">
						<option value="${userInfo.userJob}" selected >${userInfo.userJob}</option>
						<option value="회사원">회사원</option>
						<option value="교사">교사</option>
						<option  value="공무원">공무원</option>
						<option   value="트레이너">트레이너</option>
						<option value="자영업">자영업</option>
						<option  value="학생">학생</option>
						<option value="기타">기타</option>
					</select>
						
				</div>
				
				
				
				<div id="address" class="inputArea">
					<label for="userAddress"><span class="formTitle address">주소</span></label>
						<input type="text" name="userAddress" id="postcode" placeholder="우편번호" value="${address[0] }" class="inputInfo">
						<input type="button" onclick="addressFind()" id="btnaddressFind" name="userAddress" value="우편번호 찾기" ><br>
						<input type="text" name="userAddress" id="userAddress" placeholder="주소"  value="${address[1] }" class="inputInfo"><br>
						<input type="text" name="userAddress" id="detailAddress" placeholder="상세주소"  value="${address[2] }" class="inputAddress">
						<input type="text" name="userAddress" id="extraAddress" placeholder="참고항목"  value="${address[3] }" class="inputAddress">
				</div>
				
				
				<div id="btnArea">
					<button type="button" id="joinbtn" >수정 완료</button>
					<button  type="button" id="joinCancel" onclick="cancel()">취소</button>
				</div>
			</form>
		</div>

	</div>
</div>


</body>
<jsp:include page="../layout/footer.jsp"/>

</html>