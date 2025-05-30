<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href ="${pageContext.request.contextPath}/asset/css/mypage.css" rel ="stylesheet ">
<meta charset="UTF-8">
<title>Insert title here</title>
  <!-- 오른쪽 영화 리스트 -->
  <div class="movie_list_catainer">
    <div class="movie-list-header">
      <h3>내가 본 영화 <span id="countMovie"></span></h3>
      <div class="controls">
        <select>
          <option>전체</option>
          <option id="year">2025년</option>
        </select>
        <button>GO</button>
        
      </div>
    </div>
<%
	
	 int userIdx =(Integer) session.getAttribute("userIdx"); 
%>
    <!-- 영화 항목 -->
    <div class="movie_list_catainer movie">
   <!--  영화 들어감 -->
   
    </div>
    </div>
 
   <input type="hidden" id="sessionUserIdx" value="<%=userIdx %>" />

<script	src='${pageContext.request.contextPath}/asset/js/jquery-3.7.1.min.js'></script>
<script>

$(document).ready(function() {
	
	//값이 잘못들어와서 방지목적
	const USER_IDX = document.getElementById('sessionUserIdx').value;
	
	$.ajax({
		url : '${pageContext.request.contextPath}/myWatchedMovie.re',
		type : "GET",
		data : {
			userIdx : USER_IDX,
		},
		success : function(resp) {
			console.log("응답 확인:", resp); 
			let movieList = resp.data || [];
			$(".movie_list_catainer.movie").empty(); // 리스트 초기화

			// 영화 개수 표시 (내가 본 영화)
			const movieCount = movieList.length;
			$('#countMovie').text(movieCount + '건');

			// 🔥 부모 페이지 aside 탭에도 개수 갱신
			if (window.parent && window.parent.document) {
				const $parentWatchedEm = $(window.parent.document).find('a[data-target="watchedMovies"] em');
				$parentWatchedEm.text(movieCount);
			}else {
				$('#movie_count').text(movieList.length);
			}
			
			let contextPath = "${pageContext.request.contextPath}";
			let reviewTxt = "";
			for (let i = 0; i < resp.data.length; i++) {
				reviewTxt = resp.data[i].reviewScore > 0 ? "좋았어요" : "별로예요";
							console.log("영화 idx",resp.data[i].movieIdx);
				let html = 
					'<div class="movie-item">' +
					'<a href="' + contextPath + '/movieDetail.mow?movieIdx=' + resp.data[i].movieIdx + '">' + 
				      '<img class="poster" src="' + contextPath + resp.data[i].movieImg + '" alt="' + resp.data[i].movieName + '">' +
				    '</a>' +
				    	'<div class="movie-info">' +
				        	'<h4>' + resp.data[i].movieName + '</h4>' +
				        	'<div class="meta">' +
					        	'<span>' + resp.data[i].watchDate + '</span> ' +
					        	'<span>' + resp.data[i].weekday + '</span> ' +
					        	'<span>' + resp.data[i].screenTime + '</span><br>' +
					        	'<span>CGV ' + resp.data[i].thciName + ' / </span>' +
					        	'<span>' + resp.data[i].screenNum + '</span>' +
				        	'</div>' +
				        	'<div class="highlight">🎬 ' + reviewTxt + '</div>' +
				     	'</div>' +
				    	'<button class="movie-remove-btn">×</button>' +
				    '</div>';

				$(".movie_list_catainer.movie").append(html);
			}
		},
		error : function() {
			alert("리뷰 불러오기에 실패했습니다. 다시 시도해주세요.");
		}
	});
});
</script>