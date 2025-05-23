<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <meta charset="UTF-8">
  <title>CGV 관람권 관리</title>
   <link rel="stylesheet"
		href="${pageContext.request.contextPath}/asset/css/mypage.css" />

<div class="my_ticket_page_container">
  <h2>관람권/할인쿠폰 관리</h2>
    <button class="register-btn">CGV 영화관람권 등록</button>
    <h4>CGV 영화관람권 보유(등록) 내역</h4>

  <div class="ticket_section">
    <table>
      <thead>
        <tr>
          <th>관람권(번호)</th>
          <th>분류</th>
          <th>유효기간</th>
          <th>설명</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td colspan="4" class="no-data">CGV 영화관람권 보유(등록)내역이 존재하지 않습니다.</td>
        </tr>
      </tbody>
    </table>
  </div>

  <div class="ticket_section">
    <h4>CGV 영화관람권 사용내역</h4>
	<div class="filter_box_container">
	<div class="filter_inbox">
	<strong class="view_txt">조회기간</strong>
	<div class="filter_container">
	    <div class="filter-box">
	      <div class="date-range-buttons">
	        <button>2주일</button>
	        <button>1개월</button>
	        <button>3개월</button>
	      </div>
	      <span>3개월 이전의 내역은 자동 삭제됩니다.</span>
	    	</div>
		    <div class="filter-box">
		      <input type="date" value="2025-04-23">
		      ~
		      <input type="date" value="2025-05-23">
		      <button class="view_btn">조회하기</button>
		    </div>
	    </div>
    </div>
</div>
    <table>
      <thead>
        <tr>
          <th>관람권 이름</th>
          <th>영화관람권 번호</th>
          <th>분류</th>
          <th>기타</th>
          <th>상태</th>
          <th>사용일</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td colspan="6" class="no-data">CGV 영화관람권 사용내역이 존재하지 않습니다.</td>
        </tr>
      </tbody>
    </table>
  </div>
</div>
