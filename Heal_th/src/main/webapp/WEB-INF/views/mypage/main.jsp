<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../layout/header.jsp" %>
<%@include file="../layout/mypageSide.jsp" %>
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
    	        width: 1200,
    	        height: 500
    	      };
      // Instantiate and draw our chart, passing in some options.
      var chart = new google.charts.Line(document.getElementById('linechart_material'));

      chart.draw(data, google.charts.Line.convertOptions(options));
    }





	
	


</script>

<style type="text/css">
header{
	margin-bottom: 80px !important;

}

#mypageBody{ 
 	padding-top:0;
 		background-color: #f9fbfc;
} 

#mypage{
    display: flex;
    width: 70%;
    top: 100px;
    height: 100%;
    flex-direction: column;
}
#wrap{
 	 width: 70%;
    height: 100%;
    margin-left: 710px;
    
}


#title{
	padding-top: 100px;
    margin-left: 200px;
}
.infoTitle{
	font-size: 20px;
	margin: 10px 0;
}

inputArea{
	margin: 0;
	position:relative;
	height:114px;
}

.inputInfo{
	width: 155px;
    height: 33px;
    margin-left: 0;
    outline: none;
    border: none;
    border-bottom: 2px solid lightgray;
     font-size: 17px;
     background-color: #f9fbfc;
         padding-left: 15px;
}
#graph,#bodyInfo{
	margin-top:50px;
}

#bodyInfo{
	margin-left: 260px;

}
.formTitle{
	font-size: 17px;
	color:gray;
    margin: 10px 0 0;
}

.inputInfo:focus{
	border-bottom-color:#7ca3f5; 
}

#inputWeight{
	float: left;
    maring-right: 20px;
    margin-right: 34px;
}

#btnArea{
float: right;
    height: 50px;
    position: absolute;
    top: 807px;
    left: 1470px;
	
}

#btnBodyInfo{
	width: 190px;
    height: 47px;
     border-radius: 8px;
     	background-color:transparent;
	font-size: 17px;
	color:#7ca3f5;
	border: 2px solid #7CA3F4;
}

#btnBodyInfo:hover{
	background-color: #7ca3f5;
	color:white;
}
</style>

<body id="mypageBody">
	<div id="wrap">
		<div id="mypage">
			<div id="title" style="text-align: center;">
				<h1 style="color:gray;"> 마이페이지 </h1>
			</div>
			<div id="graph">
				<div id="graphMsg" style="display: none;"></div>
		
			  <!--Div that will hold the pie chart-->
		 		<div id="linechart_material" style="width: 900px; height: 500px"></div>	
		
			</div>
			
			<div id="bodyInfo" >
				<div id="inputWeight" class="inputArea">
					<label for="weight">
						<span class="formTitle" >몸무게</span>
					</label>
					<input type="text" id="weight" name="weight" class="inputInfo"><span class="formTitle" >kg</span>
				
				</div>
				
				<div id="heightArea">
						<div id="intputHeight" class="inputArea">
							<label for="height">
								<span class="formTitle" >키</span>
							</label>
								<input type="text" id="height" name="height" class="inputInfo" value ="${bodyInfo.height} " ><span class="formTitle">cm</span>
						</div>
				</div>
				<div id="btnArea">
					<div id="btnBody">
						<button type="button" id="btnBodyInfo" >입력하기</button>
					</div>
				
				</div>
			</div>
		
		</div>	
		
</div>




</body>
</html>
