<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../layout/header.jsp" %>
 <!--Load the AJAX API-->
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
	
		
	$("#btnBodyInfo").click(function(){
		console.log("몸무게 입력 클릭")
		$.ajax({
			
			type:"post",
			dataType:"json",
			url: "/mypage/updateBodyInfo",
			data :{
		
				weight : $("#weight").val(), //몸무게 입력
				height: $("#height").val() //키 입력 
				
			},
			success: function(res){
				console.log("그래프 호출 성공")

				drawChart()
				$("#weight").val("")
				
			},
			error : function(){
				console.log("ajax실패")
			}
		})
		
		
	})


})


    // Load the Visualization API and the piechart package.
    google.charts.load('current', {'packages':['line']});
      
    // Set a callback to run when the Google Visualization API is loaded.
    google.charts.setOnLoadCallback(drawChart);
      
    function drawChart() {
      var jsonData = $.ajax({
    	  type: "post",
          url: "/mypage/sendData",
          dataType: "json",
          async: false
          })
          
      //data 영역
      // Create our data table out of JSON data loaded from server.
      
      console.log(jsonData.responseJSON.length)
      if(jsonData.responseJSON.length == 0){
    	  console.log("없음")
    	  
			$("#graphMsg").css("display","block")   	  
			$("#graphMsg").html("몸무게를 입력해주세요")    	  
      }else {
			$("#graphMsg").css("display","none")   	  
    	  
    	  var data = new google.visualization.DataTable();
          console.log(jsonData)
          data.addColumn('string', '날짜'); //기입 날짜
          data.addColumn('number', '몸무게'); //몸무게
          
      for(var i =0;i<jsonData.responseJSON.length;i++){

    	  console.log(jsonData.responseJSON[i].weight)
    	  console.log(jsonData.responseJSON[i].bodyDate)
    	  data.addRow([jsonData.responseJSON[i].bodyDate, jsonData.responseJSON[i].weight])
      }
      
          
      }
      
      var options = {
    	        chart: {
    	          title: '나의 몸무게',
    	          subtitle: '단위: kg'
    	        },
    	        width: 900,
    	        height: 500
    	      };
      // Instantiate and draw our chart, passing in some options.
      var chart = new google.charts.Line(document.getElementById('linechart_material'));

      chart.draw(data, google.charts.Line.convertOptions(options));
    }





	
	


</script>

<style type="text/css">
/* body{ */
/* 	padding-top:0; */
/* } */
#mypage{
	width: 1200px;
	margin: 0 auto;
}
.infoTitle{
	font-size: 20px;
	margin: 10px 0;
}

#profileArea{

	width: 200px;
    position: fixed;
    left: 200px;
}

#pIcon{
	width:100px;
}

#manageInfo{
	margin-top: 29px;	
}

#intro{
	margin-top: 55px;	

}
.pIcon{
	width: 160px;
    height: 160px;
    border-radius: 71px;
}

#graph{
   position: absolute;
    left: 437px;
    top: 282px;
}
#BodyInfo{
	position: relative;
    top: 685px;
    left: 500px;
}
#btnArea{
    left: 800px;
    position: absolute;
    top: 1000px;
}

</style>

<body>

<div id="mypage">
	<div id="title" style="text-align: center;">
		<h1> 마이페이지 </h1>
	</div>

	
	<div id="profileArea">
		<div id="profilePhoto">
			<c:if test="${storedName == null }">
				<a href="/mypage/setProfile"><img src="/resources/img/mypage/userprofile.png" class="pIcon"></a>
			</c:if>
			<c:if test="${storedName != null}">
				<a href="/mypage/setProfile"><img src="${pageContext.request.contextPath}/upload/${storedName.storedName}" class="pIcon"></a>
			</c:if>
		</div>
	
		
		<div id="intro">
			<c:choose>
				<c:when test="${userIntro.userIntro == null}">
					<a href="/mypage/setProfile">한 줄 소개를 작성해주세요</a>
				</c:when>
				<c:otherwise>
					<a href="/mypage/setProfile">${userIntro.userIntro}</a>
				</c:otherwise>
			
			</c:choose>
		</div>
	
		<div id="manageInfo">
			<div id="usersInfo">
				<ul id="updateInfo">
					<li class="infoTitle updateTitle" >회원 정보 관리</li>
					<li class="info updateUser"><a href="/mypage/updateInfo">회원 정보 변경</a></li>
					<li class="info updatePw"><a href="/mypage/updatePw">비밀번호 변경</a></li>
					<li class="info dropOut"><a href="/mypage/dropOut">탈퇴하기</a></li>
					<li class="info logOut"><a href="/mypage/logout">로그아웃</a></li>
					
				
				</ul>
					
			</div>
		
		</div>
		
	</div>

	<div id="graph">
		<div id="graphMsg" style="display: none;"></div>

	  <!--Div that will hold the pie chart-->
 		<div id="linechart_material" style="width: 900px; height: 500px"></div>	

	</div>
	
	<div id="BodyInfo">
		<div id="inputInfo">
			<label for="weight">몸무게
				<input type="text" id="weight" name="weight"><span>kg</span>
			</label>
		
		</div>
		
		<div id="heightArea">
				<div id="intputHeight">
					<label for="height">키
						<input type="text" id="height" name="height" value ="${bodyInfo.height} " ><span>cm</span>
					</label>
				</div>

		</div>
	</div>
	<div id="btnArea">
		<div id="btnBody">
			<button type="button" id="btnBodyInfo" >입력하기</button>
		</div>
	
	</div>

</div>	
		





</body>
</html>