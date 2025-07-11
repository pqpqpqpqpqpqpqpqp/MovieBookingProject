<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="seat_menu_container">
	<div class="seat_menu_title">
		<span class="title_txt">인원 / 좌석</span>
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

<div class="seat_container">
	<div class="seat_content">
		<div class="scrren_seat"
			style="background:url('${pageContext.request.contextPath}/asset/icon/ticketting/screenBoard.png');">
			<span>SCREEN</span>
		</div>
	</div>
	<div class="seat_index">
		<a class="wideBtn"
			style="background:url('${pageContext.request.contextPath}/asset/icon/ticketting/btnZoom.png');"></a>
		<div class="seat_icon_list">
			<div class="icon_line">
				<div class="icon selected"
					style="background:url('${pageContext.request.contextPath}/asset/icon/ticketting/seatIcon.png');"></div>
				<div class="icon_content">선택</div>
			</div>
			<div class="icon_line">
				<div class="icon reserved"></div>
				<div class="icon_content">예매완료</div>
			</div>
			<div class="icon_line">
				<div class="icon notavail"></div>
				<div class="icon_content">선택불가</div>
			</div>
		</div>
	</div>
</div>
<%
String spe = request.getParameter("spe");
%>

<script>
let maxSeat = 0;
let remainSeat = 0;
let selNum = 0;
let movieCost = 0;

function renderSeats(spe) {
	const seatcon = document.createElement('div');
	let html = "";

	if (spe === '(PRIVATE_BOX)') {
		maxSeat = 16;
		movieCost = 25000;
		html = `
			<div class="seatArray A">
				<a class="seat_num">A</a>
				<a class="seat" id="A1">1</a>
				<a class="seat" id="A2">2</a>
				<a class="seat hidden"></a>
				<a class="seat" id="A3">3</a> 
				<a class="seat" id="A4">4</a>
				<a class="seat" id="A5">5</a>
				<a class="seat" id="A6">6</a>
				<a class="seat hidden"></a>
				<a class="seat" id="A7">7</a> 
				<a class="seat" id="A8">8</a>
			</div>
			<div class="seatArray B">
				<a class="seat_num">B</a>
				<a class="seat" id="B1">1</a>
				<a class="seat" id="B2">2</a>
				<a class="seat hidden"></a>
				<a class="seat" id="B3">3</a>
				<a class="seat" id="B4">4</a>
				<a class="seat" id="B5">5</a>
				<a class="seat" id="B6">6</a>
				<a class="seat hidden"></a>
				<a class="seat" id="B7">7</a>
				<a class="seat" id="B8">8</a>
			</div>`;
	} else if (spe === '(SUITE_SINEMA)') {
		maxSeat = 14;
		movieCost = 20000;
		html = `
			<div class="seatArray A">
				<a class="seat_num">A</a>
				<a class="seat" id="A1">1</a>
				<a class="seat" id="A2">2</a>
				<a class="seat hidden"></a>
				<a class="seat" id="A3">3</a> 
				<a class="seat" id="A4">4</a>
				<a class="seat" id="A5">5</a> 
				<a class="seat hidden"></a>
				<a class="seat" id="A6">6</a>
				<a class="seat" id="A7">7</a>
			</div>
			<div class="seatArray B">
				<a class="seat_num">B</a>
				<a class="seat" id="B1">1</a>
				<a class="seat" id="B2">2</a>
				<a class="seat hidden"></a>
				<a class="seat" id="B3">3</a> 
				<a class="seat" id="B4">4</a>
				<a class="seat" id="B5">5</a> 
				<a class="seat hidden"></a>
				<a class="seat" id="B6">6</a>
				<a class="seat" id="B7">7</a>
			</div>`;
	} else if (spe === '(NOMAL)') {
		maxSeat = 12;
		movieCost = 12000;
		html = `
			<div class="seatArray A">
				<a class="seat_num">A</a>
				<a class="seat" id="A1">1</a>
				<a class="seat" id="A2">2</a>
				<a class="seat hidden"></a>
				<a class="seat" id="A3">3</a> 
				<a class="seat" id="A4">4</a>
				<a class="seat hidden"></a>
				<a class="seat" id="A5">5</a> 
				<a class="seat" id="A6">6</a>
			</div>
			<div class="seatArray B">
				<a class="seat_num">B</a>
				<a class="seat" id="B1">1</a>
				<a class="seat" id="B2">2</a>
				<a class="seat hidden"></a>
				<a class="seat" id="B3">3</a> 
				<a class="seat" id="B4">4</a>
				<a class="seat hidden"></a>
				<a class="seat" id="B5">5</a> 
				<a class="seat" id="B6">6</a>
			</div>`;
	}

	seatcon.innerHTML = html;
	document.querySelector(".seat_content").appendChild(seatcon);
}

function parseInputText() {
	const inputs = document.querySelectorAll('.input_text');
	const cgvLoca = inputs[0].textContent.split(" ");
	const datetime = inputs[1].textContent.split(" ");

	return { inputs, cgvLoca, datetime }
}

function checkReservedSeats() {
	const { inputs, cgvLoca, datetime } = parseInputText();

	const movieName = document.querySelector(".foot.first_container .title").textContent;

	$.ajax({
		url: '${pageContext.request.contextPath}/ReserveSeatCheck.tiw',
		type: 'POST',
		data: {
			'movieName': movieName,
			'cinemaName': inputs[2].textContent,
			'theaterName': cgvLoca[1],
			'date': datetime[0],
			'startTime': datetime[1]
		},
		dataType: 'json',
		success: function(res) {
			res.forEach(re => {
				const el = document.querySelector('#' + re);
				if(el) { el.classList.add("reserved"); }
				
			});
			remainSeat = maxSeat - res.length;
			setTheaterInfo(spe);
		}
	});
}

function setTimeInfo() {
	const { datetime } = parseInputText();

	const date = new Date(datetime[0]);
	const day = date.getDay();
	const weekdays = ["일", "월", "화", "수", "목", "금", "토"];

	const time = datetime[1].split(":");
	const h = parseInt(time[0]) + 2;
	const endtime = h + ':00';

	document.querySelector(".theater_time_info").innerHTML =
		'<strong style="font-size: 20px;"><span id="date">' + datetime[0] + '</span>' +
		'(<span id="weedday" style="font-family: Helvetica Neue, Helvetica, Arial, sans-serif;">' + weekdays[day] + '</span>) ' +
		'<span id="movieStartTime">' + datetime[1] +'</span> ~ <span id="movieEndTime">' + endtime + '</span></strong>';
}

function setTheaterInfo(spe) {
	const { inputs } = parseInputText();

	document.querySelector('.theater_seat_info').innerHTML =
		"<span>" + inputs[0].textContent + "</span>" + "<span>  |  </span>" +
		"<span>" + inputs[2].textContent + " " + spe + "</span>"  + "<span>  |  </span>" +
		"<span>남은 좌석: " + remainSeat + "/" + maxSeat + "</span>";
}

function updateSeatList() {
	const selectedSeats = document.querySelectorAll('.seat.selected');
	const seatNames = Array.from(selectedSeats).map(seat => seat.id).join(', ');

	document.querySelector(".foot.third_container").innerHTML =
		'<div class="foot seat_tab">' +
			'<div class="title">' +
				'<span>좌석명</span> <span>좌석번호</span>' +
			'</div>' +
			'<div class="context">' +
				'<span class="input_text">일반석</span>' +
				'<span class="input_text seat_name">' + seatNames + '</span>' +
			'</div>' +
		'</div>';

	if (selectedSeats.length >= selNum){
		document.querySelector(".next_btn_pay_before").classList.add("btn_hidden");
		document.querySelector(".next_btn_pay_end").classList.remove("btn_hidden");
	} else {
		document.querySelector(".next_btn_pay_end").classList.add("btn_hidden");
		document.querySelector(".next_btn_pay_before").classList.remove("btn_hidden");
	}
}

function updateTaxTab(movieCost, selNum) {
	document.querySelector(".foot.forth_container").innerHTML =
		'<div class="foot tax_tab">' +
			'<div class="title">' +
				'<span>일반</span> <span>총금액</span>' +
			'</div>' +
			'<div class="context tax">' +
				'<div class="tax_counting">' +
					'<span class="input_text">' + movieCost + '</span>' +
					'<span>원</span>' +
					'<span>X</span>' +
					'<span>' + selNum + '</span>' +
				'</div>' +
				'<div class="tax_count_txt_container">' +
					'<span class="input_text tax_count_txt">' + (movieCost * selNum) + '</span>' +
					'<span class="tax_count_txt">원</span>' +
				'</div>' +
			'</div>' +
		'</div>';
}

function setupToggle(groupSelector, resetSelector) {
	const container = document.querySelector(groupSelector);
	const resetContainer = document.querySelector(resetSelector);

	container.addEventListener("click", function (e) {
		const target = e.target.closest(".person_box");
		if (!target) return;

		const current = container.querySelector(".person_box.selected");
		if (current !== target) {
			if (current) current.classList.remove("selected");
			target.classList.add("selected");

			const inputTexts = document.querySelectorAll(".input_text");
			inputTexts[3].textContent = target.querySelector("a").textContent;
			selNum = target.querySelector("a").textContent;

			if (resetContainer) {
				const resetSelected = resetContainer.querySelector(".person_box.selected");
				if (resetSelected) resetSelected.classList.remove("selected");
				resetContainer.querySelector(".person_box").classList.add("selected")
			}
		}

		document.querySelectorAll('.seat.selected').forEach(seat => {
			seat.classList.remove('selected');
		});

		updateSeatList();
		updateTaxTab(movieCost, selNum);
	});
}

function selectSeat() {
	const seats = document.querySelectorAll('.seat');

	seats.forEach(seat => {
		if (seat.classList.contains('hidden') || seat.classList.contains('reserved')) return;

		seat.addEventListener('click', function () {
			const seatId = seat.id;

			if (seat.classList.contains('selected')) {
				seat.classList.remove('selected');
			} else {
				const selectedSeats = document.querySelectorAll('.seat.selected');

				if (selectedSeats.length >= selNum) {
					return;
				}

				seat.classList.add('selected');
			}
			updateSeatList();
		});
	});
}

$('.next_btn_pay_end').on('click', function(e) {
	$('.bodyContainer').load('${pageContext.request.contextPath}/view/ticket/test/testReservePay.jsp', function (response, status, xhr) {
		document.querySelector(".next_btn_pay_end").classList.add("btn_hidden");
		document.querySelector(".next_btn_topay").classList.remove("btn_hidden");
		
        if (status === 'error') {
        	console.error('Error loading JSP:', xhr.status, xhr.statusText);
        }
    });
});

const spe = "<%=spe%>";

renderSeats(spe);
checkReservedSeats();
// setTheaterInfo는 남는 좌석 표시 문제로 checkReservedSeats 내부에서 실행;
setTimeInfo();
setupToggle(".age_category_box.nomal", ".age_category_box.teen");
setupToggle(".age_category_box.teen", ".age_category_box.nomal");
selectSeat();
</script>