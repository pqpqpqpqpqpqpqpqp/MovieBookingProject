<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="ticket_foot">
	<div class="foot first_container"><span class="select_before_txt">영화선택</span></div>
	<div class="line"></div>
	<div class="foot second_container"><span class="select_before_txt">극장선택</span></div>
	<div class="line"></div>
	<div class="foot third_container"><span class="select_before_txt">좌석선택</span></div>
	<div class="line"></div>
	<div class="foot forth_container"><span class="select_before_txt">결제선택</span></div>
	
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