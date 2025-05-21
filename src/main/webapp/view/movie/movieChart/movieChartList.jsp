<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
	<meta charset="UTF-8">
	<title>무비차트 리스트</title>
	<link href ="${pageContext.request.contextPath}/asset/css/style.css" rel ="stylesheet ">
	
</head>
<body>
<div class="movie_chart_container">
	<div class="movie_chart_inBox">
	
		<div class="movie_chart_idx">
			<select id="chartOption">
				<option value= "1"  selected>예매율순</option>
				<option value= "2">평점순</option>
			</select>
			<div class="show_movie_chart_btn" id="listChangeBtn">GO</div>
			
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

				
				// 기존 리스트 삭제
				$("#movieList").empty();
				

				for(let i = 0; i < res.data.length; i++) {
					
					const count = parseInt(res.data[i].movieChartCount);
				    const data = res.data[i];

				    
					let html =
						
						 '<li>' +
                    		'<div class="box_image">' +
                        	'<div class="rank">No.' +(i+1)+ '</div>' +  

<!-- 영화 포스터 클릭 시 해당 상세페이지로 이동하는 기능 -->
                        	'<a href="${pageContext.request.contextPath}/view/movie/detail.jsp?movieIdx='+res.data[i].movieIdx+'">' +
    
                            	'<span class="thumb_image">' +
                                	'<img src="${pageContext.request.contextPath}'+res.data[i].movieChartImg+'"/>' +
<!-- 영상물 등급 -->					
									'<span class="movie_icon_age">';
									
                               		html +='<img src="${pageContext.request.contextPath}/asset/icon/movieAge/age'+data.movieChartAgeGrade+'.svg" alt="AgeGrade">';
                                		
    								html+= '</span>' +
                            	'</span>' +
                         	'</a>' +
                    	'</div>' +            
                    <!--  영화 정보 칸 -->        
                    '<ul class="box_contents">' +
                    
                    <!-- 영화 포스터 클릭 시 해당 상세페이지로 이동하는 기능 -->                    
                       '<a href="${pageContext.request.contextPath}/view/movie/detail.jsp?movieIdx='+res.data[i].movieIdx+'">' +

                    <!-- 영화이름 변수 입력 --> 
 							'<strong>영화: ' +res.data[i].movieChartName+ '</strong>' +
                 		'</a>' +
                    <!--  예매율 넣어주세요 -->	
                 		'<div class="score">' +
                        	'<strong class="percent">예매율 <span>' +res.data[i].movieChartCount+ '%</span> | 평점<span>'+(data.movieChartReviewScore !=='0'? data.movieChartReviewScore:'통계 없음')+'</sapn>' +
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