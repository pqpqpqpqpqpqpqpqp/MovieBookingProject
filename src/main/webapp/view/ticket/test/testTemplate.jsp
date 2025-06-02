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
	<jsp:include page="/view/common/header.jsp" />
	<div class="bodyContainer">
		<jsp:include page="/view/ticket/test/testReserveMovie.jsp" />
	</div>
	<jsp:include page="/view/ticket/test/testReserveFoot.jsp" />
	<jsp:include page="/view/common/footer.jsp" />
</body>
</html>