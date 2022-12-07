<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<script type="text/javascript">
$(document).ready(function() {
	
	$("#btnUpdate").click(function() {
		$(this).parents("form").submit();
	});
	
})


</script>

<style type="text/css">

#originFile, #newFile {
	display: none;
}

.through {
	text-decoration: line-through;
}

#deleteFile {
	font-weight: bold;
	color: red;
	cursor: pointer;
}

</style>

<div class="container">

<h1>글수정</h1>
<hr>

<form action="/board/bfUpdate" method="post" enctype="multipart/form-data">

<%-- <input type="hidden" name="boardNo" value="${updateBoard.boardNo }"> --%>

<input type="hidden" name="bfNo" value="${param.bfNo }">


<div class="form-group">
	<h2>Before</h2>
                        
			<div>
             	<label for="bfTitle">제목</label>
					<input type="text" id="bfTitle" name="bfTitle" value="${updateBoard.bfTitle }" placeholder="제목을 입력해주세요">
                 <br>
                        	
			<h3>운동 전 정보</h3>
				<label for=	"height">신장</label>
					<input type="text" id="height" name="height" value="${updateBoard.height }" placeholder="160cm">
                <br>
                 <label for="gender">성별</label>
					<input type="text" id="gender" name="gender" value="${updateBoard.gender }" placeholder="여성/남성">
                 <br>
                 <label for="weight">몸무게</label>
					<input type="text" id="weight" name="weight" value="${updateBoard.weight }" placeholder="50kg">
                  <br>
                  <label for="bfExercise">운동종류</label>
                    <input type="text" id="bfExercise" name="bfExercise" value="${updateBoard.bfExercise }" placeholder="현재 하고 있는 운동종류를 입력해주세요">
                  <br>
                     <button>첨부파일</button>
			</div>
						
			<div>
			<h3>설정 목표</h3>
				<label for="gWeight">목표 체중</label>
					<input type="text" id="gWeight" name="gWeight" value="${updateBoard.gWeight }" placeholder="목표 체중을 입력해주세요">
				<br>
				<label for="date">목표 기간</label>
					<input type="text" id="sDate" name="sDate" value="${updateBoard.sDate }" placeholder="시작일: YYYY-MM-DD">-
                    <input type="text" id="eDate" name="eDate" value="${updateBoard.eDate }" placeholder="목표일: YYYY-MM-DD">
                <br>
                <label for="seleExercise">선택 운동</label>
					<input type="text" id="seleExercise" name="seleExercise" value="${updateBoard.seleExercise }" placeholder="목표 체중을 입력해주세요">
				<br>
                            
			</div>                            

			<h3>다짐글</h3>
				<textarea rows="20" cols="50" id="beforeCon" name="beforeCon" value="${updateBoard.beforeCon }" placeholder="다짐글을 작성해주세요"></textarea>
				
				
				<br><br><br> 

<!--                   <button type="button" id="RightToLeft" class="on-off" style="margin-right: 10px;">After</button> -->
                 
<!--                   <button style="margin-right: 10px;"> -->
<!--                   	<a class="btn block" onclick="if ( confirm('정말 삭제하시겠습니까?') == false ) { return false; }" href="/board/bfBoard" style="color: white; text-decoration: none;">취소</a> -->
<!--                   </button> -->
	</div> <!-- before content end div -->


<div class="content">
	<h2>After</h2>
		
			<div>
	        <h3>운동 후 현재 정보</h3>
	        	<label for="cWeight">몸무게</label>
	            	<input type="text" id="cWeight" name="cWeight" value="${updateBoard.cWeight }" placeholder="운동 후 몸무게를 입력해주세요">
				<br><br>
	             <label>첨부파일</label>
					<button>첨부파일</button>
				<br><br>
	            <label for="gResult">결과</label>
					<select id="gResult" name="gResult" value="${updateBoard.gResult }">
						<option value="매우 성공" selected="selected">매우 성공</option>
						<option value="약간 성공">약간 성공</option>
						<option value="변화 없음">변화 없음</option>
						<option value="약간 실패">약간 실패</option>
						<option value="매우 실패">매우 실패</option>
					</select>
				<br><br>
	                            
				<h3>후기글</h3>
					<textarea rows="20" cols="50" id="afterCon" name="afterCon" value="${updateBoard.afterCon }" placeholder="후기글을 작성해주세요"></textarea>
				</div>
 
<!--                     <button type="button" id="LeftToRight" class="on-off">이전</button> -->
                    
<!--                     <button type="submit" class="btn btn-primary" id="btnInsert">등록</button> -->
                    
<!--                     <button id="btnCancle" style="margin-right: 10px;"> -->
<!--                   	<a class="btn block" onclick="if ( confirm('정말 삭제하시겠습니까?') == false ) { return false; }" href="/board/bfBoard" style="color: white; text-decoration: none;">취소</a> -->
<!--                   </button> -->
	
	</div> <!-- content div 끝 -->


<div class="text-center">
	<button type="submit" class="btn btn-primary" id="btnUpdate">수정</button>
                    
     <button id="btnCancle" style="margin-right: 10px;">
        <a class="btn block" onclick="if ( confirm('정말 취소하시겠습니까?') == false ) { return false; }" href="/board/bfBoard" style="text-decoration: none;">취소</a>
     </button>
     
      <button id="btnDelete" style="margin-right: 10px;">
        <a class="btn block" onclick="if ( confirm('정말 삭제하시겠습니까?') == false ) { return false; }" href="/board/bfDelete" style="text-decoration: none;">삭제</a>
     </button>
     
</div>
</form>



</div><!-- .container end -->z















