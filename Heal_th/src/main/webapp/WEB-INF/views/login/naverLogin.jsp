<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../layout/header.jsp" %>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<body>
<script type="text/javascript">
  var naver_id_login = new naver_id_login("3hffBOgRGmclmhYQtUOc", "/login/naverLogin");
  // 접근 토큰 값 출력
  alert(naver_id_login.oauthParams.access_token);
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
 
  naver_id_login.getLoginStatus(function(status){
	if(satus){
		   const nickName=naverLogin.user.getNickName();
	          const age=naverLogin.user.getAge();
	          const birthday=naverLogin.user.getBirthday();

	          if(nickName===null||nickName===undefined ){
	            alert("별명이 필요합니다. 정보제공을 동의해주세요.");
	            naverLogin.reprompt();
	            return ;  
	         }else{
	          setLoginStatus();
	         }
		
		
	}
	  
	  
  })
  
  
    console.log(naverLogin);

  
  
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
	  
	  //필수 사항
    alert(naver_id_login.getProfileData('email'));
    alert(naver_id_login.getProfileData('nickname'));
    alert(naver_id_login.getProfileData('age'));
  }
</script>
</body>
</html>