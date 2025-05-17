<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>무비차트 리스트</title>
<style>
body, input, textarea, select, button, table {
	font-size: 13px;
	line-height: 1.2;
	color: #666;
	font-family: 'Noto Sans KR', 'CJONLYONENEW', '맑은 고딕', '돋움', Dotum,
		sans-serif;
	font-weight: 400;
}
.movie_chart_container{
	height: auto;
	flex: flex;
	justify-content: center;
}
.movie_chart_container .movie_chart_inBox{
	width: 980px;
	height: 100%;
	display: flex;	
	flex-direction: column;
	justify-content: flex-start;
	border: 1px solid black;

}

.movie_chart_container .movie_chart_inBox .movie_chart_idx {
	width: 980px;
	display: flex;
	align-items: center;
	gap: 10px;
	justify-content: flex-end;
	border: 1px solid red;
}

.movie_chart_container .movie_chart_inBox .movie_chart_idx select {
	line-height: 27px;
	height: 29px;
	padding: 3px 5px;
	border: 1px solid #b4b3aa;
}

.movie_chart_container .movie_chart_inBox .movie_chart_idx .show_movie_chart_btn {
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
.movie_chart_container .movie_chart_inBox .sect_movie_chart .box-image .movie_icon_age{

}
[class|="sect"][class*="chart"] > li {
    float: left;
    width: 197px;
    margin-left: 64px;
    padding-bottom: 30px;
}
</style>
</head>
<body>
<div class="movie_chart_container">
<div class="movie_chart_inBox">
	<div class="movie_chart_idx">
		<select>
			<option selected value= "1">예매율순</option>
			<option value= "2">평점순</option>
		</select>
		<div class="show_movie_chart_btn" onclick="showMovieChart()">GO</div>
	</div>
	<div class="sect_movie_chart">
                   
                <li>
                    <o class="box-image">
                        <strong class="rank">No.1</strong>	
<!-- 영화 포스터 클릭 시 해당 상세페이지로 이동하는 기능 -->
                        <a href="/movies/detail-view/">
<!--                             <div class="thumb-image"> -->
                                <img src="${pageContext.request.contextPath}/asset/img/movie/<%= %>.jpeg" alt="아바타2: 파이널 레코닝 포스터" onerror="errorImage(this)">
<!-- 영상물 등급 -->
                                <p class="movie_icon_age">
									<img src="${pageContext.request.contextPath}/asset/icon/movieAge/15.svg" alt="15세">
								</p>
								</a>
                            </o>
                    <!--  영화 정보 칸 -->        
                    <o class="box-contents">
<!-- 영화 포스터 클릭 시 해당 상세페이지로 이동하는 기능 -->                    
                        <a href="/movies/detail-view/?midx=89629">
<!-- 영화이름 변수 입력 -->
                            <strong class="title"></strong>
                        </a>
                        <div class="score">
<!--  예매율 넣어주세요 -->                        
                            <strong class="percent">예매율<span>  </span></strong>                     
                        </div>
<!-- 개봉일 넣어줘 -->                        
                        <span class="txt-info">
                            <strong><span>개봉</span>                                
                            </strong>
                        </span>                        
                    </o>   
                    </li>
            </div>
</div>
</div>
	<script>
	//예매율순이나 평점순 버튼 눌렀을때 뷰 나오게하는 버튼 Sector value 예매율 1, 평점순 2부여
		function showMovieChart() {

		}
	</script>
</body>
</html>