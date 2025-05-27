<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page='testReserveSeatMenu.jsp' />
<div class="seat_container">
	<div class="seat_content">
	<div class="scrren_seat" style="background:url('${pageContext.request.contextPath}/asset/icon/ticketting/screenBoard.png');"><span>SCREEN</span></div>
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
			<a class="seat_num ">B</a>
			<a class="seat" id="b1">1</a>
			<a class="seat hidden"></a>
			<a class="seat" id="b2">2</a>
			<a class="seat" id="b3">3</a>
			<a class="seat hidden"></a>
			<a class="seat" id="b4">4</a>
		</div>
	</div>
	<div class="seat_index">
		<a class="wideBtn" style="background:url('${pageContext.request.contextPath}/asset/icon/ticketting/btnZoom.png');"></a>
		<div class="seat_icon_list">
		<div class="icon_line">
		<div class="icon selected" style="background:url('${pageContext.request.contextPath}/asset/icon/ticketting/seatIcon.png');"></div>
		<div class="icon_content">선택</div>
		</div>	
		<div class="icon_line">
		<div class="icon reserved"></div>
		<div class="icon_content">예매완료</div>
		</div>	
		<div class="icon_line">
		<div class="icon notavail" ></div>
		<div class="icon_content">선택불가</div>
		</div>
	</div>
	</div>
</div>

<script>
$('.previous_btn_movie').off('click').on('click', function () {
    const previousJsp = 'testReserveMovie.jsp';

    $('.bodyContainer').load(previousJsp, function (response, status, xhr) {
        if (status === 'error') {
            console.error('이전 JSP 로딩 실패:', xhr.status, xhr.statusText);
        } else {
            console.log('이전 JSP 로딩 성공');
            
            document.querySelector(".foot.first_container").innerHTML = "영화선택";
            document.querySelector(".foot.second_container").innerHTML = "극장선택";
            document.querySelector(".theater_time_info").innerHTML = " ";
            document.querySelector('.theater_seat_info').innerHTML = " ";
            
            document.querySelector(".next_btn_pay_before").classList.add("btn_hidden");
            document.querySelector(".previous_btn_movie").classList.add("btn_hidden");
            document.querySelector(".next_btn_seat_before").classList.remove("btn_hidden");	
        }
    });
});

const inputs = document.querySelectorAll('.input_text');

const datetime = inputs[1].textContent.split(" ");

const date = new Date(datetime[0]);
const day = date.getDay();
const weekdays = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];

const time = datetime[1].split(":");
const h = parseInt(time[0]) + 2;
const endtime = h + ':00'; 

document.querySelector(".theater_time_info").innerHTML = 
	'<strong style="font-size: 20px;"><span id="date">' + datetime[0] + '</span>' +
	'(<span id="weedday" style="font-family: Helvetica Neue, Helvetica, Arial, sans-serif;">' + weekdays[day] + '</span>) ' +
	'<span id="movieStartTime">' + datetime[1] +'</span> ~ <span id="movieEndTime">' + endtime + '</span></strong>';

document.querySelector('.theater_seat_info').innerHTML = 
	"<span>" + inputs[0].textContent + " </span>" +
	"<span>" + inputs[2].textContent + "</span>";

// 지금은 페이지가 3개인데 이거 1개로 줄이고 좌석수에 따라 동적으로 만들어야하는데...
// 원래는 3개의 다른 페이지로 넘어왔으나 그렇게 하면 하나의 페이지로 가게됨
// parameter넘겨서 대충 하면 됨 - 난이도 낮음 - 난이도는 쉬운데 너무 귀찮다

// 대충 예매정보 테이블을 확인해서 seat에 reserved 클래스를 추가할 ajax.get - 쉽지만 귀찮음
// 이거 확인할때 남은 좌석도 확인해야할듯? 극장에 정해진 좌석 - 예매된 좌석 - 극장 idx가 있나? 아무튼 있는 값들로 검색 ㄱㄱ

// 대충 인원수 선택할 이벤트 - footer에 값도 넣어야함 - 쉬움

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