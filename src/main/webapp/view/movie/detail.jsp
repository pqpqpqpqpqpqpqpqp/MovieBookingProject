<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="movie.vo.MovieDetailRes" %>
<%@page import="java.text.ParseException"%>

<html>
<head>
<meta charset="UTF-8">
<title>Detail</title>
<style>

body {
	margin: 0px;
	padding: 0px;
}

.movie_container {
	display: flex;


	gap: 50px;
	
}
#poster {
	width: 300px;
	height: 420px;
	object-fit: contain
	border: 1px solid #ccc; /* 선택사항: 테두리 */
}

.movie_graph {

	display: flex;
}
.graph_gender, .graph_age {
	border: 2px solid pink;	
	
	width: 400px;
	height: 400px;
}

.movie_review {
	width: 800px;
	height: 600px;
}

</style>
</head>
<body>
<h2>Detail Page</h2>

<% 
	String movieIdx = request.getParameter("movieIdx");
	if(movieIdx == null) {
		movieIdx = "";
	}
%>


<%
    MovieDetailRes movie = (MovieDetailRes) request.getAttribute("movie");
%>





<div class="movie_container" id="movie_container">
	<div class="movie_poster" id="movie_poster">
		<img id="poster" alt="poster" src="">
	</div>
	
	<div class="movie_info" id="movie_info">
		<h3 id="title"></h3>
		<span id="ticketing"></span>
		<span id="review"></span>
		<hr />
		<span id="creator"></span>
		<span id="grade"></span>
		<span id="playTime"></span>
		<span id="openDate"></span>
		<hr />
		
	</div>
	
</div>
<hr />
<div class="movie_content" id="content"></div>
<hr />

<div class="movie_graph">
	<div class="graph_gender" id="graph_gender"> 성별 분포 </div>
	<div class="graph_age" id="graph_age"> 연령별 분포 </div>
</div>
<hr />
<div class="movie_review">
	<div>리뷰 게시판</div>

</div>





<!--  movice Idx, List에서부터 연결 -->
<input type="hidden" id="movieIdx" value="<%=movieIdx %>" />
<!-- 리뷰 페이지 들어갈 때 링크에 영화idx, 영화 제목 같이 넘겨주세요 -->
<script src="${pageContext.request.contextPath}/asset/js/jquery-3.7.1.min.js"></script>
<script>

/************************
 * 페이지 시작
 ************************/
 const movieDetailIdx = document.getElementById('movieIdx').value;
$(document).ready(function() {

	detail(); // 영화 상세보기
});


/************************
 * 영화 상세보기 불러오기 함수
 ************************/
function detail() {
	
	
	
	$.ajax ({
		url: '${pageContext.request.contextPath}/MovieDetail.mo',
		type: 'get',
		data: {
			'movieIdx': movieDetailIdx
		},
		
		dataType: 'json',
		success: function(res) {
			console.log(res);
			if(res.code ==200) {
				const data = res.data;
				document.getElementById('poster').src = '${pageContext.request.contextPath}' +data.movieImg; 				// 포스터	
				document.getElementById('title').innerHTML = data.movieName; 		// 제목
				
				document.getElementById('ticketing').innerHTML = data.ticketingCnt;	// 예매율
				document.getElementById('review').innerHTML = data.previewAvg; 		// 평점
				
				document.getElementById('creator').innerHTML = data.movieCreator;	// 감독 
				document.getElementById('grade').innerHTML = data.movieAgeGrade; 	// 등급 
				document.getElementById('playTime').innerHTML = data.moviePlayTime; // 러닝타임 
				document.getElementById('openDate').innerHTML = data.movieOpenDate;	// 개봉일 													 
				document.getElementById('content').innerHTML = data.movieDsec;		// 소개글

				
				
				
			} else {
				alert('실패~');
			}
			
			
			}
		});
}

</script>

</body>

</html>
