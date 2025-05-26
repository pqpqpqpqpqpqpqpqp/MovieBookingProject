<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/asset/css/ticket.css" />
</head>
<body>
	<jsp:include page="testReserve.jsp" />
	<jsp:include page="testReserveFoot.jsp" />
	
	<script src='${pageContext.request.contextPath}/asset/js/jquery-3.7.1.min.js'></script>
	<script src='${pageContext.request.contextPath}/view/ticket/test/testJS.js'></script>
</body>
</html>