<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main - MovieChart</title>

<style>
.movie_list_container {
	display: flex;
	justify-content: space-between;
	gap: 20px;
	padding: 20px;
	max-width: 900px;
	margin: auto;
}

.movie_list_container .movie-item {
	position: relative;
	display: flex;
	flex-direction: column;
	align-items: center;
	width: 150px;
	z-index: 3;
}
.movie-item .movie_main_chart_num{
	position: absolute;
	display: flex;
	width: 40px;
	height: 50px;
	overflow: hidden;
	justify-content: center;
	align-items: center;
	
	bottom: 88px;
	left: -7px;
	
	font-size: 40px;
	color: #fff;
	font-style: italic !important;
	font-weight: 400;	
	z-index: 10;	
}

.poster-wrap {
	width: 100%;
	aspect-ratio: 5/7;
	overflow: hidden;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}
.poster-wrap:hover {
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.8);
	text-decoration: underline;
}

.poster-wrap img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}


.movie_list_container .movie-item .age-tag {
	position: absolute;
	top: 10px;
	left: 10px;
	border-radius: 8px;
	
	width: 20px;
	height: 20px;
}

.movie_list_container .movie-item .age-tag img {
	width: 20px;
	height: 20px;
}


.movie-title {
	font-weight: bold;
	margin-top: 6px;
	text-align: center;
}

.movie-meta {
	font-size: 13px;
	color: #666;
	text-align: center;
	margin-top: 4px;
}

</style>
</head>
<body>
	<div class="movie_chart_container">
		<div class="movie_chart_inBox">
			<div class="movie_list_container" id="mainMovieList"></div>
		</div>
	</div>

<script src="${pageContext.request.contextPath}/asset/js/jquery-3.7.1.min.js"></script>
<script>
	$(document).ready(function() {
		
		
	$.ajax ({
		url: '${pageContext.request.contextPath}/MovieChart.mo',
		type : 'post',
		data: {},
		dataType: 'json',
		success : function(res) {
			
			const list = $("#mainMovieList");
			list.empty();
			
			for(let i = 0; i < 5; i++) {
				
				 let html = 
					 '<div class="movie-item">' +
				      		'<a href="' + '${pageContext.request.contextPath}/movieDetail.mow?movieIdx=' + res.data[i].movieIdx + '">' +
				        		'<div class="poster-wrap">' +
				        			'<img src="' + '${pageContext.request.contextPath}' + res.data[i].movieChartImg + '" alt="' + res.data[i].movieChartName + '">' +
				        	 	'</div>' +
				        	'</a>' +
				        '<div class="age-tag">' +
				        		'<img src="' + '${pageContext.request.contextPath}/asset/icon/movieAge/age' + res.data[i].movieChartAgeGrade + '.svg" alt="AgeGrade">' +
				        '</div>' +
				        '<div class= "movie_main_chart_num">' + (i+1) +' </div>' +
				        '<div class="movie-title">' + res.data[i].movieChartName + '</div>' +
				        
				        '<div class="movie-meta">' +
				        	'예매율 ' + res.data[i].movieChartCount + '%<br>' +
				        	'평점 ' + (res.data[i].movieChartReviewScore !== '0' ? res.data[i].movieChartReviewScore + '%' : '통계 없음') + '<br>' +
				        	
				        '</div>' +
				     '</div>';

				    list.append(html);
			}
		}
	});
	
	});

</script>
</body>
</html>