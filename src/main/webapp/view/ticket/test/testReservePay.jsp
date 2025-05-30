<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page contentType="text/html; charset=UTF-8" language="java"%>

<style>
.step {
	margin-bottom: 20px;
	background-color: #fff;
	padding: 15px;
	border: 1px solid #ddd;
}

.step-title {
	background-color: #111;
	color: #fff;
	padding: 10px;
	font-weight: bold;
	cursor: pointer;
}

.step-content {
	display: none;
	padding: 10px;
}

.payment-option {
	margin-top: 10px;
}
</style>

<div class="step">
	<div class="step-title" onclick="toggleStep(1)">STEP 1. 할인쿠폰</div>
	<div class="step-content" id="step-content-1">할인 쿠폰 입력 또는 선택 영역</div>
</div>

<div class="step">
	<div class="step-title" onclick="toggleStep(2)">STEP 2. 관람권/기프트콘</div>
	<div class="step-content" id="step-content-2">관람권/기프트콘 입력 영역</div>
</div>

<div class="step">
	<div class="step-title" onclick="toggleStep(3)">STEP 3. 포인트 및
		기타결제 수단</div>
	<div class="step-content" id="step-content-3">포인트 입력 및 기타 결제 수단
		선택 영역</div>
</div>

<div class="step">
	<div class="step-title">STEP 4. 최종결제 수단</div>
	<div class="step-content" style="display: block;">
		<label><input type="radio" name="payMethod" value="card"
			checked> 신용카드</label> <label><input type="radio"
			name="payMethod" value="phone"> 휴대폰 결제</label> <label><input
			type="radio" name="payMethod" value="easy"> 간편결제</label> <label><input
			type="radio" name="payMethod" value="bank"> 내통장결제</label> <label><input
			type="radio" name="payMethod" value="tos"> 토스</label>

		<div class="payment-option">
			카드종류: <select name="cardType">
				<option value="hyundai">현대카드</option>
				<option value="samsung">삼성카드</option>
				<option value="lotte">롯데카드</option>
				<!-- 기타 카드 추가 -->
			</select>
		</div>

		<div class="payment-option">
			<label><input type="radio" name="cardOption" value="appCard">앱카드</label>
			<label><input type="radio" name="cardOption" value="normal"
				checked> 일반 신용카드(체크카드 포함)</label>
		</div>

		<p style="color: gray; font-size: 12px;">
			※ 신용카드는 결제 가능 최소 금액은 1,000원 이상입니다.<br> ※ 삼성페이/토스 결제는 OK캐쉬백 미적립<br>
			(삼성포인트, OK캐쉬백포인트는 통합 적립 불가)
		</p>
	</div>
</div>
<%
Object obj = session.getAttribute("userIdx");
int userIdx = 0;
if (obj instanceof Integer) {
	userIdx = (Integer) obj;
}
%>
<script>
	function toggleStep(stepNum) {
		const content = document.getElementById("step-content-" + stepNum);
		content.style.display = (content.style.display === "block") ? "none"
				: "block";
	}
	
	const cinemaNum = {
			"용산점":{
				"1관": 1,
				"2관": 2
				},
			"강남점": {
				"1관": 3,
				"2관": 4
				}
			};
	
	const userIdx = <%= userIdx %>;
	const seatName = document.querySelector(".seat_name").textContent;
	const movieIdx = document.querySelector(".movie_title").dataset.movieIdx;
	const theaterTitle = document.querySelector(".theater_title").textContent.split(" ");
	const cinemaTitle = document.querySelector(".cinema_title").textContent;
	const dateTime = document.querySelector(".date_time").textContent.split(" ");
	
	$('.next_btn_topay').on('click', function(e) {
		$.ajax({
			url : '${pageContext.request.contextPath}/ReserveInsert.tiw',
			type : 'POST',
			data : {
				'userIdx': userIdx,
				'seatName': seatName,
				'movieIdx': movieIdx,
				'cinemaIdx': cinemaNum[theaterTitle[1]][cinemaTitle],
				'screeningDate': dateTime[0],
				'startTime': dateTime[1]
			},
			dataType : 'json',
			success : function(res) {
				alert("예매에 성공했습니다");
				location.href = "${pageContext.request.contextPath}/view/main.jsp";
			}
		});
	});
</script>