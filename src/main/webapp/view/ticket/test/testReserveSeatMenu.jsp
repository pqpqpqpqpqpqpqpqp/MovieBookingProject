<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="seat_menu_container">
	<div class="seat_menu_title">
		<span class="title_txt">인원 / 좌석</span> <a class="refresh_wrap"
			id="btnRefresh" href="#"><span class="refreshBtn">다시하기</span><span
			class="icon_refresh"></span></a>
	</div>

	<div class="seat_menu_header">
		<div class="menu seat_people_container">
			<div class="person_count">
				<div id="maximum_people"
					style="margin-top: 10px; padding-bottom: 5px; text-align: right; padding-right: 10px; font-size: 11px !important; color: red;">*
					최대 8명 선택 가능</div>
				<div class="age_category_box nomal">
					<span class="title">일반</span>
					<div class="person_box selected" id="nomal0">
						<a href="#" onclick="return false;">0</a>
					</div>
					<div class="person_box" id="nomal1">
						<a href="#" onclick="return false;">1</a>
					</div>
					<div class="person_box" id="nomal2">
						<a href="#" onclick="return false;">2</a>
					</div>
					<div class="person_box" id="nomal3">
						<a href="#" onclick="return false;">3</a>
					</div>
					<div class="person_box" id="nomal4">
						<a href="#" onclick="return false;">4</a>
					</div>
					<div class="person_box" id="nomal5">
						<a href="#" onclick="return false;">5</a>
					</div>
					<div class="person_box" id="nomal6">
						<a href="#" onclick="return false;">6</a>
					</div>
					<div class="person_box" id="nomal7">
						<a href="#" onclick="return false;">7</a>
					</div>
					<div class="person_box" id="nomal8">
						<a href="#" onclick="return false;">8</a>
					</div>
				</div>
				<div class="age_category_box teen">
					<span class="title">청소년</span>
					<div class="person_box selected" id="teen0">
						<a href="#" onclick="return false;">0</a>
					</div>
					<div class="person_box" id="teen1">
						<a href="#" onclick="return false;">1</a>
					</div>
					<div class="person_box" id="teen2">
						<a href="#" onclick="return false;">2</a>
					</div>
					<div class="person_box" id="teen3">
						<a href="#" onclick="return false;">3</a>
					</div>
					<div class="person_box" id="teen4">
						<a href="#" onclick="return false;">4</a>
					</div>
					<div class="person_box" id="teen5">
						<a href="#" onclick="return false;">5</a>
					</div>
					<div class="person_box" id="teen6">
						<a href="#" onclick="return false;">6</a>
					</div>
					<div class="person_box" id="teen7">
						<a href="#" onclick="return false;">7</a>
					</div>
					<div class="person_box" id="teen8">
						<a href="#" onclick="return false;">8</a>
					</div>
				</div>
			</div>
		</div>
		<div class="menu movie_info">
			<div class="theater_seat_info"></div>
			<p class="theater_time_info"></p>
		</div>
	</div>
</div>