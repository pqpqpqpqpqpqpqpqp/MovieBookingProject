<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>222</title>

  <link rel="stylesheet"
	href="${pageContext.request.contextPath}/asset/css/ticketSeat.css" />
<jsp:include page="../../../common/header.jsp"/>
</head>
<body> 
<jsp:include page="../ticketBox/ticketTitle.jsp"></jsp:include>
<jsp:include page="seatMenu.jsp"></jsp:include>
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
<jsp:include page="../ticketBox/ticketFooter.jsp"/>
</body>
<footer>
<jsp:include page="../../../common/footer.jsp"/>
</footer>
</html>