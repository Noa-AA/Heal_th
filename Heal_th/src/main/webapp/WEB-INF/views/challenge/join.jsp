<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="../layout/header.jsp"%>

<style type="text/css">
#twoDepth-list a {
	width: 33.3%;
}

.container {
	margin-top: 40px;
}

.area {
	margin: 10px 5px;
	padding: 10px;
}

.area-title {
	width: 100%;
	padding: 5px;
	border-bottom: 1px solid gray;
}

.area-title * {
	width: auto;
	padding: 3px;
	font-size: 20px;
	font-weight: bold;
	color: #fff;
	background: #c583d6;
	font-weight: bold;
	border-radius: 5px;
}

.area-body {
	padding: 5px;
	border-bottom: 1px solid gray;
}

.input-group {
	padding: 2px;
}

.input-group label {
	margin-right: 2px;
}

input:disabled {
	background: none;
	border: none;
}

input:not(:disabled) {
	border: 1px solid #333;
	border-radius: 5px;
}

.btn_wrap {
	text-align: center;
}
</style>
<body>
	<div id="subvisual">
		<div id="subvisual-A">
			<p id="subv-title">가입 화면</p>
		</div>
	</div>
	<div id="twoDepth">
		<div id="twoDepth-list">
			<a href="/challenge/list">챌린지 리스트</a>
			<a href="/challenge/create">챌린지 만들기</a>
			<a href="/challenge/mypage">챌린지 마이페이지/인증</a>
		</div>
	</div>
	<div class="container">
		<div id="chlInfo_area" class="area">
			<div class="area-title">
				<span>챌린지 정보</span>
			</div>
			<div class="area-body">
				<div class="input-group">
					<label>챌린지 번호 : </label>
					<input type="text" name="challengeNo" id="challengeNo" value="${challenges.challengeNo }" disabled="disabled">
				</div>
				<div class="input-group">
					<label>챌린지 종류 : </label>
					<input type="text" name="challengeKind" id="challengeKind" value="${challenges.challengeKind }" disabled="disabled">
				</div>
				<div class="input-group">
					<label>챌린지 이름 : </label>
					<input type="text" name="challengeName" id="challengeName" value="${challenges.challengeName }" disabled="disabled">
				</div>
				<div class="input-group">
					<label>챌린지 생성일 : </label>
					<input type="text" name="challengeCredate" id="challengeCredate" value="<fmt:formatDate value="${challenges.challengeCredate }" pattern="yyyy-MM-dd" />" disabled="disabled">
				</div>
				<div class="input-group">
					<label>챌린지 종료일 : </label>
					<input type="text" name="challengeEnddate" id="challengeEnddate" value="<fmt:formatDate value="${challenges.challengeEnddate }" pattern="yyyy-MM-dd" />" disabled="disabled">
				</div>



			</div>
		</div>

		<div id="reward_area" class="area">
			<div class="area-title">
				<span>총 상금에 대한 설명</span>
			</div>
			<div class="area-body">
				<div></div>
				<table id="rewardInfo">
					<tr>
						<td>100% 성공 : 예치금 전액 + 상금</td>
					</tr>

					<tr>
						<td>85%이상 성공 : 예치금 전액 환급</td>
					</tr>

					<tr>
						<td>예치금 일부 환급(성공률 만큼)</td>
					</tr>

				</table>
			</div>
		</div>
		<div id="Mmoney_area" class="area">
			<div class="area-title">
				<span>결제 정보</span>
			</div>

			<div class="area-body">

				<div class="input-group">
					<label>보유 득근머니: </label>
					<input type="text" name="mCharge" id="mCharge" value="${ mmoney.mCharge }" disabled="disabled">
				</div>
				<div class="input-group">
					<label>예치금으로 걸 금액 : </label>
					<input id="input-q3" type="text" name="mUse" placeholder="최소금액 1000원" onchange="this.value=inputMuse(1000, ${ mmoney.mCharge }, this.value);">
					<button onclick="q3()">확인</button>
					<div class="mFeedback"></div>
				</div>
			</div>
		</div>
		<div id="user_area" class="area">
			<div class="area-title">
				<span>회원 정보</span>
			</div>
			<div class="area-body">
				<div class="input-group">
					<label>회원이름 : </label>
					<input type="text" name="userName" id="userName" value="${user.userName}" disabled="disabled">
				</div>
				<div class="input-group">
					<label>연락처 : </label>
					<input type="text" name="userPhone" id="userPhone" value="${user.userPhone}" disabled="disabled">
				</div>
				<div class="input-group">
					<label>이메일 : </label>
					<input type="text" name="userEmail" id="userEmail" value="${user.userEmail}" disabled="disabled">
				</div>
				<div class="input-group">
					<label>회원번호 : </label>
					<input type="text" name="userNo" id="userNo" value="${user.userNo}" disabled="disabled">
				</div>
			</div>
		</div>

		<div id="total_area" class="area">
			<div class="area-title">
				<span>total</span>
			</div>
			<div class="area-body" style="font-size: 20px;">
				<input type="text" name="total" disabled="disabled">
			</div>
		</div>

		<div class="btn_wrap">
			<button class="btn" id="list_btn" onclick="location.href='/challenge/list'">취소하기</button>
			<a class="btn" id="pay_btn">가입하기</a>
			<!-- <button class="btn" id="pay_btn">가입하기</button> -->
		</div>

	</div>
	<%@include file="../layout/footer.jsp"%>
</body>

<script type="text/javascript">
	
	let form = $("#payForm");

	//결제 버튼
	$("#pay_btn").on("click", function() {
		var total = $('input[name=total]').val();
		if(total == '' || total == null){
			$('input[name=mUse]').focus().css({'border-color':'#c583d6'});
			$('.mFeedback').text('예치금을 입력해주세요').css({'color':'#c583d6'});
			return false;
		}
		
		var inputData = getInputData();
		
		createForm(inputData);
		
	});
	
	function getInputData(){
		
		var dataObj = new Object();
		$('.area').each((idx,ele)=> {
			var area = $(ele).attr('id');
			
			var obj = new Object();
			$(ele).find('input').each((i, e)=>{
				var name = e.getAttribute('name')
				var value = e.value;
				obj[name]=value;
			});
			dataObj[area] = obj
		
		});
		
		return dataObj
	}
	
	function createForm(inputData){
		var form = $('<form>');
		form.attr('action', '/challenge/join');
		form.attr('method', 'post');
		
		var values={
			 challengeNo : inputData.chlInfo_area.challengeNo,
			 userNo : inputData.user_area.userNo,
			 mUse : inputData.Mmoney_area.mUse,
		};
		
		$.each(values, function(k, v){
			var field =$('<input>')
			field.attr('name', k);
			field.attr('value', v);
			console.log(field)
			form.append(field);
		});
		
		$(document.body).append(form)
		form.submit();
	}
	

	//예치금 확인 버튼
	function q3() {

		let name = $('#input-q3').val().trim()
		if (name == '' || name == null) {
			alert('예치금을 입력해주세요')
		} else {
			console.log(name)
			$('input[name=total]').val(name);
		}

	};

	//예치금 최소 최대 값 관련
	function inputMuse(min, max, mUseValue){
		//정규식으로 숫자만 추출
		var value = mUseValue.replace(/[^-0-9]/g,'');
		if(value >= min && value <= max){
			
		return value;
		}
		
		return min;
	}
</script>


</html>