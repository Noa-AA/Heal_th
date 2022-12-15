<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

 <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css">
    <link rel="stylesheet" href="style.css">

<style type="text/css">

#search {
	text-align: center;
}

#type{
	border: 2px solid #7ca3f5;
	font-weight: border;
	display: none;
}

#searchText{
	width: 320px;
	padding: 0 6px;
	border: 2px solid #7ca3f5;
	border-radius: 30px;
	transition: 0.4s;
	padding-top: 8px;
	padding-bottom: 8px;
	
}

#searchText:hover{
  box-shadow: 0px 0px .5px 1px #7ca3f5;
  width: 340px;
}

#searchIcon{
 margin-left: -39px;
  width: 30px;
  height: 30px;
  background-color: #fff;
  color: #7ca3f5;
  justify-content: center;
  align-items: center;
  border-radius: 50%;
  border: none;
}


</style>



</head>
<body>

<div class="search_area">
				<select name="type" id="type">
					<option value="TC" <c:out value="${pageMaker.boardSearch.type eq 'TC'?'selected':'' }"/>>제목+내용</option>
				</select> 
				
					<input id="searchText" type="text" name="keyword" value="${pageMaker.boardSearch.keyword }" placeholder="search...">
				<button id="searchIcon"><i class="fas fa-search"></i></button>
				
				
			</div>
		</div>
	</div>



</body>
</html>