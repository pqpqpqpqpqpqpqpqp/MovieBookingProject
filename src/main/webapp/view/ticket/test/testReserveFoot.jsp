<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="ticket_foot">
	<div class="foot first_container">영화선택</div>
	<div class="line"></div>
	<div class="foot second_container">극장선택</div>

	<div class="line"></div>
	<!-- <div class="foot third_container">좌석선택</div> -->
	<div class="foot seat_tab">
		<div class="title">
			<span>좌석명</span> <span>좌석번호</span>
		</div>
		<div class="context">
			<span class="input_text"> <!-- 좌석명 - 특별석 뭐 그런거 - 추가하고싶다면 대충 값을 넣고 가져올것 - 일단은 전부 일반 --></span>
			<span class="input_text"> <!-- 좌석번호 - A1,A2 -->
			</span>
		</div>

	</div>
	<div class="line"></div>
	<div class="foot tax_tab">
		<!-- <div class="foot forth_container">극장선택</div> -->
		<div class="title">
			<span>일반</span> <span>총금액</span>
		</div>
		<div class="context tax">
			<div class="tax_counting">
				<span class="input_text"> <!-- 영화요금 - 상영정보에 있음 --></span> <span>원</span><span>X</span>
				<span> <!--인원수 --></span>
			</div>
			<div class="tax_count_txt_container">
				<span class="input_text tax_count_txt"> <!-- 총금액 - 위의 값을 계산하여 삽입--></span>
				<span class="tax_count_txt">원</span>
			</div>
		</div>
	</div>
	<a class="ticket_foot_btn_right next_btn_seat_before" title="영화선택이전"></a>
	<!-- 영화선택 페이지서 전부 선택되지 않았을때 보일 버튼 -->

	<a class="ticket_foot_btn_right next_btn_pay_before btn_hidden" title="좌석선택이전"></a>
	<!-- 좌석선택 페이지서 전부 선택되지 않았을때 보일 버튼 -->

	<a class="ticket_foot_btn_right next_btn_seat_end btn_hidden" title="영화선택완료"></a>
	<!-- 영화선택 페이지서 전부 선택되었을때 보일 버튼 -->
	
	<a class="ticket_foot_btn_right next_btn_pay_end btn_hidden" title="좌석선택완료"></a>
	<!-- 좌석선택 페이지서 전부 선택되었을때 보일 버튼 -->

	<a class="ticket_foot_btn_right next_btn_topay btn_hidden" title="결제하기"></a>
	<!-- 얘는 결제페이지에서 그냥 보임 -->

	<!-- 버튼이 눌리면 testReserve가 다른 페이지로 변경 -->
</div>
</body>
</html>