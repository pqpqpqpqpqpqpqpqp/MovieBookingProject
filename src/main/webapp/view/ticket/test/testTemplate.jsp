<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/asset/css/ticket.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/asset/css/ticketSeat.css" />
</head>
<body>
<jsp:include page="../../common/header.jsp"/>
	<div class="ticket_bodyContainer">
		<jsp:include page="testReserveMovie.jsp" />
	</div>
	<jsp:include page="testReserveFoot.jsp" />
	<footer>
<jsp:include page="../../common/footer.jsp"/>
</footer>
</body>
</html>