<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body, input, textarea, select, button, table {
	font-size: 13px;
	line-height: 1.2;
	color: #666;
	font-family: 'Noto Sans KR', 'CJONLYONENEW', '맑은 고딕', '돋움', Dotum,
		sans-serif;
	font-weight: 400;
}

.movie_chart_idx {
	display: flex;
	align-items: center;
	gap: 10px;
	justify-content: flex-end;
}

.movie_chart_idx select {
	line-height: 27px;
	height: 29px;
	padding: 3px 5px;
	border: 1px solid #b4b3aa;
}

.movie_chart_idx .show_movie_chart_btn {
	padding-left: 5px;
	padding-right: 5px;
  	height: 30px;
 	display: flex;
 	align-items: center;
 	justify-content: center;
  	border: 1px solid #ddd;
  	cursor: pointer;
  	background-color: #f9f9f9;
  	font-size: 13px;
}
</style>
</head>
<body>
	<div class="movie_chart_idx">
		<select>
			<option selected value= "1">예매율순</option>
			<option value= "2">평점순</option>
		</select>
		<div class="show_movie_chart_btn" onclick="showMovieChart()">GO</div>
	</div>
	<div class="movie_chart_list">
	<jsp:include page=""></jsp:include>
	
	
	
	
	
	</div>

	<script>
		function showMovieChart() {

		}
	</script>
</body>
</html>