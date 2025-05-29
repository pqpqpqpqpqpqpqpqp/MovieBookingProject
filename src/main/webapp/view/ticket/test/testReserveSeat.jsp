<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page='testReserveSeatMenu.jsp' />
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
function renderSeats(spe) {
	const seatcon = document.createElement('div');
	let html = "";

	if (spe === '(PRIVATE_BOX)') {
		html = `
			<div class="seatArray A">
				<a class="seat_num">A</a>
				<a class="seat" id="a1">1</a>
				<a class="seat hidden"></a>
				<a class="seat" id="a2">2</a>
				<a class="seat" id="a3">3</a> 
				<a class="seat hidden"></a>
				<a class="seat" id="a4">4</a>
			</div>
			<div class="seatArray B">
				<a class="seat_num">B</a>
				<a class="seat" id="b1">1</a>
				<a class="seat hidden"></a>
				<a class="seat" id="b2">2</a>
				<a class="seat" id="b3">3</a>
				<a class="seat hidden"></a>
				<a class="seat" id="b4">4</a>
			</div>`;
	} else if (spe === '(SUITE_SINEMA)') {
		html = `
			<div class="seatArray A">
				<a class="seat_num">A</a>
				<a class="seat" id="a1">1</a>
				<a class="seat" id="a2">2</a>
				<a class="seat hidden"></a>
				<a class="seat" id="a3">3</a> 
				<a class="seat" id="a4">4</a>
				<a class="seat" id="a5">5</a> 
				<a class="seat hidden"></a>
				<a class="seat" id="a6">6</a>
				<a class="seat" id="a7">7</a>
			</div>
			<div class="seatArray B">
				<a class="seat_num">B</a>
				<a class="seat" id="b1">1</a>
				<a class="seat" id="b2">2</a>
				<a class="seat hidden"></a>
				<a class="seat" id="b3">3</a> 
				<a class="seat" id="b4">4</a>
				<a class="seat" id="b5">5</a> 
				<a class="seat hidden"></a>
				<a class="seat" id="b6">6</a>
				<a class="seat" id="b7">7</a>
			</div>`;
	} else if (spe === '(NOMAL)') {
		html = `
			<div class="seatArray A">
				<a class="seat_num">A</a>
				<a class="seat" id="a1">1</a>
				<a class="seat" id="a2">2</a>
				<a class="seat hidden"></a>
				<a class="seat" id="a3">3</a> 
				<a class="seat" id="a4">4</a>
				<a class="seat hidden"></a>
				<a class="seat" id="a5">5</a> 
				<a class="seat" id="a6">6</a>
			</div>
			<div class="seatArray B">
				<a class="seat_num">B</a>
				<a class="seat" id="b1">1</a>
				<a class="seat" id="b2">2</a>
				<a class="seat hidden"></a>
				<a class="seat" id="b3">3</a> 
				<a class="seat" id="b4">4</a>
				<a class="seat hidden"></a>
				<a class="seat" id="b5">5</a> 
				<a class="seat" id="b6">6</a>
			</div>`;
	}

	seatcon.innerHTML = html;
	document.querySelector(".seat_content").appendChild(seatcon);
}

function parseInputText() {
	const inputs = document.querySelectorAll('.input_text');
	const cgvLoca = inputs[0].textContent.split(" ");
	const datetime = inputs[1].textContent.split(" ");
	
	return {
		inputs,
		cgvLoca,
		datetime
	}
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
			console.log(res);
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
		"<span>" + inputs[2].textContent + " " + spe + "</span>";
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

     		if (resetContainer) {
        		const resetSelected = resetContainer.querySelector(".person_box.selected");
        		if (resetSelected) resetSelected.classList.remove("selected");
        		resetContainer.querySelector(".person_box").classList.add("selected")
      		}
    	}
  	});
}

const spe = "<%=spe%>";

renderSeats(spe);
checkReservedSeats();
setTimeInfo();
setTheaterInfo(spe);
setupToggle(".age_category_box.nomal", ".age_category_box.teen");
setupToggle(".age_category_box.teen", ".age_category_box.nomal");

// 대충 예매정보 테이블을 확인해서 seat에 reserved 클래스를 추가할 ajax.get - 쉽지만 귀찮음

// 대충 인원수만큼 좌석 선택(클릭해서 선택)
// 클릭 이벤트는 그대로 두고 딱 인원수만큼만 좌석 선택해야만 진행(아마 가장 간단한 방법)

// db에 예매 등록은 여기말고 결제 페이지서.

</script>