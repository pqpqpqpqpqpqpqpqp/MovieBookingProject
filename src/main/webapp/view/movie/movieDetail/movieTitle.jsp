<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="movie.vo.MovieDetailRes" %>
<%@page import="java.text.ParseException"%>


<html>
<head>
	<meta charset="UTF-8">
	<title>MovieDetail</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/movieDetail.css" />
</head>
<body>
<% 
	String movieIdx = request.getParameter("movieIdx");
	if(movieIdx == null) {
		movieIdx = "";
	}
	
	MovieDetailRes movie = (MovieDetailRes) request.getAttribute("movie");
%>

<!--  movice Idx, List에서부터 연결 -->
<input type="hidden" id="movieIdx" value="<%=movieIdx %>" />



<div class="detail_movie_container_head">
	<div class="detail_movie_head_info_img_container">
		<a class="detail_movie_head_img" href="#">
			<img id="movie_poster" src="" alt="poster_img">
		</a>
<!-- 		<div class="movie_icon"></div> -->
	</div>
	<div class="detail_movie_head_info_content_container">
		<div class="movie_head_title">	
			<span class="head_info_movie_title" id="movie_title"></span>
			<em class="show_board lightblue">현재상영중</em>
		</div>
		
		<div class="head_info_movie_score_box">
			<span class="head_info_movie_score" >예매율</span>
			<span class="head_info_movie_score" id="movie_ticketing"></span>
			<span class="head_info_movie_score" >% &nbsp;</span>
			
			<span class="head_info_movie_score" >평점</span>
			<span class="head_info_movie_score" id="movie_review"></span>
			<span class="head_info_movie_score" >점</span>
		</div>
		
 		<div class="movie_spec">
            <dl>
                <dt>감독 :&nbsp;</dt>
                <dd>
                	<a id="movie_creator"></a>  
                </dd>
                <dd></dd>
				<dt>등급 :&nbsp;</dt>
				<dd><span id="movie_grade"></span></dd>
				<dd></dd>
                <dd class="on"><span>상영시간</span>:&nbsp;<span id="movie_playTime"></span></dd>
                <dt>개봉 :&nbsp;</dt>
                <dd class="on" id="movie_openDate"></dd>
            </dl>
        </div>
	</div>
</div>

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
				document.getElementById('movie_poster').src = '${pageContext.request.contextPath}' +data.movieImg; 				// 포스터	
				document.getElementById('movie_title').innerHTML = data.movieName; 		// 제목
				
				document.getElementById('movie_ticketing').innerHTML = data.ticketingCnt;	// 예매율
				document.getElementById('movie_review').innerHTML = data.previewAvg; 		// 평점
				
				document.getElementById('movie_creator').innerHTML = data.movieCreator;	// 감독 
				document.getElementById('movie_grade').innerHTML = data.movieAgeGrade; 	// 등급 
				document.getElementById('movie_playTime').innerHTML = data.moviePlayTime; // 러닝타임 
				document.getElementById('movie_openDate').innerHTML = data.movieOpenDate;	// 개봉일 													 
					
				
				
			} else {
				alert('실패~');
			}
			
			
			}
		});
}



</script>


</body>

</html>
