<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<h2> 무비차트 페이지</h2>
<div id="movieList"></div>

<script src="../../asset/js/jquery-3.7.1.min.js"></script>
<script>

	$(document).ready(function() {
		// DOM이 준비되면 실행됨
		console.log("DOM이 준비되었습니다.");
		
		$.ajax ({
			url:'${pageContext.request.contextPath}/MovieChart.mo',
			type: 'post',
			dataType: 'json',
			success: function(res) {
				console.log(res)
				console.log(res.data)
				
				
				for(let i = 0; i < res.data.length; i++) {
					
					const html = `
					
						<div class="movie">
							<img src="${res.data[i].movieChartImg}" alt="${res.data[i].movieChartName}" width="200">
							<h3>"${res.data[i].movieChartName}"</h3>
							<p>등급: ${res.data[i].movieChartAgeGrade}</p>
							<p>평점: ${res.data[i].movieChartReviewScore}</p>
							<p>개봉일: ${res.data[i].movieChartOpenDate}</p>
							<p>예매수: ${res.data[i].movieChartCount}</p>
						</div>
					`;
					
					$("#movieList").append(html);
				}

			}
			
		})
	});
	
	
</script>