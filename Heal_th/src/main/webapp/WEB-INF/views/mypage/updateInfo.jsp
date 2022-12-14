<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../layout/header.jsp" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">


$(document).ready(function(){
	
	var count =0;
	
	if($("#userGender").val() == 'F'){
		$("#userGender").attr("value","여성")
	}else {
		$("#userGender").attr("value","남성")
	}	

	$("#userJob").change(function(){
	var job = $("select[name=userJob]").val()
	console.log(job)
		$("#userJobFromDB").attr("value",job)
		
	})
	
	//이메일 변경시  이메일 인증해야만 저장됨
	
	
	//이메일 인증 클릭시 이메일 인증 하기 
	$("#btn_emailchk").click(function(){
		console.log("버튼 클릭")
		$("#confirmEmail").toggle()
			$.ajax({
				type:"post"
				,url:"/mypage/getEmailCodeForUpdate"
				,data :{
					userEmail: $("#userEmail").val()
					,userName:$("#userName").val()
				}
				,dataType : "html"
				,success : function(res){
					console.log(res)
					console.log("이메일 보내기 성공")
					
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
				if(res ==true){
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
	
	
	
	
	
})	

	


	

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
#updateInfo{
	width: 1600px;
	margin: 0 auto;
	
}

#title{
	text-align: center;
	padding: 50px;
	font-size: 40px;
}

#updateArea{
	width:500px;
	margin: 0 auto;	
}
</style>

<body>

<div id="updateInfo">
	<div id="title">
		<p>회원 정보 수정하기</p>
	</div>

	<div id="updateArea">
			<div id="name">		
			 	<label for="userName">이름
		 		<input type="text" name="userName" id="userName" value="${userInfo.userName }">
		 		</label> 
			</div>
	
			<div id="email">
				<label for="userEmail">이메일
				<input type="text" name="userEmail" id="userEmail" value="${userInfo.userEmail}">
				</label>
			</div>
			
			<div id="userchk">
				<button type="button" id="btn_emailchk">이메일 인증</button>
			</div>
	
			<div id="confirmEmail" style="display:none;">
				<label for="emailCode">인증번호
					<input type="text" name="emailCode" id="emailCode" placeholder="인증번호를 입력하세요">
				</label>
				<button type="button" id="chkemailCode">인증번호 확인</button>
			</div>
			
			<div id="email_result"></div>
			
			<div id="id">
				<label for="userId">아이디
				<input type="text" name="userId" id="userId" value="${userInfo.userId }"readonly="readonly" >
				</label>
			</div>
			<div id="nickname">
				<label for="userNick">닉네임
				<input type="text" name="userNick" id="userNick" value="${userInfo.userNick }">
				</label>
			</div>
			
			<div id="phone">
				<label for="userPhone">연락처
				<input type="text" name="userPhone" id="userPhone" value="${userInfo.userPhone }">
				</label>
				
				<div id="userchk">
					<button type="button" id="btn_userchk">본인인증</button>
				</div>
			</div>
			
				<div id="smschk" style="display:none;">
					<input type="text" name="code" id="code">
					<button type="button" id="btn_code">인증번호 확인</button>			
				</div>
				
				<div id="result_code"></div>
			
			<div id="gender">
				<label for="userGender">성별			
				<input type="text" name="userGender" id="userGender" value="${userInfo.userGender }">
				</label>
			</div>
			
			
				<div id="birth">
				<label for="birth">생년월일
					<input type="text" id="userBirth" name="userBirth" value="${userInfo.userBirth }" readonly="readonly" >
				</label>
			</div>
			
				<div id="job">
				<label for="userJob">직업
					<input type="text" id="userJobFromDB" value="${userInfo.userJob }" readonly="readonly">
				</label>
				<select name="userJob" id="userJob">
					<option value="" selected disabled>선택해주세요</option>
					<option value="회사원">회사원</option>
					<option value="교사">교사</option>
					<option  value="공무원">공무원</option>
					<option   value="트레이너">트레이너</option>
					<option value="자영업">자영업</option>
					<option  value="학생">학생</option>
					<option value="기타">기타</option>
				</select>
					
			</div>
			
			
			
				<div id="address">
				<label for="userAddress">주소</label>
					<input type="text" name="userAddress" id="postcode" placeholder="우편번호" value="${address[0] }">
					<input type="button" onclick="addressFind()" name="userAddress" value="우편번호 찾기" ><br>
					<input type="text" name="userAddress" id="useraddress" placeholder="주소"  value="${address[1] }"><br>
					<input type="text" name="userAddress" id="detailAddress" placeholder="상세주소"  value="${address[2] }">
					<input type="text" name="userAddress" id="extraAddress" placeholder="참고항목"  value="${address[3] }">
			</div>
			
			
			<div id="btnArea">
			<button type="button" id="joinbtn">가입 완료</button>
			<button  type="button" id="joinCancel">가입 취소</button>
			</div>

	</div>


</div>


</body>
</html>