<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <link rel="stylesheet"
	href="${pageContext.request.contextPath}/asset/css/ticket.css" />


<div class="ticket_main_box_container">
<jsp:include page="ticketBox/ticketTitle.jsp"></jsp:include>
<jsp:include page="ticketBox/ticketBoxContent.jsp"></jsp:include>
<jsp:include page="ticketBox/ticketFooter.jsp"></jsp:include>
</div>
