<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <meta charset="UTF-8">
  
<link rel="stylesheet"
		href="${pageContext.request.contextPath}/asset/css/mypage.css" />
  <title>취향 정보 활용 동의</title>

</head>
<body>
  <form>
    <table class="select_info">
      <tr>
        <th>동의 여부</th>
        <td><label><input type="checkbox" checked> 취향 정보 활용 동의</label></td>
      </tr>
      <tr>
        <th>주요 선호 요일</th>
        <td class="radio_container">
          <label><input type="radio" name="weekday"> 월</label>
          <label><input type="radio" name="weekday"> 화</label>
          <label><input type="radio" name="weekday"> 수</label>
          <label><input type="radio" name="weekday"> 목</label>
          <label><input type="radio" name="weekday"> 금</label>
        </td>
      </tr>
      <tr>
        <th>선호 시간대</th>
        <td class="radio_container">
          <label><input type="radio" name="time"> 모닝(7:00~9:30)</label>
          <label><input type="radio" name="time"> 오전(9:30~13:00)</label>
          <label><input type="radio" name="time"> 오후(13:00~18:00)</label>
          <label><input type="radio" name="time"> 저녁(18:00~20:00)</label>
          <label><input type="radio" name="time"> 심야(22:00 이후)</label>
        </td>
      </tr>
      
    </table>
    <div class="btn_group">
      <button class="btn_agree">동의하기</button>
    </div>
  </form>
