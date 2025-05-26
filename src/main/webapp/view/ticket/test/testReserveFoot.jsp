<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<div class="ticket_foot">
		<a class="ticket_foot_btn_left previous_btn_movie" title="영화선택"></a>
			<!-- 이전 페이지로 돌아가는 버튼 -->
		<div class="foot first_container"></div>
		<div class="line"></div>
		<div class="foot second_container"></div>

		<div class="line"></div>
		<div class="foot seat_tab">
			<div class="title">
				<span>좌석명</span> <span>좌석번호</span>
			</div>
			<div class="context">
				<span class="input_text"> <!-- 좌석명 - 추후 결정 - 아마 좌석 div에 setAttribute로 값을 주고 받아올것 -->
				</span> <span class="input_text"> <!-- 좌석번호 - A1,A2 -->
				</span>
			</div>

		</div>
		<div class="line"></div>
		<div class="foot tax_tab">
			<div class="title">
				<span>일반</span> <span>총금액</span>
			</div>
			<div class="context tax">
				<div class="tax_counting">
					<span class="input_text"> <!-- 영화요금 - 상영정보에 있음 --></span> <span>원</span><span>X</span>
					<span> <!-- 를 인원수로 곱함 --></span>
				</div>
				<div class="tax_count_txt_container">
					<span class="input_text tax_count_txt"> <!-- 총금액 - 위의 값을 계산하여 삽입--></span>
					<span class="tax_count_txt">원</span>
				</div>
			</div>
		</div>
		<a class="ticket_foot_btn_right next_btn_seat_before" title="결제선택">다음단계로 이동</a>
		<!-- 전부 선택된게 아니면 넘어가지 말아야함 -->
	</div>
</body>
</html>