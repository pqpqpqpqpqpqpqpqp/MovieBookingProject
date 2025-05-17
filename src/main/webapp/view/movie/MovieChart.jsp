<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>무비차트제목</title>
<link rel ="preconnect " href ="https: //fonts.googleapis.com "> 
<link rel ="preconnect " href ="https: //fonts.gstatic.com " crossorigin>
<link href ="https: //fonts.googleapis.com /css2 ?family =Noto+Sans+KR:wght @100 ..900&display =swap " rel ="stylesheet ">
</head>
<body>

<h1> 작업 내용 넣기</h1>



<script src="../../asset/js/jquery-3.7.1.min.js"></script>
<script>

	$(document).ready(function() {
		// DOM이 준비되면 실행됨
		console.log("DOM이 준비되었습니다.");
		
		$.ajax ({
			url:'${pageContext.request.contextPath}/MovieChart.mo',
			type: 'post',
			data: {}, // 버튼 눌렀을 때 사용할 거
			dataType: 'json',
			success: function(res) {
				console.log(res)
				console.log(res.data)
				
				for(let i = 0; i < res.data.length; i++) {
					console.log(res.data[i])
					console.log(res.data[i].movieChartImg)
					console.log(res.data[i].movieChartName)
					console.log(res.data[i].movieChartAgeGrade)
					
					
					
					const html =
						
						 '<li>'+
                    '<div class="box-image">'+
                        '<div class="rank">No.' +(i+1)+ '</div> '+  
                        /*  '<strong class="rank">No.' +(i+1)+ '</strong> '+ */
<!-- 영화 포스터 클릭 시 해당 상세페이지로 이동하는 기능 -->
                        '<a href="/movies/detail-view/">'+
                            '<span class="thumb-image">'+
                                '<img src=" ' +res.data[i].movieChartImg+ '" alt="영화 포스터" onerror="errorImage(this)">'+
<!-- 영상물 등급 -->
                                '<p class="movie_icon_age">등급: ' +res.data[i].movieChartAgeGrade+ '</p>'+
                                
                            '</span>'+
                         '</a>'+
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
                            '<strong class="percent"><span>예매수: ' +res.data[i].movieChartCount+ '  </span></strong>'+                     
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
			
		})
	});
</script>
</body>
</html>