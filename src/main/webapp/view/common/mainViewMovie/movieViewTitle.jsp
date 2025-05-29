<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>무비차트 슬라이더</title>
<!-- 전체보기 버튼 링크 미설정 -->
<link rel ="preconnect " href ="https: //fonts.googleapis.com "> 
<link rel ="preconnect " href ="https: //fonts.gstatic.com " crossorigin>
<style>
	
	body {
	font-family: "Noto Sans KR", sans-serif;
	overflow-x: auto;
	height: auto;
	display: flex;
	flex-direction: column;
	justify-content: center;
	}
	
	div{
	    unicode-bidi: isolate;
	}
.contents {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	
	width: 100%;
	height: 100%;
	    
	
	
}

.contents .movie_chart_container {
     display: flex;
     flex-direction: column;
    align-items: center;
    justify-content: space-between;
    margin-bottom: 20px;
    padding: 50px 30px 60px;
    
  width: 980px;
}

.contents .movie_chart_container .movie_chart_btn {
	width: 100%;
  height: 100%;
  display: flex;
  flex-direction: row;  
  justify-content: space-between;
  	align-items: flex-end;
  gap: 10px;                
}
.contents .movie_chart_container .movie_chart_btn .chart_btn {
	height: 100%;
	font-size: 40px;
	font-weight: bold; 
	align-items: flex-end;
}
.contents .movie_chart_container .movie_chart_btn .view_all_btn {
    padding: 4px 32px 4px 15px;
    font-size: 14px;
    color: #222;
    line-height: 1.429em;
    border-radius: 15px;
    box-shadow: 1px 1px 1px 0 rgba(0, 0, 0, 0.05);
    cursor: pointer;
}

.contents .movie_chart_container .movie_chart_btn .chart_btn .active {
font-weight: 700;
    color: #222;
    }
    
    
    
    .movieChart_list .swiper-button-prev {
    overflow: hidden;
    left: -20px;
    top: calc(50% - 26px);
    width: 40px;
    height: 40px;
    margin-top: -20px;
    font-size: 0;
    border-radius: 50%;
    box-shadow: 2px 2px 8px 0 rgba(0, 0, 0, 0.2);
} .swiper-wrapper{
    --swiper-theme-color: #007aff;
    --swiper-navigation-size: 44px;
    line-height: 1.2;
    color: #666;
    font-weight: 400;
    list-style: none;
    font-family: 'Noto Sans KR', 'CJONLYONENEW', '맑은 고딕', '돋움', Dotum, sans-serif;
    font-size: 100%;
    margin: 0;
    padding: 0;
    border: 0;
    vertical-align: baseline;
    word-break: break-all;
    position: relative;
    width: 100%;
    height: 100%;
    z-index: 1;
    display: flex;
    transition-property: transform;
    box-sizing: content-box;
    counter-reset: movie-chart-counter;
    transform: translate3d(-1012px, 0px, 0px);
    transition-duration: 0ms;
    }
</style>
</head>
<body>
	<div class="contents">
		<div class="movie_chart_container">
			<div class="movie_chart_btn">
				<div class="chart_btn" id="btnMovie" >무비차트</div>
				<!--  경로 추가해줘야됨 -->
				<a href="${pageContext.request.contextPath}/view/movie/MovieChart.jsp">
					<div class="view_all_btn" id="btn_allView_Movie" class="btn_allView">전체보기 ></div>
				</a>
			</div>
				</div>
	</div>
	
</body>

</html>
