<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="movie.vo.MovieDetailRes" %>
<%@page import="java.text.ParseException"%>


<html>
<head>
	<meta charset="UTF-8">
	<title>MovieDetailReview</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/movieDetail.css" />


</head>
<body>

<!-- 미리보기용 div 250526 NHD -->
<div>

	<input type="hidden" id="movieIdx" value="${movieIdx}" />
	

	<div class="review_writeBtn">
		<button class="review_btn" id="write_btn">평점 작성</button>
		<button class="review_btn" id="my_btn">내 평점 확인</button>
	</div>
	
	<div class="movie_detail_review" id="movie_detail_review">
	<!-- script에서 html 추가  -->

		<br/>
		
	</div>
</div>

<script src="${pageContext.request.contextPath}/asset/js/jquery-3.7.1.min.js"></script>

<!-- 영화 리뷰 버튼(로그인 / 페이지 이동) 함수 -->
<%
    Object sessionUserIdx = session.getAttribute("userIdx");
    String userIdxStr = sessionUserIdx != null ? sessionUserIdx.toString() : "";
    /* null = "" (로그인 안된 상태)  */
%>

<input type="hidden" value="<%=userIdxStr%>" id="userIdxStr">
<script>
	
	const userIdxStr = document.getElementById('userIdxStr');
	
	// 평점 작성 버튼
	document.getElementById('write_btn').addEventListener("click", function() {
		console.log("확인");
		
		// 로그인 된 상태
		if (userIdxStr.value !== '') {
			consoel.log("평점 작성 - 로그인 완");
			// 리뷰 작성 페이지 연결
		}
		// 로그인 안된 상태
		else {
			alert("로그인이 필요합니다.");	
			location.href = "${pageContext.request.contextPath}/userLogin.me";
		}
		
	});

	// 내 평점 작성 버튼
	document.getElementById('my_btn').addEventListener("click", function() {
		
		// 로그인 된 상태 - 내가 쓴 평점 페이지로 이동
		if (userIdxStr.value !== '') {
			consoel.log("내 평점 작성 - 로그인 완");
			location.href = "";
		}
		// 로그인 안된 상태
		else {
			alert("로그인이 필요합니다.");	
			location.href = "${pageContext.request.contextPath}/userLogin.me";
		}
		
	});

</script>

<!-- 영화 리뷰 불러오기 함수  -->
<script>
	$(document).ready(function() {
		const MOVIE_IDX = document.getElementById('movieIdx').value;

		console.log("영화 인덱스 확인: ",MOVIE_IDX);
		
		$.ajax({
			url : '${pageContext.request.contextPath}/movieReviewList.re', // 서버의 엔드포인트
			type : "GET",
			data : {
				movieIdx : MOVIE_IDX,
			},
			success : function(resp) {
				console.log("데이터 확인",resp.data);
				
				
				
				for(var i = 0; i < resp.data.length; i++) {
					
					console.log("i 데이터 확인: ",resp.data[i]);
					
					var html = 
						'<div class="review_item">' +
							'<div class="movie_review_img">' +
                    			'<img src="'+resp.data[i].userImg+'"/>' +
                    		'</div>' +
                    		'<div class="movie_review_content">' +
								'<span class="user_nickname">닉네임: '+resp.data[i].userNick+'</span>' +
								'<span class="user_content">리뷰 내용: '+resp.data[i].reviewContent+'</span>' +
								'<span class="user_date">리뷰 작성일: '+resp.data[i].reviewDate+'</span>' +
							'</div>' +
						'</div>';
					
					$("#movie_detail_review").append(html);
				}
				
				
			},
			error : function() {
				alert("리뷰 불러오기에 실패했습니다. 다시 시도해주세요.");
			}
		});
	});
</script>

</body>

</html>
