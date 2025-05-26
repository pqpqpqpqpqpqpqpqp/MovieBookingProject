<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<link href ="${pageContext.request.contextPath}/asset/css/mypage.css" rel ="stylesheet ">
<title>Insert title here</title>
<!-- 오른쪽 리뷰 리스트 -->
<div class="movie_list_catainer">
	<h3>내가 쓴 평점</h3>
	<!-- 리뷰 항목 -->
	<div class="movie-item">
		<img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000087/87578/87578_320.jpg" alt="파과" class="poster">
		<div class="movie-info">
			<h4>파과</h4>
			<div class="meta">
				<span>아이디</span>
				<span>리뷰작성일자</span>
			</div>
			<div class="review_context">후기가 작성됩니다.</div>
			<div class="edit_review_txt">
				<!--  수정하기 버튼 -->
				<div class="btn_edit">
					<a href="#" class="write_point">수정하기</a>
				</div>
				<!-- 좋아요 기능 -->
				<div class="point_like">
					<a class="btn_point_like">
				<img src="<%= request.getContextPath() %>/asset/icon/likeIcon.png" alt="like">
				<span id="idLikeValue">0</span></a>
			</div>
			</div>
		</div>
	<button class="movie-remove-btn">×</button>
</div>
</div>


