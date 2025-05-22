<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet"
	href="${pageContext.request.contextPath}/asset/css/ticket.css" />
	
	 
<meta charset="UTF-8">
<title>Insert title here</title>

<jsp:include page="/view/common/header.jsp"/>
</head>
<body>
<div class="main_ticket_container">
<jsp:include page="fastTicketting/ticketBox.jsp"></jsp:include>
</div>
<footer>
<jsp:include page="/view/common/footer.jsp"/>
</footer>
</body>
</html>