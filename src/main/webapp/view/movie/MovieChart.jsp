<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<h2> 무비차트 페이지</h2>

<!--  예매순 / 평점순 -->
<select id="chartOption">
	<option value="1" selected> 예매순 </option>
	<option value="2"> 평점순 </option>
</select>


<!--  리스트 변경 버튼 -->
<button id="listChangeBtn" type="button"> 
	<span>GO</span>
</button>

<div id="movieList"></div>

<script src="../../asset/js/jquery-3.7.1.min.js"></script>
<script>

	$(document).ready(function() {
		// DOM이 준비되면 실행됨
		console.log("DOM이 준비되었습니다.");
		
		// 예매순 차트 로드
		loadMovieChart("ticketing");
		
		// 버튼 클릭 이벤트
		$("#listChangeBtn").click(function(){
			
			alert('어디갓어');
			
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

					const html =
						
						 '<li>'+
                   			 '<div class="box-image">'+
                       		 	'<div class="rank">No.' +(i+1)+ '</div> '+  
                        /*  '<strong class="rank">No.' +(i+1)+ '</strong> '+ */
<!-- 영화 포스터 클릭 시 해당 상세페이지로 이동하는 기능 -->
                       		 /*  '<a href="/movies/detail-view/">'+*/
                             		'<span class="thumb-image">'+
                           		  		'<img src=" ' +res.data[i].movieChartImg+ '" alt="영화 포스터" onclick="detailMove('+res.data[i].movieIdx+')">'+
<!-- 영상물 등급 -->
                             			'<p class="movie_icon_age">등급: ' +res.data[i].movieChartAgeGrade+ '</p>'+
                                
                             		'</span>'+
                             /* '</a>'+*/
                    		'</div>'+            
                    <!--  영화 정보 칸 -->        
                    		'<div class="box-contents">'+
<!-- 영화 포스터 클릭 시 해당 상세페이지로 이동하는 기능 -->                    
                        		'<a href="/movies/detail-view/?midx=89629">'+
<!-- 영화이름 변수 입력 -->
                            		'<strong class="title">영화: ' +res.data[i].movieChartName+ '</strong>'+
                        		'</a>'+
                        		'<div class="score">'+
<!--  예매율 넣어주세요 -->                        
                            		'<strong class="percent">'+
                            			'<span>예매수: ' +res.data[i].movieChartCount+ '  </span>'+
                            			'<span>평점: '  +res.data[i].movieChartReviewScore+ '</span>'+
                            		'</strong>'+                     
                        		'</div>'+
<!-- 개봉일 넣어줘 -->                        
                        		'<span class="txt-info">'+
                            		'<strong><span>개봉일: ' +res.data[i].movieChartOpenDate+ '</span>'+                               
                            		'</strong>'+
                        		'</span>'+
                        
                    		'</div>'+    
                		'</li>'
					
					$("#movieList").append(html);	
				}
				
				
			}
			
		});
		
		}
	});
	
	function detailMove(movieIdx) {

		location.href = "${pageContext.request.contextPath}/view/movie/detail.jsp?detail="+movieIdx;
		//location.href="movieDetail.mow?detail="+movieIdx;
		

	}
	
</script>