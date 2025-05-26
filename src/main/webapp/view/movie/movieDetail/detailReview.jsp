<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="movie.vo.MovieDetailRes" %>
<%@page import="java.text.ParseException"%>


<html>
<head>
	<meta charset="UTF-8">
	<title>MovieDetailReview</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/movieDetail.css" />


</head>
<body>

<!-- 미리보기용 div 250526 NHD -->
<div>
	<h1> MovieDetailReview Page</h1>
	<input type="hidden" id="movieIdx" value="${movieIdx}" />
	

	<div class="review_writeBtn">
		<div>평점 작성 버튼</br>
		</div>
		<div>내 평점 확인 버튼
		</div>
	</div>
	<div class="movie_detail_review" id="movie_detail_review">
	<!-- script에서 html 추가  -->
<!--  		<img id="user_img" src=""/> -->
		<br/>
		
	</div>
</div>

<script src="${pageContext.request.contextPath}/asset/js/jquery-3.7.1.min.js"></script>
<!-- <script>
/************************
 * 페이지 시작
 ************************/
const MOVIE_IDX = document.getElementById('movieIdx').value;
$(document).ready(function() {

	detail(); // 영화 상세보기
});

/************************
 * 영화 상세보기 불러오기 함수
 ************************/

</script> -->


<script>
	$(document).ready(function() {
		const MOVIE_IDX = document.getElementById('movieIdx').value;

		console.log("영화 인덱스 확인: ",MOVIE_IDX);
		
		$.ajax({
			url : '${pageContext.request.contextPath}/movieReviewList.re', // 서버의 엔드포인트
			type : "GET",
			data : {
				movieIdx : MOVIE_IDX,
			},
			success : function(resp) {
				console.log("데이터 확인",resp.data);
				
				
				
				for(var i = 0; i < resp.data.length; i++) {
					
					console.log("i 데이터 확인: ",resp.data[i]);
					
					var html = 
						'<div class="movie_review_img">' +
                    		'<img src="'+resp.data[i].userImg+'"/>' +
                    	'</div>' +
                    	'<div class="movie_review_content">' +
						'<span class="user_nickname">닉네임: '+resp.data[i].userNick+'</span>' +
						'<span class="user_content">리뷰 내용: '+resp.data[i].reviewContent+'</span>' +
						'<span class="user_date">리뷰 작성일: '+resp.data[i].reviewDate+'</span>' +
						'</div>';
					
					$("#movie_detail_review").append(html);
				}
				
				
			},
			error : function() {
				alert("리뷰 불러오기에 실패했습니다. 다시 시도해주세요.");
			}
		});
	});
</script>

</body>

</html>
