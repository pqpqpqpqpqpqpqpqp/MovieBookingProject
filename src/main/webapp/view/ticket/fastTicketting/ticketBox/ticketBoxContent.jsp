<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet"
	href="${pageContext.request.contextPath}/asset/css/ticket.css" />



<body>
<div class="ticketBox_container">
  <div class="column movies">
    <div class="title">영화</div>
    <div class="movie"><span class="label green">ALL</span>예시 영화</div>
  </div>

  <div class="column theaters">
    <div class="title">극장</div>
    <div class="region select">용산 아이파크몰</div>
    <div class="region ">강남</div>
  </div>

  <div class="column dates">
    <div class="title">날짜</div>
    <div class="date_list nano has-scroll-y" id="date_list">
		<div class="content scroll-y" tabindex="-1">
	    	<div class="date_month">
	    		<span class="year">2025</span>
	    		<span class="month">5</span>
		    </div>
		    <div class="date">
		    	<span class="weekday">화</span>
		    	<span class="day">20</span>
		    </div>
		     <div class="date select">
		    	<span class="weekday ">수</span>
		    	<span class="day">21</span>
		    </div>
		     <div class="date">
		    	<span class="weekday">목</span>
		    	<span class="day">22</span>
		    </div>
		    
		    <div class="pane pane-y" style="display: block; opacity: 1; visibility: visible;">
				<div class="slider slider-y" style="height: 50px; top: 0px;">
				</div>
			</div>
			<div class="pane pane-x" style="display: none; opacity: 1; visibility: invisible;">
				<div class="slider slider-x" style="width: 50px;  overflow-x: hidden !important;">
				</div>
			</div>
	    </div>
    </div>
      </div>

  <div class="column times">
    <div class="title">시간</div>
    <div class="time_slot">
      <strong><span class="theater_type">2D(자막)</span> 1관(Laser)</strong>      
      <div class="time_container">    
       <div class="time_block">   
      <div class="theater_time">11:00</div>
      <div class="left_seat">100석</div>
      </div>
         <div class="time_block">  
      <div class="theater_time">14:00</div>
      <div class="left_seat">80석</div>
         </div>
         <div class="time_block">  
      <div class="theater_time">17:00</div>
      <div class="left_seat">6석</div>
      </div>
      </div>     
    </div>
  </div>
</div>
</body>
</html>

