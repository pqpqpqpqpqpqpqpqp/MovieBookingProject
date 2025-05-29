<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>특별관 페이지</title>

<style>
* {
	font-family: 'Noto Sans KR', 'CJONLYONENEW', '맑은 고딕', '돋움', Dotum, sans-serif;
    font-size: 100%;
    margin: 0;
    padding: 0;
    border: 0;
    vertical-align: baseline;
    word-break: break-all;
}

body {
  margin: 0;
  font-family: 'Noto Sans KR', sans-serif;
  background: #fff;
  color: #333;
}

.theater_special_container {
  max-width: 1000px;
  margin: 60px auto;
  padding: 0 20px;
}

.theater_special_container h1 {

  font-weight: 400;
  font-size: 3em;
  color: #000;
  letter-spacing: -0.020em;
  line-height: 1.444em;

  text-align: center;
}

.hashtag {
  text-align: center;
  margin-bottom: 40px;
}

.hashtag span {
  margin: 0 8px;
  color: #888;
  font-weight: bold;
  font-size: 14px;
}

.theater_card_container {
  max-width: 980px;
  margin: 50px auto;
  padding: 0 20px;
}

h2 {
  font-size: 28px;
  font-weight: bold;
  margin-bottom: 10px;
}

.description {
  font-size: 14px;
  color: #666;
  margin-bottom: 30px;
}

.theater_grid {
  display: flex;
  flex-wrap: wrap;
  gap: 20px;
}

/* 1칸짜리 카드 (1/3 차지) */
.theater_box_1 {
  width: calc(33.33% - 13.33px);
  position: relative;
  border-radius: 12px;
  overflow: hidden;
  cursor: pointer;
}

/* 2칸짜리 카드 (2/3 차지) */
.theater_box_2 {
  width: calc(66.66% - 13.33px);
  position: relative;
  border-radius: 12px;
  overflow: hidden;
  cursor: pointer;
}

.theater_box_1 img,
.theater_box_2 img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  display: block;
}

.label {
  position: absolute;
  bottom: 15px;
  left: 20px;
  color: #fff;
  text-shadow: 0 0 5px rgba(0, 0, 0, 0.7);
}

.label h3 {
  margin: 0;
  font-size: 20px;
  font-weight: bold;
}

.label p {
  margin: 4px 0 0;
  font-size: 14px;
}


</style>
</head>

<body>

<div class="theater_special_container">
    <h1>CGV만의 특별함이 있는 영화관을 소개합니다.</h1>
    <div class="hashtag">
      <span>#TECHNOLOGY</span>
      <span>#PRESTIGE</span>
      <span>#CONCEPT</span>
	</div>

  <div class="theater_card_container">
    <h2>TECHNOLOGY</h2>
    <p class="description">진화된 3S(Screen, Sound, Seat) 기술로 컨텐츠 몰입도를 극대화하여 영화 관람에 최적화된 환경을 제공합니다.</p>

    <div class="theater_grid">
    
    <!-- 첫번째 줄: 2칸 + 1칸 -->
      <div class="theater_box_2">
        <img src="http://img.cgv.co.kr/WebApp/contents/specialTheater/list1/16844565213590.png" alt="IMAX">
        <div class="label"><h3>IMAX</h3><p>궁극의 몰입감</p></div>
      </div>

      <div class="theater_box_1">
        <img src="http://img.cgv.co.kr/WebApp/contents/specialTheater/list2/17066596473020.jpg" alt="4DX">
        <div class="label"><h3>4DX</h3><p>특별한 오감체험</p></div>
      </div>

    <!-- 두번째 줄: 1칸 + 2칸 -->
      <div class="theater_box_1">
        <img src="http://img.cgv.co.kr/WebApp/contents/specialTheater/list2/17079535042120.jpg" alt="ULTRA 4DX">
        <div class="label"><h3>ULTRA 4DX</h3><p>최대치의 공감각</p></div>
      </div>

      <div class="theater_box_2">
        <img src="http://img.cgv.co.kr/WebApp/contents/specialTheater/list1/17369059402410.jpg" alt="SCREENX">
        <div class="label"><h3>SCREENX</h3><p>세계 최초 다면 상영관</p></div>
      </div>
      
    </div>
    <br>
    <br>
    <br>
    <h2>PRESTIGE</h2>
    <p class="description">세련된 인테리어와 프리미엄 서비스로 진정한 품격을 느낄 수 있는 최고급 영화 관람 환경을 선사합니다.</p>
    
    <div class="theater_grid">
    
    <!-- 첫번째 줄: 2칸 + 1칸 -->
      <div class="theater_box_2">
        <img src="http://img.cgv.co.kr/WebApp/contents/specialTheater/list1/16844574293100.png" alt="IMAX">
        <div class="label"><h3>PRIVATE BOX</h3><p>박스형 프리미엄 상영관</p></div>
      </div>

      <div class="theater_box_1">
        <img src="http://img.cgv.co.kr/WebApp/contents/specialTheater/list2/16844574556230.png" alt="4DX">
        <div class="label"><h3>SUITE CINEMA</h3><p>호텔형 프리미엄 시네마</p></div>
      </div>

    <!-- 두번째 줄: 1칸 + 2칸 -->
      <div class="theater_box_1">
        <img src="http://img.cgv.co.kr/WebApp/contents/specialTheater/list2/16844574779520.png" alt="ULTRA 4DX">
        <div class="label"><h3>CINE de CHEF</h3><p>쉐프가 있는 영화관</p></div>
      </div>

      <div class="theater_box_2">
        <img src="http://img.cgv.co.kr/WebApp/contents/specialTheater/list1/16844575096390.png" alt="SCREENX">
        <div class="label"><h3>TEMPUR CINEMA</h3><p>템퍼침대형 프리미엄</p></div>
      </div>
      
    </div>
  </div>
 </div>
</body>
</html>


