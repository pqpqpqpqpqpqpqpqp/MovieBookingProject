<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <meta charset="UTF-8">
  <title>내가 본 영화</title>
<link href ="${pageContext.request.contextPath}/asset/css/mypage.css" rel ="stylesheet ">

<!-- 
	*************************************
	aside 바 누르면 class에 active 주기
	*************************************
 -->
<div class="my_cgv_home_main_container">
  <!-- 왼쪽 프로필 영역 -->
  <div class="aside_profile_container">
  <div class="aside_profile_menu">
  	<div class="aside_profile_img">
    <img src="/MovieBookingProject/asset/img/movie/movieposter/Avatar.jpeg" alt="프로필">
  	</div>
    <div class="profile_name"> 홍길동
    <a id="go_edit_page" href="#" class="edit" target="_blank" title="새창열림">나의 정보 변경</a></div>
    <div class=profile_nickname>플린회원 - 2000</div>
  </div>
  <a class="aside_profile_menu tab active">
	    <em>0<!-- 내가 본 영화 --></em>
	    <span>내가 본 영화</span>
   </a>
     <a class="aside_profile_menu tab <%//active 넣는 곳 %>">
	    <em>1<!-- 내가 본 영화 --></em>
	    <span>내가 쓴 평점</span>
   </a>
  </div>
  </div>

  <!-- 오른쪽 영화 리스트 -->
  <div class="movie-list-section">
    <div class="movie-list-header">
      <h3>내가 본 영화 <span>10건</span></h3>
      <div class="controls">
        <select>
          <option>전체</option>
          <option>2025년</option>
        </select>
        <button>GO</button>
        <button style="background-color:#ff4e00; color:white;">실관람객 등록</button>
      </div>
    </div>

    <!-- 영화 항목 -->
    <div class="movie-item">
      <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000087/87578/87578_320.jpg" alt="파과" class="poster">
      <div class="movie-info">
        <h4>파과 <small>THE OLD WOMAN WITH THE KNIFE</small></h4>
        <div class="meta">2025.05.07 (수) 18:30 ~ 20:42<br>CGV강남 6관 10층 (Laser) / 3명</div>
        <div class="highlight">🎬 별로예요</div>
      </div>
      <button class="movie-remove-btn">×</button>
    </div>

    <div class="movie-item">
      <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000082/82513/82513_320.jpg" alt="듄" class="poster">
      <div class="movie-info">
        <h4>듄 (IMAX 체험전, IMAX LASER 2D) <small>DUNE</small></h4>
        <div class="meta">2022.02.15 (화) 21:00 ~ 23:45<br>CGV용산아이파크몰 IMAX관 / 2명</div>
        <div class="highlight">이 영화를 평가해주세요</div>
      </div>
      <button class="movie-remove-btn">×</button>
    </div>

    <div class="movie-item">
      <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000074/74189/74189_320.jpg" alt="덩케르크" class="poster">
      <div class="movie-info">
        <h4>덩케르크 (IMAX 체험전, IMAX LASER 2D) <small>Dunkirk</small></h4>
        <div class="meta">2022.02.15 (화) 18:40 ~ 20:36<br>CGV용산아이파크몰 IMAX관 / 2명</div>
        <div class="highlight">이 영화를 평가해주세요</div>
      </div>
      <button class="movie-remove-btn">×</button>
    </div>
  </div>
</div>

