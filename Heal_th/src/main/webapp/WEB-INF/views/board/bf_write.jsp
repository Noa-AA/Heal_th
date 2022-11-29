<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비포 애프터 게시글 작성</title>

<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>


<style type="text/css">

body{margin: 0 auto; width: 1000px; height: 800px;}

input { border-radius: 3px; }

div{
	display: center;
	
}



</style>

<script type="text/javascript">

$(document).ready(function() {
	
	//등록 버튼
	$("#btnInsert").click(function() {
		$(this).parents("form").submit();
	})
	
})
	
	


</script>

</head>
<body>

<form action="./bfBoard" method="post">

<br><br><br>

<h1>Before (운동 시작 전)</h1>

<div class="before" style="margin-bottom: 100px;">

<h3>현재 정보</h3>


<table>
	<tr>
		<td>신장</td>
		<td><input type="text" id="height" required id="height">  cm</td>
	</tr>
	
	<tr>
		<td>성별</td>
		<td><input type="text" id="gender" required id="gender"></td>
	</tr>
	
	<tr>
		<td>몸무게</td>
		<td><input type="text" id="weight" required id="weight">  kg</td>
	</tr>
	
	<tr>
		<td>운동 종류</td>
		<td><input type="text" id="bf_exercise" required id="bf_exercise"></td>
	</tr>
	
	<tr>
		<td>첨부파일</td>
		<td><button>첨부파일</button></td>
	</tr>
	
</table>

<h3>설정 목표</h3>

<table>
	<tr>
		<td>목표 체중</td>
		<td><input type="text" id="g_weight" required id="g_weight">  kg</td>
	</tr>
	
	<tr>
		<td><label for="date">목표 기간</td>
		<td><input type="text" id="s_date" required id="s_date"></td>
		<td>-</td>
		<td><input type="text" id="e_date" required id="e_date"></td>
	</tr>
	
	<tr>
		<td>선택 운동</td>
		<td><input type="text" id="sele_exercise" required id="sele_exercise"></td>
	</tr>

</table>

<table>
	<tr>
		<td>다짐글</td>
	</tr>

	<tr>		
		<td><textarea id="before_con" class="form-contorl" placeholder="다짐글을 작성해주세요" name="before_con" maxlength="20000" style="height: 350px; width: 500px;"></textarea></td>
	</tr>
</table>


</div>

<hr>


<h1 style="margin-top: 100px;">After (운동 후 결과)</h1>

<div class="after">

<h3>설정 목표</h3>

<table>
	<tr>
		<td>목표 체중</td>
		<td><input type="text" id="g_weight" required id="g_weight">  kg</td>
	</tr>
	
	<tr>
		<td>목표 기간</td>
		<td><input type="text" id="s_date" required id="s_date"></td>
		<td>-</td>
		<td><input type="text" id="e_date" required id="e_date"></td>
	</tr>
	
	<tr>
		<td>선택 운동</td>
		<td><input type="text" id="sele_exercise" required id="sele_exercise"></td>
	</tr>

</table>

<h3>운동 후 현재 정보</h3>


<table>
	<tr>
		<td>신장</td>
		<td><input type="text" id="height" required id="height">  cm</td>
	</tr>
	
	<tr>
		<td>성별</td>
		<td><input type="text" id="gender" required id="gender"></td>
	</tr>
	
	<tr>
		<td>몸무게</td>
		<td><input type="text" id="g_weight" required id="g_weight">  kg</td>
	</tr>
	
	<tr>
		<td>첨부파일</td>
		<td><button>첨부파일</button></td>
	</tr>
	
</table>


<h3>목표 결과</h3>

<table>
	<tr>
		<td>결과</td>
		<td>
			<select id="g_result">
				<option value="매우 성공" selected="selected">매우 성공</option>
				<option value="약간 성공">약간 성공</option>
				<option value="변화 없음">변화 없음</option>
				<option value="약간 실패">약간 실패</option>
				<option value="매우 실패">매우 실패</option>
		</select>
		</td>
	</tr>

</table>

<table>
	<tr>
		<td>후기글</td>
<!-- 		<td style="color: red; font-size: 2px;">*글은 최대 2000자 까지 작성가능합니다</td> -->
	</tr>

<br><br>

	<tr>
		<td><textarea id="after_con" class="form-contorl" placeholder="후기글을 작성해주세요." name="before_con" maxlength="20000" style="height: 350px; width: 500px;"></textarea></td>
	</tr>
</table>


</div>

<br><br><br>

<div id="button" style="float: right;">
<button id="btnDelete" style="margin-right: 10px;"><a class="btn block" onclick="if ( confirm('정말 삭제하시겠습니까?') == false ) { return false; }" href="/board/bfDelete">삭제</a></button>

<button type="button" class="btn btn-primary" id="btnInsert">등록</button>

</div>

<br><br><br><br><br><br><br>

</form>

</body>
</html>