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
// ================================
// 좌석 렌더링
// ================================
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

function checkReservedSeats(theaterId, date, startTime) {
	$.ajax({
		url: '${pageContext.request.contextPath}/testReserve.tiw',
		type: 'POST',
		data: {
			'theaterId': theaterId,
			'date': date,
			'startTime': startTime
		},
		dataType: 'json',
		success: function(response) {
			const reservedList = response.reservedSeats;
		}
	});
}

// ================================
// 상영 시간 표시
// ================================
function setTimeInfo() {
	const inputs = document.querySelectorAll('.input_text');
	const datetime = inputs[1].textContent.split(" ");

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

// ================================
// 영화관 정보 표시
// ================================
function setTheaterInfo(spe) {
	const inputs = document.querySelectorAll('.input_text');

	document.querySelector('.theater_seat_info').innerHTML = 
		"<span>" + inputs[0].textContent + " </span>" +
		"<span>" + inputs[2].textContent + " " + spe + "</span>";
}

// ================================
// 인원 수 선택 토글
// ================================
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
checkReservedSeats(theaterId, date, startTime);
setTimeInfo();
setTheaterInfo(spe);
setupToggle(".age_category_box.nomal", ".age_category_box.teen");
setupToggle(".age_category_box.teen", ".age_category_box.nomal");

// 대충 예매정보 테이블을 확인해서 seat에 reserved 클래스를 추가할 ajax.get - 쉽지만 귀찮음
// 이거 확인할때 남은 좌석도 확인해야할듯? 극장에 정해진 좌석 - 예매된 좌석 - 극장 idx가 있나? 아무튼 있는 값들로 검색 ㄱㄱ

// 대충 인원수만큼 좌석 선택(클릭해서 선택) - 개어려움
// 인원수만큼 클릭하면 다 비활성화? ride on eva, shinji
// 클릭 이벤트는 그대로 두고 딱 인원수만큼만 좌석 선택해야만 진행 ( 차악정도 )
// 중복 예매는 어떻게 막는가? 답없음 - 누르자마자 db 등록? 취소하면 바로 삭제? - 미친소리
		
// 다시하기 버튼 - 인원수, 좌석 관련값(선택한 인원, 선택한 좌석, 관련 footer값) 초기화 시켜야함

// 영화 시작시간 - 상영시간
// 시작시간은 받음 - 영화 테이블(name으로 검색)에 아마 러닝타임 있음 - 이걸로 계산해서 보여주기

// 위의 기능들을 최대한 db를 쓰지 않고 하기
// 써야한다면 제일 첫 페이지에 한번에 해놓고 
</script>