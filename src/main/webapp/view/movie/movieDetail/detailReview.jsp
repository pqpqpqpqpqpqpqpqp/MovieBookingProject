<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="movie.vo.MovieDetailRes" %>
<%@ page import="review.vo.ReviewListVO" %>
<%@page import="java.text.ParseException"%>


<%

//로그인 세션
Object sessionUserIdx = session.getAttribute("userIdx");
String userIdxStr = sessionUserIdx != null ? sessionUserIdx.toString() : "";
/* null = "" (로그인 안된 상태) */



String userImg = (String) request.getAttribute("userImg");
String userNick = (String) request.getAttribute("userNick");


int userIdx = 0;
if (!userIdxStr.equals("")) {
	userIdx = Integer.parseInt(userIdxStr);
}
/* 
// 영화인덱스
String movieIdx = request.getParameter("movieIdx");
*/



%>
<% 
	String movieIdx = request.getParameter("movieIdx");
	if(movieIdx == null) {
		movieIdx = "";
	}
	
%>

<html>
<head>
	<meta charset="UTF-8">
	<title>MovieDetailReview </title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/movieDetail.css" />


</head>
<body>


<div>

	<input type="hidden" id="movieIdx" value="" />

	
	<h1><%=movieIdx %></h1>
	<div class="review_writeBtn">
		<button class="review_btn" id="openReviewModal">평점 작성</button>
		<button class="review_btn" id="my_btn">내 평점 확인</button>
	</div>
	
	<!-- 모달 배경 및 컨테이너  -->
		<div id="reviewModal" class="modal-overlay" style="display:none;">
	  	<div class="modal-content">
			<!-- 리뷰 폼 -->
			<div class="review">
				<h2 class="movieName"></h2>
				<!-- 평점 선택버튼 + 프로필 -->
				<div class="rating-row">
					<button class="rating-button" data-rating="1" id="btn-good">
						좋았어요~^^</button>
					<!-- 프로필사진 + 닉네임 -->
					<div class="profile-info">
						<img src="" alt="프로필" id="userImg"> <span class="nickname" id="userNickname"></span>
					</div>
					<button class="rating-button" data-rating="0" id="btn-bad">흠~좀 별로였어요;;;</button>
				</div>
				<!-- 텍스트 입력 -->
				<textarea id="reviewText" maxlength="280" placeholder="운영원칙에 어긋나는 게시글은 제재 조치를 받을 수 있습니다."></textarea>
				<div class="byte-count">
					<span id="byteCount">0</span>/280(byte)
				</div>
				<!-- 제출 버튼 -->
				<button id="submitReview">작성완료!</button>
			</div>
		<!-- 닫기 버튼 -->
	    <button id="closeReviewModal" class="modal-close">×</button>
		</div>
	</div>
	
	<div class="movie_detail_review" id="movie_detail_review">
	<!-- script에서 html 추가  -->	
	
	</div>
</div>

<script src="${pageContext.request.contextPath}/asset/js/jquery-3.7.1.min.js"></script>

<!-- 영화 리뷰 버튼(로그인 / 페이지 이동) 함수 -->


<input type="hidden" value="<%=userIdxStr%>" id="userIdxStr" />
<input type="hidden" value="<%=userIdx%>" id="sessionUserIdx"/>
<input type="hidden" value="" id="sessionMovieIdx" />

<script>
	const movieName = document.getElementById("movie_title");
	const userIdxStr = document.getElementById('userIdxStr');
	
	// 평점 작성 버튼
	document.getElementById('openReviewModal').addEventListener("click", function() {


		
		// 로그인 된 상태
		if (userIdxStr.value !== '') {
			// 리뷰 작성 모달 열기
			$("#reviewModal").fadeIn(200);	
			
		}
		// 로그인 안된 상태
		else {
			// 로그인 페이지로 이동
			alert("로그인이 필요합니다.");	
			location.href = "${pageContext.request.contextPath}/userLogin.me";
		}

		
		$.ajax({
			url: '${pageContext.request.contextPath}/MovieDetailReview.mo',
			type: 'post',
			data: {'user_idx': userIdxStr.value},
			dataType: 'json',
			success: function(res) {

				const userImg = document.getElementById('userImg');
				const userNickname = document.getElementById('userNickname');
				
				userImg.src = res.data.userImg;
				userNickname.innerHTML = res.data.userNick;
				
			}
		});
		
	});
	
	// 모달 닫기 기능

		$("#closeReviewModal").on("click", function() {
		  $("#reviewModal").fadeOut(200);
		});

		// 바깥 영역 클릭 시 닫기
		$("#reviewModal").on("click", function(e) {
		  if (e.target === this) {
		    $(this).fadeOut(200);
		  }
		});

	// 내 평점 작성 버튼
	document.getElementById('my_btn').addEventListener("click", function() {
		
		// 로그인 된 상태 - 내가 쓴 평점 페이지로 이동
		if (userIdxStr.value !== '') {
			console.log("내 평점 작성 - 로그인 완");
			location.href = "";
		}
		// 로그인 안된 상태
		else {
			// 로그인 페이지로 이동
			alert("로그인이 필요합니다.");	
			location.href = "${pageContext.request.contextPath}/userLogin.me";
		}
		
	});

</script>


<!-- 모달창 관련 함수 -->
<script>


	$(document).ready(function() {
		// 대소문자, _ 확인 필요
		const MAX_BYTES = 280;
		const USER_IDX = document.getElementById('sessionUserIdx').value;
		const MOVIE_IDX = <%=movieIdx%>;
		if(USER_IDX == '0' || MOVIE_IDX == '0') {

			console.log(userIdx);
		}
		
		let selectedRating = "";

		// 텍스트 길이 제한 이벤트
		$("#reviewText").on("input", function() {
			let text = $(this).val();
			let encoder = new TextEncoder();
			let byteLength = encoder.encode(text).length;

			if (byteLength > MAX_BYTES) {
				$("#byteCount").css("color", "red");
			} else {
				$("#byteCount").css("color", "inherit");
			}

			$(this).val(text);
			$("#byteCount").text(byteLength);
		});

		// 평점 버튼 클릭 이벤트
		$(".rating-button").on("click", function() {
			selectedRating = $(this).data("rating");

			// 선택된 버튼에 스타일 적용
			$(".rating-button").removeClass("selected");
			$(this).addClass("selected");
		});

		// 리뷰 작성 완료 버튼 클릭 시
		$("#submitReview").on("click", function() {
			$("#submitReview").prop("disabled", true);
			const reviewText = $("#reviewText").val();

			if (selectedRating === "") {
				alert("평점을 선택해주세요.");
				return;
			} else if (!reviewText.trim()) {
				alert("리뷰 내용을 입력해주세요.");
				return;
			}

			// AJAX 비동기 통신
			$.ajax({
				url : '${pageContext.request.contextPath}/reviewWrite.re', // 서버의 엔드포인트
				type : "POST",
				data : {
					userIdx : USER_IDX,
					movieIdx : MOVIE_IDX,
					score : selectedRating,
					content : reviewText,
				},
				success : function(response) {
					alert("리뷰가 성공적으로 등록되었습니다.");
					// 초기화
					$("#reviewText").val("");
					$(".rating-button").removeClass("selected");
					selectedRating = "";
					console.log(response);
				},
				error : function() {
					alert("리뷰 등록에 실패했습니다. 다시 시도해주세요.");
				},
				complete : function() {
					$("#submitReview").prop("disabled", false);
				}
			});
		});
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
								'<span class="user_content">'+resp.data[i].reviewContent+'</span>' +
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
