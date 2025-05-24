<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <link rel="stylesheet"
	href="${pageContext.request.contextPath}/asset/css/ticket.css" />


	<div class="ticket_foot">	
		<a class="ticket_foot_btn_left previous_btn_movie" href="#" onclick="OnTnbLeftClick(); return false;" title="영화선택"></a>
		<div class="foot movie">
			<div class="movie_img"><img alt="" src="<%= request.getContextPath() %>/asset/img/movie/movieposter/Avatar.jpeg"></div>
			<div class="context">
				<span class="title">아바타2</span>
				<span><img src="${pageContext.request.contextPath}/asset/icon/movieAge/age15.svg"/></span>
				<div>평점 </div>		
			</div>
			<div class="line"></div>
		</div>
	<div class="foot theater_tab">
		<div class="title">
			<span>극장</span>
			<span>일시</span>
			<span>상영관</span>
			<span>인원</span>
		</div>
		<div class="context">
			<span class="input_text"> CGV 용산아이파크몰</span>
			<span class="input_text"> 2025.5.25(일)12:30</span>
			<span class="input_text"> 4관</span>
			<span class="input_text"> 2명</span>
		</div>	
	</div>
	<div class="line"></div>
	<div class="foot seat_tab">
		<div class="title">
			<span>좌석명</span>
			<span>좌석번호</span>
		</div>
		<div class="context">
			<span class="input_text">SWEETBOX</span>
			<span class="input_text"> A1,A2</span>
		</div>
			
	</div>
	<div class="line"></div>
	<div class="foot tax_tab">
		<div class="title">
			<span>일반</span>
			<span>총금액</span>
		</div>
		<div class="context tax">
			<div class="tax_counting">
				<span class="input_text">17,000</span><span>원</span><span>X</span><span>2</span>
			</div>
			<div class="tax_count_txt_container">
			<span class="input_text tax_count_txt"> 34,000</span><span class="tax_count_txt">원</span>
			</div>
		</div>			
	</div>	
		<a class="ticket_foot_btn_right next_btn_topay" style=""	
		    	 href="#" onclick="OnTnbLeftClick(); return false;" title="영화선택">다음단계로 이동</a>	
	</div>