<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="ticketBox_container">
	<div class="column movies" id="movieColumn">
		<div class="title">영화</div>
	</div>

	<div class="column theaters" id="theaterColumn">
		<div class="title">극장</div>
	</div>

	<!-- 날짜는 더미데이터상 정적으로 생성. 오늘 날짜로부터 2주정도 동적으로 생성하게 바꿀 것 -->
	<div class="column dates" id="dateColumn">
		<div class="title">날짜</div>
		<div class="date_list nano has-scroll-y" id="date_list">
			<div class="content scroll-y" tabindex="-1">
				<div class="date_month">
					<span class="year">2025</span> <span class="month">5</span>
				</div>
				<div class="date_container">
					<div class="date" data-date="2025-05-10">10 토</div>
					<div class="date" data-date="2025-05-11">11 일</div>
					<div class="date" data-date="2025-05-12">12 월</div>
				</div>
				<div class="pane pane-y"
					style="display: block; opacity: 1; visibility: visible;">
					<div class="slider slider-y" style="height: 50px; top: 0px;">
					</div>
				</div>
				<div class="pane pane-x"
					style="display: none; opacity: 1; visibility: invisible;">
					<div class="slider slider-x"
						style="width: 50px; overflow-x: hidden !important;"></div>
				</div>
			</div>
		</div>
	</div>

	<div class="column times" id="timeColumn">
		<div class="title">시간</div>
	</div>
</div>