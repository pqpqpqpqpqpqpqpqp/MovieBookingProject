<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page='testReserveSeatMenu.jsp' />
<div class="seat_container">
	<div class="seat_content">
	<div class="scrren_seat" style="background:url('${pageContext.request.contextPath}/asset/icon/ticketting/screenBoard.png');"><span>SCREEN</span></div>
		<div class="seatArray A">
			<a class="seat_num">A</a>
			<a class="seat reserved" id="a1">1</a>
			<a class="seat" id="a2">2</a>
			<a class="seat hidden" ></a>
			<a class="seat"id="a3">3</a> 
			<a class="seat"id="a4">4</a>
			<a class="seat hidden"></a>
			<a class="seat"id="a5">5</a> 
			<a class="seat"id="a6">6</a>
		</div>
			<div class="seatArray B">
			<a class="seat_num">B</a>
			<a class="seat" id="b1">1</a>
			<a class="seat" id="b2">2</a>
			<a class="seat hidden" ></a>
			<a class="seat"id="b3">3</a> 
			<a class="seat"id="b4">4</a>
			<a class="seat hidden"></a>
			<a class="seat"id="b5">5</a> 
			<a class="seat"id="b6">6</a>
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
            
            $(".previous_btn_movie").classList.add("btn_hidden");
        	$(".next_btn_pay_before").classList.add("btn_hidden");
        	$(".next_btn_seat_before").classList.remove("btn_hidden");
        }
    });
});
</script>