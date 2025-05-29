<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>극장 페이지</title>
<style>
body {
  margin: 0;
  padding: 0;
  font-family: 'Noto Sans KR', sans-serif;
}

.cgv-theater-container {
  width: 100%;
  max-width: 980px;
  margin: 60px auto;
  text-align: center;
}

.theater-line {
  position: relative;
  width: 100%;
  height: 6px; /* 2줄 합친 높이 */
  margin-bottom: -6px; /* 이미지와 겹치게 밀어넣음 */
border-top: 2px solid black;
border-bottom: 4px solid black;
    transform: translateY(-44px);
  z-index: 1;
}

.theater-title {
  position: relative;
  z-index: 2; /* 이미지가 위로 올라옴 */
  display: block;
  width: 100%;
  text-align: center;
  padding-bottom: 40px;
}

.theater-title img {
  position: relative;
  z-index: 2; /* 실선 위에 이미지가 보이게 */
  display: inline-block;
}

.branch-info {
  margin-bottom: 80px; /* 지점 간 공백 */
}

.branch-name {
  font-size: 28px;
  font-weight: bold;
  color: #333;
  margin-bottom: 20px;
  text-align: left;
}

.branch-content {
  position: relative;
  width: 980px;
  height: 420px;
  margin: 0 auto; /* 가운데 정렬 */
  overflow: hidden;
}

.branch-image img {
  width: 100%;
  height: 100%;
  border: none;
  box-shadow: 0 4px 8px rgba(0,0,0,0.1);
  display: block;
}

.branch-description {
  position: absolute;
  
  width: 100%;
    
  top: calc(420px * 2 / 3); /* 이미지 하단 기준 1/3 지점 */
  bottom: 0;
  left: 0;

  background-color: rgba(0, 0, 0, 0.85);
  padding: 12px 16px;
  font-size: 16px;
  color: #fff;
  line-height: 1.6;
  text-align: left;
}

.branch-description p {
	padding-top: 30px;
}

</style>
</head>
<body>
<div class="cgv-theater-container">
	<div class="theater-title">
  		<img src="https://img.cgv.co.kr/R2014/images/title/h3_theater.gif" alt="THEATER">
	</div>
  <div class="theater-line"></div>

  <div class="branch-info">
    <h3 class="branch-name">CGV강남</h3>
    <div class="branch-content">
      <div class="branch-image">
        <img src="https://img.cgv.co.kr/Theater/Theater/2024/1231/17356319393670.jpg" alt="CGV 강남 이미지">
      </div>
      <div class="branch-description">
        <p>서울특별시 강남구 역삼동 814-6 스타플렉스<br>서울특별시 강남구 강남대로 438 (역삼동)</p>
      </div>
    </div>
  </div>

  <div class="branch-info">
    <h3 class="branch-name">CGV용산</h3>
    <div class="branch-content">
      <div class="branch-image">
        <img src="https://img.cgv.co.kr/Theater/Theater/2017/1020/15084871764830.jpg" alt="CGV 용산 이미지">
      </div>
      <div class="branch-description">
        <p>서울특별시 용산구 한강로 3가 40-999 HDC아이파크몰 6층<br>서울특별시 용산구 한강대로23길 55, 6층(한강로동)</p>
      </div>
    </div>
  </div>
</div>
</body>
</head>
</html>