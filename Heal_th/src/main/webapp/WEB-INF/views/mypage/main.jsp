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
    	        width: 900,
    	        height: 500
    	      };
      // Instantiate and draw our chart, passing in some options.
      var chart = new google.charts.Line(document.getElementById('linechart_material'));

      chart.draw(data, google.charts.Line.convertOptions(options));
    }





	
	


</script>

<style type="text/css">
#mypageBody{ 
 	padding-top:0;
 		background-color: #f9fbfc;
} 

#mypage{

    position: absolute;
    width: 70%;
    top: 100px;
    height: 100%;
}
#wrap{
	display: table;
    table-layout: fixed;
    width: 1200px;
    height: 100%;
    margin: 0 auto;
}


#title{
	text-align: center;
    padding-top: 100px;
}
.infoTitle{
	font-size: 20px;
	margin: 10px 0;
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

<body id="mypageBody">
	<div id="wrap">
		<div id="mypage">
			<div id="title" style="text-align: center;">
				<h1> 마이페이지 </h1>
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
		
</div>




</body>
</html>
