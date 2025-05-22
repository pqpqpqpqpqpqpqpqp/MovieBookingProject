<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/ticket.css" />

<div class="ticket_container">
<div class="ticket_navi">
				
				<span class="right">
					<a class="button button-schedule" href="#" style=" background-image: url('<%=request.getContextPath()%>/asset/icon/ticketting/ticketSeletBut.png');"
					
					 onmousedown="javascript:logClick('옵션/상영시간표');" onclick="openSchedulePopup();return false;" title="새창열기"><span></span></a>
					<a class="button button-reservation-restart" href="#"   style="  background-image: url('<%= request.getContextPath() %>/asset/icon/ticketting/ticketSeletBut.png');"
					
					onmousedown="javascript:logClick('옵션/예매다시하기');" onclick="ticketRestart(); return false;"><span></span></a>
				</span>
				</div>
			</div>
