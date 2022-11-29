<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>운동 인증 게시글 작성</title>
</head>
<body>



<div>

<h1>운동 인증</h1>

<form action="" method="post">

<table>
	<tr>
		<td>제목</td>
		<td><input type="text" name="v_title" required id="title"></td>
	</tr>
	
	<tr>
		<td>운동 종목</td>
		<td><input type="text" name="exercise" required id="exercise"></td>
	</tr>
	
	<tr>
		<td>소요 시간</td>
		<td><input type="text" name="time" required id="time"></td>
	</tr>
	
	<tr>
		<td>소비 칼로리</td>
		<td><input type="text" name="kcal" required id="kcal">kcal</td>
	</tr>
	
	<tr>
		<td>첨부파일</td>
		<td><button>첨부파일</button></td>
	</tr>
	
</table>




<button>삭제</button>

<button>등록</button>

</form>

</div>

</body>
</html>