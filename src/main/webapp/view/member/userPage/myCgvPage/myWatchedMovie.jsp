<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href ="${pageContext.request.contextPath}/asset/css/mypage.css" rel ="stylesheet ">
<meta charset="UTF-8">
<title>Insert title here</title>
  <!-- 오른쪽 영화 리스트 -->
  <div class="movie_list_catainer">
    <div class="movie-list-header">
      <h3>내가 본 영화 <span id="countMovie">10건</span></h3>
      <div class="controls">
        <select>
          <option>전체</option>
          <option id="year">2025년</option>
        </select>
        <button>GO</button>
        <button style="background-color: #fb4357; border:none; color:white;">실관람객 등록</button>
      </div>
    </div>

    <!-- 영화 항목 -->
    <div class="movie_list_catainer movie">
    </div>

  <div class="movie-item">
      <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000087/87578/87578_320.jpg" alt="파과" class="poster">
      <div class="movie-info">
        <h4>파과 <small>THE OLD WOMAN WITH THE KNIFE</small></h4>
        <div class="meta"><span>영화본 날짜(년/월/일)</span> <span>(요일)</span> <span>본시간18:30 ~ 20:42</span><br><span>어디서?? CGV강남 6관 10층 (Laser)</span> / <span>몇명예약했어? 3명</span></div>
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
<script
	src='${pageContext.request.contextPath}/asset/js/jquery-3.7.1.min.js'></script>
<script>
	$(document).ready(function() {
		const USER_IDX = <%= useridx %>;
		
		$.ajax({
			url : '${pageContext.request.contextPath}/myReviewList.re', // 서버의 엔드포인트
			type : "GET",
			data : {
				userIdx : USER_IDX,
			},
			success : function(resp) {
				//기존 리스트 초기화
				$("#movie_list_catainer").empty();
	
				console.log(resp.data);
				
				for(let i = 0; i < resp.data.length; i++) {
					let html = 
						'<div class="movie-item">' +
				      '<img class="poster" src="${pageContext.request.contextPath}'+resp.data[i].movieImg+'"/>' +
				      <div class="movie-info">
				        <h4>파과 <small>THE OLD WOMAN WITH THE KNIFE</small></h4>
				        <div class="meta"><span>영화본 날짜(년/월/일)</span> <span>(요일)</span> <span>본시간18:30 ~ 20:42</span><br><span>어디서?? CGV강남 6관 10층 (Laser)</span> / <span>몇명예약했어? 3명</span></div>
				        <div class="highlight">🎬 별로예요</div>
				      </div>
				      <button class="movie-remove-btn">×</button>
				    </div>
					 ;
					 
					$(".movie_list_catainer.movie").append(html);	
				}
				
			},
			error : function() {
				alert("리뷰 불러오기에 실패했습니다. 다시 시도해주세요.");
			}
		});
	});
</script>

