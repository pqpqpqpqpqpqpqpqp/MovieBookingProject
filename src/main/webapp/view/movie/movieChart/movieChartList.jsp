<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	display: flex;
	justify-content: center;
	margin-bottom: 50PX;
}
.movie_chart_container .movie_chart_inBox{
	width: 980px;
	height: 100%;
	display: flex;	
	flex-direction: column;
	justify-content: flex-start;

}

.movie_chart_container .movie_chart_inBox .movie_chart_idx {
	width: 980px;
	display: flex;
	align-items: center;
	gap: 10px;
	justify-content: flex-end;
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
.movie_chart_container .movie_chart_inBox .sect_movie_chart{
}
span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, font, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td {
    font-family: 'Noto Sans KR', 'CJONLYONENEW', '맑은 고딕', '돋움', Dotum, sans-serif;
    font-size: 100%;
    margin: 0;
    padding: 0;
    border: 0;
    vertical-align: baseline;
    word-break: break-all;
    }
.movie_chart_container .movie_chart_inBox .sect_movie_chart ol {
	display: flex;
	flex-wrap: wrap;
	padding: 0;
	margin: 0;
	gap: 30px; /* 카드 사이 여백 */
	list-style: none;
	justify-content: flex-start;
}

.movie_chart_container .movie_chart_inBox .sect_movie_chart li {
	width: 200px;       /* 적절한 카드 크기 */
	box-sizing: border-box;
	border-radius: 6px;
	padding: 10px;
	background: #fff;
	display: flex;
	flex-direction: column;
	align-items: center;
}

.movie_chart_container .movie_chart_inBox .sect_movie_chart .rank{
	    display: block;
    height: 28px;
    margin-bottom: 4px;
    background: #333333;
    color: #ffffff;
    font-size: 19px;
    text-align: center;
    line-height: 28px;

}
.movie_chart_container .movie_chart_inBox .sect_movie_chart .box_image{
 	position: relative;
  	width: 197px;
  	height: 280px; /* 고정 높이로 맞춰줌 */
  	margin-bottom: 10px;
  	overflow: hidden;
  	display: flex;
  	flex-direction: column;
}

 .movie_chart_container .movie_chart_inBox .sect_movie_chart .box_image .thumb_image { 
  position: relative;
  display: flex;
  flex-direction: column;
  justify-content: center;
  width: 100%;
  height: 100%;
  overflow: hidden;
  aspect-ratio: 35 / 46;

}

.movie_chart_container .movie_chart_inBox .sect_movie_chart .box_image .thumb_image img {
  width: 100%;
  height: 100%;
  display: block;
  
}
.movie_chart_container .movie_chart_inBox .sect_movie_chart .box_image .thumb_image .movie_icon_age {
  position: absolute;
  top: 10px;
  left: 10px;
  width: 20px;
  height: 20px;
  z-index: 2;
  border-radius: 4px;
  display: flex;
  align-items: center;
  justify-content: center;
}
.movie_chart_container .movie_chart_inBox .sect_movie_chart .box_image .thumb_image .movie_icon_age img {
  width: 90%;
  height: auto;
  display: block;

}

 .movie_chart_container .movie_chart_inBox .sect_movie_chart .box_contents {
	width: 100%;
	margin-top: 10px;
	text-align: left;
}
 .movie_chart_container .movie_chart_inBox .sect_movie_chart .box_contents a{
    display: block;
	text-decoration: none; /* 밑줄 제거 */
    color: inherit; 
    white-space: nowrap;
    text-overflow: ellipsis;
    overflow: hidden;
}
.movie_chart_container .movie_chart_inBox .sect_movie_chart .box_contents a strong {
    text-decoration: none; /* 밑줄 제거 */
    color: black; 
    font-weight: 500;
}

 .movie_chart_container .movie_chart_inBox .sect_movie_chart .box_contents .score {
	margin-top: 5px;
	font-size: 10px;
	display: flex;
	align-items: center;
	}
 .movie_chart_container .movie_chart_inBox .sect_movie_chart .box_contents .score .egg_gage_small {
    display: flex;
    align-items: center;
    margin-left: 3px;
    margin-right: 5px;
    width: 18px;
    height: 18px;
    background: url(../../../asset/img/movie/score/spriteEgg.png) no-repeat 0 -54px;
    vertical-align: middle;
}
.movie_chart_container .movie_chart_inBox .sect_movie_chart .box_contents .score .egg_gage_small .egg_great {
    width: 16px;
    background-position: -41px -47px;
    margin-right: 5px;
}
.movie_chart_container .movie_chart_inBox .sect_movie_chart .box_contents .score .egg_gage_small .percent{
width: 30px;
margin-left: 20px;
white-space: nowrap; 
color: black;
}
.movie_chart_container .movie_chart_inBox .sect_movie_chart .box_contents .movie_open_info{
font-size: 8px;
font-weight: 570;
}
</style>
</head>
<body>
<div class="movie_chart_container">
<div class="movie_chart_inBox">
	
	<div class="movie_chart_idx">
		<select id="chartOption">
			<option value= "1"  selected>예매율순</option>
			<option value= "2">평점순</option>
		</select>
		<div class="show_movie_chart_btn" id="listChangeBtn" onclick="showMovieChart()">GO</div>
	</div>
	
	<div class="sect_movie_chart">
       <ol id="movieList"> </ol>
 	</div>
 	
 	<button onclick="detailMove(4)">버튼</button>
</div>
</div>
<script src="${pageContext.request.contextPath}/asset/js/jquery-3.7.1.min.js"></script>
<script>
	$(document).ready(function() {
		let sum = 0;
		
		// DOM이 준비되면 실행됨
		console.log("DOM이 준비되었습니다.");		
		
		// 에매순 차트 로드
		loadMovieChart("ticketing");
		
		// 버튼 클릭 이벤트
		$("#listChangeBtn").click(function(){

			
			// 선택된 옵션에 대한 값 가져오기
			const chartType = $("#chartOption").val();
			
			// 예매순 / 평점순으로 로드되게끔
			if(chartType === "1") {
				loadMovieChart("ticketing");
			}
			else if(chartType === "2") {
				loadMovieChart("review");
			}
		});
		
		// 영화 차트 로드 함수
	function loadMovieChart(chartType) {
			
			console.log('loadMovieChart 호출');

		
		$.ajax ({
			url:'${pageContext.request.contextPath}/MovieChart.mo',
			type: 'post', 
			data: {chartType : chartType}, // 버튼 눌렀을 때 사용할 거
			dataType: 'json',
			success: function(res) {
				console.log(res)
				console.log(res.data)
				
				// 기존 리스트 삭제
				$("#movieList").empty();
				
				for(let i = 0; i < res.data.length; i++) {
					sum += parseInt(res.data[i].movieChartCount);
				}
				console.log(sum);
				for(let i = 0; i < res.data.length; i++) {
					
					const count = parseInt(res.data[i].movieChartCount);
				    const rate = ((count / sum) * 100).toFixed(1);
					
				    console.log(res.data[i].movieIdx);
					console.log(res.data[i].movieChartImg);
					const html =
						
						 '<li>' +
                    		'<div class="box_image">' +
                        	'<div class="rank">No.' +(i+1)+ '</div>' +  

<!-- 영화 포스터 클릭 시 해당 상세페이지로 이동하는 기능 -->
                        	'<a href="${pageContext.request.contextPath}/view/movie/detail.jsp?detail='+res.data[i].movieIdx+'">' +
    
                            	'<span class="thumb_image">' +
                                	'<img src="${pageContext.request.contextPath}'+res.data[i].movieChartImg+'"/>' +
<!-- 영상물 등급 -->					
									'<span class="movie_icon_age">' +
                                		'<p class="movie_icon_age">등급: ' +res.data[i].movieChartAgeGrade+ '</p>' +
                                		'<img src="${pageContext.request.contextPath}/asset/icon/movieAge/age15.svg" alt="15세">' +
    								'</span>' +
                            	'</span>' +
                         	'</a>' +
                    	'</div>' +            
                    <!--  영화 정보 칸 -->        
                    '<ul class="box_contents">' +
                    
                    <!-- 영화 포스터 클릭 시 해당 상세페이지로 이동하는 기능 -->                    
                       '<a href="${pageContext.request.contextPath}/view/movie/detail.jsp?detail='+res.data[i].movieIdx+'">' +

                    <!-- 영화이름 변수 입력 --> 
 							'<strong>영화: ' +res.data[i].movieChartName+ '</strong>' +
                 		'</a>' +
                    <!--  예매율 넣어주세요 -->	
                 		'<div class="score">' +
                        	'<strong class="percent">예매율 <span>' + rate + '%</span> | 평점<span>'+res.data[i].movieChartReviewScore+'</sapn>' +
                        	'</strong>' +                 	
                        '</div>' +
                    <!-- 개봉일 넣어줘 -->                        
                        '<span class="movie_open_info">' +res.data[i].movieChartOpenDate+
                        	'<strong><span>개봉</span></strong>' +
                        '</span>' +                       
                     '</ul>' +   
                    '</li>';

					
					$("#movieList").append(html);	
				}
			}
			
		 });
		}
	});
	
	function detailMove(movieIdx) {

		location.href = "${pageContext.request.contextPath}/movieDetail.mow?movieIdx=" + movieIdx;
		//location.href="movieDetail.mow?detail="+movieIdx;
		

	}

</script>
</body>
</html>